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

    private String bookingCode;

    private String name;

    private String email;

    private int quantity;

    private long totalPrice;

    private boolean isPaid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "attraction_schedule_id")
    private AttractionSchedule schedule;
}
