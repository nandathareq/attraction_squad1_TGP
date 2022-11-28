package com.partnership.attraction.entity;


import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class Facility {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="facility_id")
	@JsonIgnore
	private int id;
	
	@Column(name="facility_name")
	private String facilityName;

	@ManyToMany(mappedBy = "facilities")
	@JsonIgnore
	private List<AttractionPlace> attractions;

}
