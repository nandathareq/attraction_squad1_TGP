package com.core.sibs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.core.sibs.controller.entity.*;
import com.core.sibs.service.DebitService;

@RestController
@RequestMapping("/core_banking/payment")
public class PaymentController {

    @Autowired
    DebitService debitService;

    @PostMapping("/internal/transfer")
    public Boolean trensferInternal(@RequestBody TransferRequest transferRequest) {

        return debitService.transferRekening(transferRequest.getNominal(), transferRequest.getRekeningIdAsal(), transferRequest.getCifAsal(), transferRequest.getRekeningIdTujuan(), transferRequest.getCifTujuan());
    }

    @PostMapping("/external/debet")
    public Boolean debitExternal(@RequestBody ExternalRequest externalRequest) {

        return debitService.debetRekeningExternal(externalRequest.getNominal(), externalRequest.getRekeningId(), externalRequest.getCif());
    }

    @PostMapping("/external/kredit")
    public Boolean test(@RequestBody ExternalRequest externalRequest) {

        return debitService.kreditRekeningExternal(externalRequest.getNominal(), externalRequest.getRekeningId(), externalRequest.getCif());
    }
    
}
