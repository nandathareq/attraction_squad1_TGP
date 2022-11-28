package com.partnership.attraction.entity;

import java.util.Date;

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
	
	private Date date;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "attraction_place_id", nullable = false)
	private AttractionPlace attractionPlace;
	
}

