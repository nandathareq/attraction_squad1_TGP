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
import id.agile.attractionreservation.repository.AttractionPlaceRepository;
import id.agile.attractionreservation.repository.AttractionReviewRepository;
import lombok.experimental.var;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api")
@CrossOrigin

public class AttractionPlaceController {

	final private AttractionPlaceRepository attractionPlaceRepository;

	


	public AttractionPlaceController(AttractionPlaceRepository attractionPlaceRepository) {
		this.attractionPlaceRepository = attractionPlaceRepository;
	

	}
	

	
	@GetMapping("/v1/attraction_place")
	public ResponseEntity<?> getAllAttractionPlace(HttpServletRequest request)  {
//		System.out.println("skjdf");

		List<AttractionPlace> listTemp = attractionPlaceRepository.findAll();
		for (AttractionPlace attractionPlace : listTemp) {
			List<AttractionReview> listTemp2 = new ArrayList<>(attractionPlace.getAttractionReviews());
			double placeRating = Math.round(listTemp2.stream().mapToDouble(AttractionReview::getPlaceRating).sum()/listTemp2.size() * 10.0) / 10.0;  
			attractionPlace.setPlaceRating(placeRating);
		}
		

		return new ResponseEntity<List<AttractionPlace>>(attractionPlaceRepository.findAll(),HttpStatus.OK);

		
	}
	



	
	
	
}
