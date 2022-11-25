package id.agile.attractionreservation.controller;


import java.awt.print.Printable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import id.agile.attractionreservation.entity.AttractionPlace;
import id.agile.attractionreservation.entity.AttractionReview;
import id.agile.attractionreservation.entity.AttractionSchedule;
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


	
	@GetMapping("/v1/ticket/book")
	public ResponseEntity<?> getAllAttractionSchedule(@RequestBody Map<String, String> body,HttpServletRequest request)  {
		int attractionScheduleId = Integer.parseInt(body.get("attractionScheduleId")) ;
		AttractionSchedule attractionSchedule = attractionScheduleRepository.findById(attractionScheduleId).get();
		
		
		
		return new ResponseEntity<List<AttractionSchedule>>(attractionScheduleRepository.findAll(),HttpStatus.OK);

		
	}
	



	
	
	
}
