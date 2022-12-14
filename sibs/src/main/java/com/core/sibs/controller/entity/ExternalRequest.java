package com.core.sibs.controller.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;
import lombok.experimental.Accessors;

@Getter
@Setter
@Accessors(chain = true)
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class ExternalRequest {

    private String noRekening;
    private String pin;
    private double nominal;
    private String kodeBooking;
    
}
