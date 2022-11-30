package com.partnership.attraction.service;

import java.text.*;
import java.util.*;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.partnership.attraction.controller.dto.TicketDto;
import com.partnership.attraction.entity.*;
import com.partnership.attraction.repository.*;

@Component
public class DisplayDataService {

    @Autowired
    AttractionPlaceRepository attractionPlaceRepo;

    @Autowired
    AttractionScheduleRepository attractionScheduleRepo;

    @Autowired
    InvoiceRepository invoiceRepo;

    @Autowired
    IssuedTicketRepository issuedTicketRepo;

    public List<AttractionPlace> showAttraction(String city, String category) {

        List<AttractionPlace> allAttraction;

        allAttraction = attractionPlaceRepo.findByCityAndCategory(city, category);

        if (city == null && category == null && allAttraction.isEmpty()) {
            return attractionPlaceRepo.findAll();
        }

        if (allAttraction.isEmpty()) {
            allAttraction = attractionPlaceRepo.findAllByCity(city);
        }

        if (allAttraction.isEmpty()) {
            allAttraction = attractionPlaceRepo.findAllByCategory(category);
        }

        return allAttraction;
    }

    public AttractionPlace showDetails(Integer id) {

        AttractionPlace place = attractionPlaceRepo.findById(id).get();

        return place;
    }

    public String isAvailable(int id, String date, int quantity) throws ParseException {

        Date dateParsed = new SimpleDateFormat("yyyy-MM-dd").parse(date);

        AttractionPlace attractionPlace = attractionPlaceRepo.findById(id).get();

        AttractionSchedule schedule = attractionScheduleRepo.findByAttractionPlaceAndDate(attractionPlace, dateParsed);

        if (attractionPlace == null) {
            return "Place not found!";
        }

        if (schedule == null) {
            return "Schedule not found!";
        }

        int availableTicket = schedule.getAvailableTicket() - quantity;

        if (availableTicket < 0) {
            return "Ticket not available";
        } else {
            return "Ticket Available";
        }
    }

    public List<TicketDto> getTickets(String bookingCode) {
        Invoice invoice = invoiceRepo.findByBookingCode(bookingCode);

        if (invoice == null || !invoice.isPaid()) {
            return null;
        }

        List<IssuedTicket> tickets = issuedTicketRepo.findByInvoice(invoice);

        List<TicketDto> ticketResponse = tickets.stream().map((o) -> {
            TicketDto ticket = new TicketDto();
            ticket.setTicketCode(o.getTicketCode());
            ticket.setQuantity(o.getQuantity());
            ticket.setDate(o.getSchedule().getDate());
            ticket.setAttractionName(o.getSchedule().getAttractionPlace().getPlaceName());
            return ticket;
        }).collect(Collectors.toList());

        return ticketResponse;
    }
}
