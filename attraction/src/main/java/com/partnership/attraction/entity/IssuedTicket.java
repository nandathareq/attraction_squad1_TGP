package com.partnership.attraction.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class IssuedTicket {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

    private String ticketCode;

    private int quantity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "attraction_schedule_id")
    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    private AttractionSchedule schedule;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idInvoice")
    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    private Invoice invoice;
}
