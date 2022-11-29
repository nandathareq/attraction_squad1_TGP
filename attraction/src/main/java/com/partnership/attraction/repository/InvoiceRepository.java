package com.partnership.attraction.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partnership.attraction.entity.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer>{
    
}
