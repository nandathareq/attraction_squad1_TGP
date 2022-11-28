package com.partnership.attraction.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.partnership.attraction.entity.AttractionPlace;
import com.partnership.attraction.entity.AttractionSchedule;
import com.partnership.attraction.repository.AttractionPlaceRepository;
import com.partnership.attraction.repository.AttractionScheduleRepository;

@Component
public class DisplayDataService {

    @Autowired
    AttractionPlaceRepository attractionPlaceRepo;

    @Autowired
    AttractionScheduleRepository attractionScheduleRepo;


    public List<AttractionPlace> showAttraction(String city, String category) {

        List<AttractionPlace> allAttraction;

        allAttraction = attractionPlaceRepo.findByCityAndCategory(city, category);

        if(city == null && category == null && allAttraction.isEmpty()){
            return attractionPlaceRepo.findAll();
        }

        if(allAttraction.isEmpty()){
            allAttraction = attractionPlaceRepo.findAllByCity(city);
        }

        if(allAttraction.isEmpty()){
            allAttraction = attractionPlaceRepo.findAllByCategory(category);
        }
        
        return allAttraction;
    }

    public AttractionPlace showDetails(Integer id){
        
        AttractionPlace place = attractionPlaceRepo.findById(id).get();
        
        return place;
    }

    public String isAvailable(int id, String date, int quantity) throws ParseException {

        Date dateParsed = new SimpleDateFormat("yyyy-MM-dd").parse(date);

        AttractionPlace attractionPlace = attractionPlaceRepo.findById(id).get();

        AttractionSchedule schedule = attractionScheduleRepo.findByAttractionPlaceAndDate(attractionPlace, dateParsed);

        if(attractionPlace == null){
            return "Place not found!";
        }

        if(schedule == null){
            return "Schedule not found!";
        }

        int availableTicket = schedule.getAvailableTicket() - quantity;

        if(availableTicket < 0 ){
            return "Ticket not available";
        } else {
            return "Ticket Available";
        }
    }


}
