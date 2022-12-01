package com.partnership.attraction.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    private List<IssuedTicket> tickets;
}
