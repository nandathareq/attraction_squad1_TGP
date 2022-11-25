package com.partnership.attraction.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partnership.attraction.entity.AttractionPlace;

public interface AttractionPlaceRepository extends JpaRepository<AttractionPlace, Integer>{

    List<AttractionPlace> findByCityAndCategory(String city, String category);

    List<AttractionPlace> findAllByCity(String city);

    List<AttractionPlace> findAllByCategory(String city);
    
}
