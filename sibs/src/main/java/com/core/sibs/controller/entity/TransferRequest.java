package com.core.sibs.controller.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;
import lombok.experimental.Accessors;

@Getter
@Setter
@Accessors(chain = true)
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class TransferRequest {
    
    private long cifAsal;
    private long rekeningIdAsal;

    private long cifTujuan;
    private long rekeningIdTujuan;

    private double nominal;

}
