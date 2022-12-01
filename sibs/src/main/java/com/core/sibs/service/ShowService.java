package com.core.sibs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.core.sibs.entity.Nasabah;
import com.core.sibs.entity.RekeningNasabah;
import com.core.sibs.repository.NasabahRepository;
import com.core.sibs.repository.RekeningNasabahRepository;

@Component
public class ShowService {

    @Autowired
    RekeningNasabahRepository rekeningNasabahRepo;

    @Autowired
    NasabahRepository nasabahRepo;

    public List<RekeningNasabah> getRekening(Long id) {
        Nasabah nasabah = nasabahRepo.findById(id).get();
        return rekeningNasabahRepo.findByNasabah(nasabah);
    }

    public HashMap<String, String> getRekeningDetail(String noRekening){

        RekeningNasabah rekening = rekeningNasabahRepo.findByNomorRekening(noRekening);

        HashMap<String, String> rekeningDetail = new HashMap<String, String>();
        rekeningDetail.put("nomorRekening", noRekening);
        rekeningDetail.put("nasabah", rekening.getNasabah().getNama());
        rekeningDetail.put("rekening", rekening.getRekeningId().getNama());

        return rekeningDetail;
    }

}
