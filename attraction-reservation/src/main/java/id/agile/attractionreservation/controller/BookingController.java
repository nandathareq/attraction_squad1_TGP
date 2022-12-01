package id.agile.attractionreservation.controller;


import java.awt.print.Printable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.ValidationException;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder.BCryptVersion;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import id.agile.attractionreservation.entity.AttractionPlace;
import id.agile.attractionreservation.entity.AttractionReview;
import id.agile.attractionreservation.entity.AttractionSchedule;
import id.agile.attractionreservation.entity.GrandInvoice;
import id.agile.attractionreservation.entity.InvoiceItem;
import id.agile.attractionreservation.entity.SubInvoice;
import id.agile.attractionreservation.entity.Ticket;
import id.agile.attractionreservation.entity.User;
import id.agile.attractionreservation.repository.AttractionPlaceRepository;
import id.agile.attractionreservation.repository.AttractionReviewRepository;
import id.agile.attractionreservation.repository.AttractionScheduleRepository;
import id.agile.attractionreservation.repository.GrandInvoiceRepository;
import id.agile.attractionreservation.repository.InvoiceItemRepository;
import id.agile.attractionreservation.repository.SubInvoiceRepository;
import id.agile.attractionreservation.repository.TicketRepository;
import id.agile.attractionreservation.repository.UserRepository;
import lombok.experimental.var;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api")
@CrossOrigin

public class BookingController {

