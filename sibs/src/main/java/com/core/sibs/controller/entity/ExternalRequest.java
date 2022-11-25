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

    private long cif;
    private long rekeningId;
    private double nominal;
    
}
