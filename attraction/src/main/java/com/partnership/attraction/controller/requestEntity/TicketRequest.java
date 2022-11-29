package com.partnership.attraction.controller.requestEntity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.*;

@Getter
@Setter
public class TicketRequest {
    
    private int attractionPlaceId;
    private int quantity;
    private Date date;

    void setDate(String date) throws ParseException{
        Date dateParsed = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        this.date = dateParsed;
    }
}
