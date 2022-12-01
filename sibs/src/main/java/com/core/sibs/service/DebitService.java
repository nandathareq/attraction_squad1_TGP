package com.core.sibs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.core.sibs.controller.entity.ExternalRequest;
import com.core.sibs.entity.*;
import com.core.sibs.repository.*;

import java.util.HashMap;

import org.json.JSONObject;

@Component
public class DebitService {

    @Autowired
    RekeningNasabahRepository rekeningNasabahRepo;

    @Autowired
    RekeningRepository rekeningRepo;

    @Autowired
    NasabahRepository nasabahRepo;

    public boolean transferRekening(double nominal, long rekeningAsalId,
            long nasabahAsalId, long rekeningTujuanId, long nasabahTujuanId) {

        // Optional<Rekening> rekeningAsal = rekeningRepo.findById(rekeningAsalId);
        // Optional<Nasabah> nasabahAsal = nasabahRepo.findById(nasabahAsalId);

        // Optional<Rekening> rekeningTujuan = rekeningRepo.findById(rekeningTujuanId);
        // Optional<Nasabah> nasabahTujuan = nasabahRepo.findById(nasabahTujuanId);

        // // boolean isDebetSuccess = debetRekening(nominal, rekeningAsal,
        // nasabahAsal);
        // // if (isDebetSuccess) {
        // // kreditRekening(nominal, rekeningTujuan, nasabahTujuan);
        // // }

        return true;
    }

    public HashMap<String, Object> debetRekeningExternal(ExternalRequest externalRequest) {

        HashMap<String, Object> response = new HashMap<String, Object>();

        String pinRequest = externalRequest.getPin();
        String pinNasabah = rekeningNasabahRepo
                .findByNomorRekening(externalRequest.getNoRekening())
                .getNasabah()
                .getPin();

        if (!pinRequest.equals(pinNasabah)) {
            response.put("paymentSucces", false);
            response.put("detail", "pin invalid");
            return response;
        }

        String partnershipBookUrl = "http://localhost:8000/partnership/payment/payticket";

        RestTemplate restTemplate = new RestTemplate();

        JSONObject payPostPayload = new JSONObject();
        payPostPayload.put("kodeBooking", externalRequest.getKodeBooking());
        payPostPayload.put("nominal", externalRequest.getNominal());
        payPostPayload.put("idTransaksi", "9876876587668");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<String> entity = new HttpEntity<String>(payPostPayload.toString(), headers);

        boolean isPaid = restTemplate.postForObject(partnershipBookUrl, entity, Boolean.class);

        if (!isPaid) {
            response.put("paymentSucces", false);
            response.put("detail", "payment failed");
            return response;
        }

        boolean isDebetSuccess = debetRekening(externalRequest.getNominal(), externalRequest.getNoRekening());

        if (!isDebetSuccess) {
            response.put("paymentSucces", false);
            response.put("detail", "balance not enough");
            return response;
        }

        response.put("paymentSucces", true);
        response.put("idTransaction", "9876876587668");

        return response;
    }

    public boolean kreditRekeningExternal(ExternalRequest externalRequest) {

        boolean isKreditSuccess = kreditRekening(externalRequest.getNominal(), externalRequest.getNoRekening());

        return isKreditSuccess;
    }

    private boolean debetRekening(double nominal, String noRekening) {
        RekeningNasabah rekeningNasabah = rekeningNasabahRepo.findByNomorRekening(noRekening);

        if (rekeningNasabah == null) {
            return false;
        }

        double newBalance = rekeningNasabah.getBalance() - nominal;

        if (newBalance < 0) {
            return false;
        }

        rekeningNasabah.setBalance(newBalance);

        rekeningNasabahRepo.save(rekeningNasabah);
        return true;
    }

    private boolean kreditRekening(double nominal, String noRekening) {
        RekeningNasabah rekeningNasabah = rekeningNasabahRepo.findByNomorRekening(noRekening);

        if (rekeningNasabah == null) {
            return false;
        }

        double newBalance = rekeningNasabah.getBalance() + nominal;

        if (newBalance < 0) {
            return false;
        }

        rekeningNasabah.setBalance(newBalance);

        rekeningNasabahRepo.save(rekeningNasabah);
        return true;
    }
}
