package id.agile.attractionreservation.controller;


import java.awt.print.Printable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.ValidationException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder.BCryptVersion;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import id.agile.attractionreservation.entity.AttractionPlace;
import id.agile.attractionreservation.entity.AttractionReview;
import id.agile.attractionreservation.entity.AttractionSchedule;
import id.agile.attractionreservation.entity.GrandInvoice;
import id.agile.attractionreservation.entity.InvoiceItem;
import id.agile.attractionreservation.entity.SubInvoice;
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
	public void getAllAttractionSchedule(@RequestBody Map<String, ?> body,HttpServletRequest request)  {
		TimeZone tz = TimeZone.getTimeZone("GMT+07:00");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'"); // Quoted "Z" to indicate UTC, no timezone offset
		df.setTimeZone(tz);
		String nowAsISO = df.format(new Date(System.currentTimeMillis()));
		String deadlineAsISO = df.format(new Date(System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(60)));


		double grandTotal =(double) body.get("grandTotal");
		List<Map<String,?>> subInvoicesRequest = (List<Map<String, ?>>) body.get("subInvoice");
		
		User user = userRepository.findByEmail((String) body.get("issuer"));
		GrandInvoice grandInvoice = new GrandInvoice(grandTotal,nowAsISO,deadlineAsISO,"UNPAID",user);
		grandInvoiceRepository.save(grandInvoice);
		
		
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
				InvoiceItem invoiceItem = new InvoiceItem(qty,attractionPlaceId,placeName,subTotal,subInvoice);
				subInvoice.addInvoiceItem(invoiceItem);
				invoiceItemRepository.save(invoiceItem);
			}
			grandInvoice.addSubInvoice(subInvoice);
			subInvoiceRepository.save(subInvoice);
		}
		grandInvoiceRepository.save(grandInvoice);
		

	}
	
	@GetMapping("/v1/ticket/getAttraction")
	public void getAttraction(HttpServletRequest request)  {
		final String uri = "http://localhost:8000/partnership/details";

	    RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject(uri, String.class);

	    System.out.println(result);
	}
	



	
	
	
}
