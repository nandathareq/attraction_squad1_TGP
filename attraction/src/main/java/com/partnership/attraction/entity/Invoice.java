package com.partnership.attraction.entity;

import java.util.List;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class Invoice {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

    private String idInvoice;   
    
    private String bookingCode;

    private String name;

    private String email;

    private long totalPrice;

    private boolean isPaid;

    @OneToMany(mappedBy = "invoice", cascade = CascadeType.ALL)
    private List<IssuedTicket> tickets;
}