	final private AttractionScheduleRepository attractionScheduleRepository;
	final private AttractionPlaceRepository attractionPlaceRepository;
	final private UserRepository userRepository;
	final private GrandInvoiceRepository grandInvoiceRepository;
	final private SubInvoiceRepository subInvoiceRepository;
	final private InvoiceItemRepository invoiceItemRepository;
	final private TicketRepository ticketRepository;


public BookingController(AttractionScheduleRepository attractionScheduleRepository,
			AttractionPlaceRepository attractionPlaceRepository, UserRepository userRepository,
			GrandInvoiceRepository grandInvoiceRepository, SubInvoiceRepository subInvoiceRepository,
			InvoiceItemRepository invoiceItemRepository, TicketRepository ticketRepository) {

		this.attractionScheduleRepository = attractionScheduleRepository;
		this.attractionPlaceRepository = attractionPlaceRepository;
		this.userRepository = userRepository;
		this.grandInvoiceRepository = grandInvoiceRepository;
		this.subInvoiceRepository = subInvoiceRepository;
		this.invoiceItemRepository = invoiceItemRepository;
		this.ticketRepository = ticketRepository;
	}


	
	@PostMapping("/v1/ticket/book")
	public ResponseEntity bookTicket(@RequestBody Map<String, ?> body,HttpServletRequest request)  {
		System.out.println(body.toString());
		TimeZone tz = TimeZone.getTimeZone("GMT+07:00");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'"); // Quoted "Z" to indicate UTC, no timezone offset
		df.setTimeZone(tz);
		String nowAsISO = df.format(new Date(System.currentTimeMillis()));
		String deadlineAsISO = df.format(new Date(System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(60)));


		double grandTotal =(double) body.get("grandTotal");
		List<Map<String,?>> subInvoicesRequest = (List<Map<String, ?>>) body.get("subInvoice");
//		System.out.println(subInvoicesRequest.toString().substring(1, subInvoicesRequest.toString().length()-1));
		
		User user = userRepository.findByEmail((String) body.get("issuer"));
		GrandInvoice grandInvoice = new GrandInvoice(grandTotal,nowAsISO,deadlineAsISO,"UNPAID",user);
		grandInvoiceRepository.save(grandInvoice);
		
		String partnershipBookUrl = "http://localhost:8000/partnership/payment/bookticket";

		RestTemplate restTemplate = new RestTemplate();


		JSONArray itemsPost = new JSONArray();
		JSONArray subInvoicesPost = new JSONArray();
		JSONObject partnershipPost = new JSONObject();
		JSONObject returnJson = new JSONObject();
		JSONArray bookingCodesReturnJson = new JSONArray();
		
		returnJson.put("response", true);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
			
		
		for (Map<String, ?> subInvoiceRequest : subInvoicesRequest) {
			User userSubInvoice = userRepository.findByEmail((String) subInvoiceRequest.get("issuedTo"));
			double total = (double) subInvoiceRequest.get("total");
			
			SubInvoice subInvoice = new SubInvoice(total,nowAsISO,deadlineAsISO,"UNPAID",grandInvoice,userSubInvoice);
			subInvoiceRepository.save(subInvoice);
			List<Map<String,?>> subInvoiceItemsRequest = (List<Map<String, ?>>) subInvoiceRequest.get("items");
			for (Map<String, ?> subInvoiceItemRequest : subInvoiceItemsRequest) {
				int attractionPlaceId = (int) subInvoiceItemRequest.get("attractionPlaceId");
				String placeName = (String) subInvoiceItemRequest.get("placeName");
				int qty = (int) subInvoiceItemRequest.get("qty");
				double subTotal = (double) subInvoiceItemRequest.get("subTotal");
				String attractionDate = (String) subInvoiceItemRequest.get("date");
				InvoiceItem invoiceItem = new InvoiceItem(qty,attractionPlaceId,placeName,subTotal,subInvoice,attractionDate);
				subInvoice.addInvoiceItem(invoiceItem);
				invoiceItemRepository.save(invoiceItem);
				
				
				String now = (String) subInvoiceItemRequest.get("date");
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm'Z'");
		        LocalDateTime formatDateTime = LocalDateTime.parse(now, formatter);
		        
				DateTimeFormatter dfPost2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");   // Quoted "Z" to indicate UTC, no timezone offset
				String nowPost = formatDateTime.format(dfPost2);

				JSONObject itemPost = new JSONObject();
				itemPost.put("attractionPlaceId", attractionPlaceId);
				itemPost.put("quantity", qty);
				itemPost.put("date", nowPost);
				itemsPost.put(itemPost);
				
			}
			
			
			grandInvoice.addSubInvoice(subInvoice);
			subInvoiceRepository.save(subInvoice);
			JSONObject subInvoicePost = new JSONObject();
			subInvoicePost.put("email", userSubInvoice.getEmail());
			subInvoicePost.put("name", userSubInvoice.getFirstName()+" "+userSubInvoice.getLastName());
			subInvoicePost.put("idInvoice", subInvoice.getId());
			
			subInvoicePost.put("tickets", itemsPost);
//			subInvoicesPost.put(subInvoicePost);
			HttpEntity<String> entity = new HttpEntity<String>(subInvoicePost.toString(),headers);
			
			String respPost = restTemplate.postForObject(partnershipBookUrl, entity, String.class);
			JSONObject respJsonPost = new JSONObject(respPost);
			subInvoice.setBookingCode(respJsonPost.get("bookingCode").toString());
			JSONObject bookingCodeReturnJson = new JSONObject();
			bookingCodeReturnJson.put("bookingCode", respJsonPost.get("bookingCode").toString());
			bookingCodesReturnJson.put(bookingCodeReturnJson);
			
			System.out.println(subInvoicePost.toString());

	
		}
//		partnershipPost.put("subInvoice",subInvoicesPost);
		grandInvoiceRepository.save(grandInvoice);
		returnJson.put("bookingCodes", bookingCodesReturnJson);
		
		
		
		
		
//		return returnJson.toString();
		return new ResponseEntity<String>(returnJson.toString(),HttpStatus.OK);
		
		
		

	}
	
	@GetMapping("/v1/ticket/getAttraction")
	public void getAttraction(HttpServletRequest request)  {
		final String uri = "http://localhost:8000/partnership/details";

	    RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject(uri, String.class);

	}
	
