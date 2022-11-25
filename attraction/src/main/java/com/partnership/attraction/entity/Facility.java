package com.partnership.attraction.entity;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class Facility {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="facility_id")
	private int id;
	
	@Column(name="facility_name")
	private String facility_name;

}

