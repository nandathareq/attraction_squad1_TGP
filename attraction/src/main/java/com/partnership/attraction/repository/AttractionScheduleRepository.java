package com.partnership.attraction.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partnership.attraction.entity.AttractionPlace;
import com.partnership.attraction.entity.AttractionSchedule;

public interface AttractionScheduleRepository extends JpaRepository<AttractionSchedule, Integer>{

    AttractionSchedule findByAttractionPlaceAndDate(AttractionPlace attractionPlace, Date date);

}