	@GetMapping("/v1/subInvoice/detail")
	public ResponseEntity<?> getSubInvoiceDetail(HttpServletRequest request,@RequestParam(required = false) Map<String, String> params)  {
		JSONObject subInvoiceJson = new JSONObject();
		JSONArray subInvoiceItemsJson = new JSONArray();
		JSONObject userJson = new JSONObject();

		String bookingCode = params.get("bookingCode") ;
		
		Optional<SubInvoice> subInvoice = subInvoiceRepository.getOneByBookingCode(bookingCode);
		subInvoiceJson.put("subInvoiceId",subInvoice.get().getId());
		subInvoiceJson.put("bookingCode",subInvoice.get().getBookingCode());	
		subInvoiceJson.put("raisedDate",subInvoice.get().getRaisedDate());
		subInvoiceJson.put("dueDate",subInvoice.get().getDueDate());
		subInvoiceJson.put("status",subInvoice.get().getStatus());
		subInvoiceJson.put("grandInvoiceId",subInvoice.get().getGrandInvoice().getId());
		
	
//		subInvoiceJson.put("nomorRekening", subInvoice.get().getAccountNumber());

		if(!subInvoice.get().getStatus().equals("UNPAID")) {
			System.out.println("masuk sini cok");
			String checkRekeningSibsUrl = "http://localhost:8080/core_banking/details/rekening/"+subInvoice.get().getAccountNumber();
			RestTemplate restTemplate = new RestTemplate();
			String respPost = restTemplate.getForObject(checkRekeningSibsUrl, String.class);
			JSONObject respJsonPost = new JSONObject(respPost);
			subInvoiceJson.put("nomorRekening", subInvoice.get().getAccountNumber());
			JSONObject rekeningDetail = new JSONObject();
			rekeningDetail.put("nasabah", respJsonPost.get("nasabah"));
			rekeningDetail.put("nomorRekening", respJsonPost.get("nomorRekening"));
			rekeningDetail.put("rekening", respJsonPost.get("rekening"));
			
			subInvoiceJson.put("rekeningInfo", rekeningDetail);
		}
		
		
		subInvoiceJson.put("idTransaksi", subInvoice.get().getIdTransaction());
		subInvoiceJson.put("paidDate",subInvoice.get().getPaidDate());
		subInvoiceJson.put("total",subInvoice.get().getTotal());

		userJson.put("userId", subInvoice.get().getUser().getId());
		userJson.put("userName", subInvoice.get().getUser().getFirstName()+" "+subInvoice.get().getUser().getLastName());
		userJson.put("userEmail", subInvoice.get().getUser().getEmail());
		subInvoiceJson.put("user", userJson);
		
		
		
		
		for (InvoiceItem invoiceItem : subInvoice.get().getInvoiceItems()) {
			JSONObject subInvoiceItemJson = new JSONObject();
			subInvoiceItemJson.put("placeName",invoiceItem.getPlaceName());
			subInvoiceItemJson.put("qty",invoiceItem.getQty());
			subInvoiceItemJson.put("subTotal",invoiceItem.getSubTotal());
			subInvoiceItemJson.put("attractionDate",invoiceItem.getAttractionDate());
			subInvoiceItemsJson.put(subInvoiceItemJson);
		}
		subInvoiceJson.put("items",subInvoiceItemsJson);

		return new ResponseEntity<Map<String,Object>>(subInvoiceJson.toMap(),HttpStatus.OK);

		
	}
	
	@GetMapping("/v1/ticket/detail")
	public ResponseEntity<?> getTicketDetail(HttpServletRequest request,@RequestParam(required = false) Map<String, String> params)  {
		JSONObject ticketRespJson = new JSONObject();
		JSONArray ticketsJson = new JSONArray();
		JSONObject userJson = new JSONObject();

		String bookingCode = params.get("bookingCode") ;
		
		List<Ticket> tickets = ticketRepository.findByBookingCode(bookingCode);

		Optional<SubInvoice> subInvoice = subInvoiceRepository.getOneByBookingCode(bookingCode);
		
		userJson.put("userId", subInvoice.get().getUser().getId());
		userJson.put("userName", subInvoice.get().getUser().getFirstName()+" "+subInvoice.get().getUser().getLastName());
		userJson.put("userEmail", subInvoice.get().getUser().getEmail());
		userJson.put("userMobileNumber", subInvoice.get().getUser().getMobileNumber());
		ticketRespJson.put("user", userJson);

		for (Ticket ticket : tickets) {
			JSONObject ticketJson = new JSONObject();
			ticketJson.put("ticketId",ticket.getId());
//			ticketJson.put("attractionPlaceId",ticket.getAttractionPlaceId());
			ticketJson.put("placeName",ticket.getPlaceName());
			ticketJson.put("attractionDate",ticket.getAttractionDate());
			ticketJson.put("bookingCode",ticket.getBookingCode());
			ticketJson.put("ticketCode",ticket.getTicketCode());
			ticketsJson.put(ticketJson);
			
		}
		
		ticketRespJson.put("tickets", ticketsJson);
		
		return new ResponseEntity<Map<String,Object>>(ticketRespJson.toMap(),HttpStatus.OK);

		
	}
	
