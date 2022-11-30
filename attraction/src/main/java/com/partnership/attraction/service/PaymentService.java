package com.partnership.attraction.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.partnership.attraction.controller.dto.BookingCodeDto;
import com.partnership.attraction.controller.requestEntity.*;
import com.partnership.attraction.entity.*;
import com.partnership.attraction.repository.*;

@Component
public class PaymentService {

    @Autowired
    AttractionScheduleRepository attractionScheduleRepo;

    @Autowired
    AttractionPlaceRepository attractionPlaceRepo;

    @Autowired
    IssuedTicketRepository issuedTicketRepo;

    @Autowired
    InvoiceRepository invoiceRepo;

    public boolean receivePayment(PaymentRequest paymentRequest){

        Invoice invoice = invoiceRepo.findByBookingCode(paymentRequest.getKodeBooking());

        if(invoice.getTotalPrice() != paymentRequest.getNominal()){
            return false;
        }

        invoice.setPaid(true);

        invoiceRepo.save(invoice);

        return true;
    }

    public BookingCodeDto generateBookingCode(InvoiceRequest invoiceRequest) {

        if (!ticketsAvailabilityCheck(invoiceRequest.getTickets())) {
            return null;
        }

        Invoice invoice = new Invoice();
        invoice.setIdInvoice(invoiceRequest.getIdInvoice());
        invoice.setName(invoiceRequest.getName());
        invoice.setEmail(invoiceRequest.getEmail());
        invoice.setBookingCode(generateString(6));
        invoice.setPaid(false);
        invoice.setTotalPrice(0);
        invoiceRepo.save(invoice);
        
        for (TicketRequest ticket : invoiceRequest.getTickets()) {

            AttractionPlace attractionPlace = attractionPlaceRepo.findById(ticket.getAttractionPlaceId()).get();

            AttractionSchedule schedule = attractionScheduleRepo.findByAttractionPlaceAndDate(attractionPlace,
                    ticket.getDate());

            schedule.setAvailableTicket(schedule.getAvailableTicket() - ticket.getQuantity());

            invoice.setTotalPrice(invoice.getTotalPrice() + ticket.getQuantity()*attractionPlace.getPrice());

            invoiceRepo.save(invoice);

            IssuedTicket issuedTicket = new IssuedTicket();

            issuedTicket.setInvoice(invoice);
            issuedTicket.setQuantity(ticket.getQuantity());
            issuedTicket.setTicketCode((generateString(5)));
            issuedTicket.setSchedule(schedule);
            
            issuedTicketRepo.save(issuedTicket);
        }

        BookingCodeDto bookingCode =new BookingCodeDto();

        bookingCode.setBookingCode(invoice.getBookingCode());
        bookingCode.setIdInvoice(invoiceRequest.getIdInvoice());
        bookingCode.setTotal(invoice.getTotalPrice());

        return bookingCode;

    }

    private boolean ticketsAvailabilityCheck(List<TicketRequest> tickets) {

        List<Boolean> isAvailable = new LinkedList<Boolean>();

        for (TicketRequest ticket : tickets) {

            AttractionPlace attractionPlace = attractionPlaceRepo.findById(ticket.getAttractionPlaceId()).get();

            AttractionSchedule schedule = attractionScheduleRepo.findByAttractionPlaceAndDate(attractionPlace,
                    ticket.getDate());

            int availableTicket = schedule.getAvailableTicket() - ticket.getQuantity();

            if (availableTicket < 0) {
                isAvailable.add(false);
            } else {
                isAvailable.add(true);
            }

        }

        return !isAvailable.contains(false);
    }

    private String generateString(int n) {

        String AlphaNumericString = "0123456789"
                + "abcdefghijklmnopqrstuvxyz";

        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {

            int index = (int) (AlphaNumericString.length()
                    * Math.random());

            sb.append(AlphaNumericString
                    .charAt(index));
        }

        return sb.toString();
    }
}
