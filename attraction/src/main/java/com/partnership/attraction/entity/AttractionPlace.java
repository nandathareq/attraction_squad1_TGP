package com.partnership.attraction.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class AttractionPlace {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="attraction_place_id")
	private int id;
	
	@Column(name="place_name")
	private String placeName;
	
	@Column(name="description")
	private String description;
	
	@Column(name="category")
	private String category;
	
	@Column(name="city")
	private String city;
	
	@Column(name="price")
	private long price;
	
	@Column(name="lattitude")
	private double lattitude;
	
	@Column(name="longitude")
	private double longitude;
	
	@Column(name="open_hour")
	private String openHour;
	
	@Column(name="close_hour")
	private String closeHour;
	
	@Column(name="place_rating")
	private double placeRating;

}