	@PostMapping("/v1/ticket/pay")
	public ResponseEntity<?> getAllAttractionSchedule(@RequestBody Map<String, ?> body,HttpServletRequest request)  {
		JSONObject respJson = new JSONObject();
		respJson.put("nominal", body.get("grandTotal"));

		respJson.put("kodeBooking", body.get("bookingCode"));
		respJson.put("noRekening", body.get("nomorRekening"));
		respJson.put("pin", body.get("pin"));
		
		System.out.println("masuk sini");
		System.out.println(body.toString());
		System.out.println(respJson.toString());
		
		

		String partnershipPayUrl = "http://localhost:8080/core_banking/payment/external/debet";
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> entity = new HttpEntity<String>(respJson.toString(),headers);
		
		String respPost = restTemplate.postForObject(partnershipPayUrl, entity, String.class);
		JSONObject respJsonPost = new JSONObject(respPost);
		
		if (respJsonPost.get("paymentSucces").toString().equals("true")) {
			SubInvoice subInvoice = subInvoiceRepository.getOneByBookingCode(body.get("bookingCode").toString()).get();
			TimeZone tz = TimeZone.getTimeZone("GMT+07:00");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'"); // Quoted "Z" to indicate UTC, no timezone offset
			df.setTimeZone(tz);
			String nowAsISO = df.format(new Date(System.currentTimeMillis()));
			subInvoice.setPaidDate(nowAsISO);
			subInvoice.setAccountNumber(body.get("nomorRekening").toString());
			subInvoice.setIdTransaction(respJsonPost.get("idTransaction").toString());
			subInvoice.setStatus("PAID");
			GrandInvoice grandInvoice = grandInvoiceRepository.findById(subInvoice.getGrandInvoice().getId()).get();
			grandInvoice.setStatus("PAID");
			grandInvoiceRepository.save(grandInvoice);
			subInvoiceRepository.save(subInvoice);
			
			String partnershipTicketUrl = "http://localhost:8000/partnership/ticket/"+body.get("bookingCode").toString();
			RestTemplate restTicketTemplate = new RestTemplate();
//			HttpHeaders headersTicket = new HttpHeaders();
//			headers.setContentType(MediaType.APPLICATION_JSON);
//			HttpEntity<String> entity = new HttpEntity<String>(respJson.toString(),headers);
			
			String respTicketGet = restTicketTemplate.getForObject(partnershipTicketUrl, String.class);
//			JSONObject respTicketJsonGet = new JSONObject(respTicketGet);
			JSONArray respTicketJsonGet = new JSONArray(respTicketGet);
			
			for (Object object : respTicketJsonGet) {
				JSONObject ticketJson = new JSONObject(object.toString());
				
				String bookingCodeTicket = body.get("bookingCode").toString();
				String ticketCode = ticketJson.get("ticketCode").toString();
				User userTicket = subInvoice.getUser();
				String dateTicket = ticketJson.get("date").toString();
				String placeNameTicket = ticketJson.get("attractionName").toString();
				
				Ticket ticket = new Ticket(bookingCodeTicket, ticketCode, userTicket, dateTicket, placeNameTicket);
				userTicket.addTicket(ticket);
				ticketRepository.save(ticket);
				userRepository.save(userTicket);
			}
			

			
//			InvoiceItem invoiceItem = new InvoiceItem(qty,attractionPlaceId,placeName,subTotal,subInvoice,attractionDate);
			
		}

		return new ResponseEntity<Map<String,Object>>(respJsonPost.toMap(),HttpStatus.OK);
		

		
		
		

	}
	
	@GetMapping("/v1/subInvoice")
	public ResponseEntity<?> getSubInvoiceList(HttpServletRequest request,@RequestParam(required = false) Map<String, String> params)  {
		
		
		int userId = Integer.parseInt(params.get("userId")) ;
		User user = userRepository.findById(userId).get();
		List<SubInvoice> subInvoiceByUser = subInvoiceRepository.findByUserOrderByIdDesc(user);
		
		return new ResponseEntity<List<SubInvoice>>(subInvoiceByUser,HttpStatus.OK);
		

		
	}



	
	
	
}
