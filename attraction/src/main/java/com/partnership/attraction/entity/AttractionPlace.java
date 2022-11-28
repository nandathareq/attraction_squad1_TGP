package com.partnership.attraction.entity;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

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

	@ManyToMany(cascade = CascadeType.ALL)
    @Column(name = "facility")
    @JoinTable(name = "attraction_facility",
    joinColumns = @JoinColumn(name = "attraction_place_id"),
    inverseJoinColumns = @JoinColumn(name = "facility_id"))
	private List<Facility> facilities;

	public List<String> getFacilities(){
		return this.facilities.stream().map(Facility::getFacilityName).collect(Collectors.toList());
	}

	public String getPicture(){
		return "https://picsum.photos/300/200";
	}

	public String getContactPerson(){
		return "+628" + (10000000 + (new Random()).nextInt(900000000));
	}
}

