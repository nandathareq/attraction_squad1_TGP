package com.partnership.attraction.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.partnership.attraction.entity.AttractionPlace;
import com.partnership.attraction.repository.AttractionPlaceRepository;

@Component
public class DisplayDataService {

    @Autowired
    AttractionPlaceRepository attractionPlaceRepo;


    public List<AttractionPlace> showAttraction(String city, String category) {

        List<AttractionPlace> allAttraction;

        allAttraction = attractionPlaceRepo.findByCityAndCategory("city", "category");

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
}
