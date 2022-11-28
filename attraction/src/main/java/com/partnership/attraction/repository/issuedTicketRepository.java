package com.partnership.attraction.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partnership.attraction.entity.IssuedTicket;

public interface issuedTicketRepository extends JpaRepository<IssuedTicket, Integer>{
    
}
