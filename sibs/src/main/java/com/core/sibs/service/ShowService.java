package com.core.sibs.service;

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

}
