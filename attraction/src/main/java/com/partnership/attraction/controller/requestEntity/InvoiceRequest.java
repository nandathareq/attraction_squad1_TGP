package com.partnership.attraction.controller.requestEntity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;
import lombok.experimental.Accessors;

@Getter
@Setter
@Accessors(chain = true)
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class InvoiceRequest {
    
    private String name;
    private String email;
    private String idInvoice;

    private List<TicketRequest> tickets;
}
