package com.partnership.attraction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.partnership.attraction.controller.dto.BookingCodeDto;
import com.partnership.attraction.controller.requestEntity.InvoiceRequest;
import com.partnership.attraction.service.PaymentService;

@RestController
@RequestMapping("/partnership/payment")
public class PaymentController {

    @Autowired
    PaymentService paymentService;

    @PostMapping("/bookticket")
    public BookingCodeDto bookTicket(@RequestBody InvoiceRequest invoiceRequest){
        return paymentService.generateBookingCode(invoiceRequest);
    }
    
}
