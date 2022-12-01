package com.partnership.attraction.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partnership.attraction.entity.Invoice;
import com.partnership.attraction.entity.IssuedTicket;

public interface IssuedTicketRepository extends JpaRepository<IssuedTicket, Integer>{

    List<IssuedTicket> findByInvoice(Invoice invoice);
    
}
