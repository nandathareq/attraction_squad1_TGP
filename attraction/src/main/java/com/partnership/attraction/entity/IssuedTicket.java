package com.partnership.attraction.entity;

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
    private AttractionSchedule schedule;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idInvoice")
    private Invoice invoice;
}
