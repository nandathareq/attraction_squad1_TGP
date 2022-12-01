package com.partnership.attraction.controller.dto;

import java.util.Date;

import lombok.*;

@Getter
@Setter
public class TicketDto {
    private String ticketCode;
    private int quantity;
    private String attractionName;
    private Date date;
}
