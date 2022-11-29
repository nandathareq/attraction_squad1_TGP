package com.partnership.attraction.controller.dto;

import lombok.*;

@Getter
@Setter
public class BookingCodeDto {
    private String idInvoice;
    private String bookingCode;
    private long total;
}
