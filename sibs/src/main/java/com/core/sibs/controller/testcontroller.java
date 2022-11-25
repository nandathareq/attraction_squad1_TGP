package com.core.sibs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.core.sibs.controller.entity.ExternalRequest;
import com.core.sibs.controller.entity.TransferRequest;
import com.core.sibs.service.DebitService;

@RestController
@RequestMapping("/core_banking")
public class testcontroller {

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
