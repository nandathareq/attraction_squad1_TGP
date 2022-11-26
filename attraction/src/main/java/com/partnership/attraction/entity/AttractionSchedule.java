package com.partnership.attraction.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class AttractionSchedule {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="attraction_schedule_id")
	private int id;
	
	@Column(name="available_ticket")
	private int availableTicket;
	
	@Column(name="attraction_date")
	private String attractionDate;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "attraction_place_id", nullable = false)
	private AttractionPlace attractionPlace;
	
}

