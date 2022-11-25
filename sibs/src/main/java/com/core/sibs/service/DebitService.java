package com.core.sibs.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.core.sibs.entity.Nasabah;
import com.core.sibs.entity.Rekening;
import com.core.sibs.entity.RekeningNasabah;
import com.core.sibs.repository.NasabahRepository;
import com.core.sibs.repository.RekeningNasabahRepository;
import com.core.sibs.repository.RekeningRepository;

@Component
public class DebitService {

    @Autowired
    RekeningNasabahRepository rekeningNasabahRepo;

    @Autowired
    RekeningRepository rekeningRepo;

    @Autowired
    NasabahRepository nasabahRepo;

    public boolean transferRekening(double nominal, long rekeningAsalId, 
    long nasabahAsalId, long rekeningTujuanId, long nasabahTujuanId){

        Optional<Rekening> rekeningAsal = rekeningRepo.findById(rekeningAsalId);
        Optional<Nasabah> nasabahAsal = nasabahRepo.findById(nasabahAsalId);
        
        Optional<Rekening> rekeningTujuan = rekeningRepo.findById(rekeningTujuanId);
        Optional<Nasabah> nasabahTujuan = nasabahRepo.findById(nasabahTujuanId);

        boolean isDebetSuccess = debetRekening(nominal, rekeningAsal, nasabahAsal);
        if(isDebetSuccess){
            kreditRekening(nominal, rekeningTujuan, nasabahTujuan);
        }

        return isDebetSuccess;
    }

    public boolean debetRekeningExternal(double nominal, long rekeningAsalId, long nasabahAsalId){

        Optional<Rekening> rekeningAsal = rekeningRepo.findById(rekeningAsalId);
        Optional<Nasabah> nasabahAsal = nasabahRepo.findById(nasabahAsalId);

        boolean isDebetSuccess = debetRekening(nominal, rekeningAsal, nasabahAsal);

        return isDebetSuccess;
    }

    public Boolean kreditRekeningExternal(double nominal, long rekeningAsalId, long nasabahAsalId) {
        
        Optional<Rekening> rekeningAsal = rekeningRepo.findById(rekeningAsalId);
        Optional<Nasabah> nasabahAsal = nasabahRepo.findById(nasabahAsalId);

        boolean isKreditSuccess = kreditRekening(nominal, rekeningAsal, nasabahAsal);

        return isKreditSuccess;
    }

    private boolean debetRekening(double nominal, Optional<Rekening> rekeningAsal, Optional<Nasabah> nasabahAsal) {
        RekeningNasabah rekeningNasabah = rekeningNasabahRepo
                .findByNasabahCifAndRekeningId(nasabahAsal, rekeningAsal);

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

    private boolean kreditRekening(double nominal, Optional<Rekening> rekeningTujuan, Optional<Nasabah> nasabahTujuan) {
        RekeningNasabah rekeningNasabah = rekeningNasabahRepo
                .findByNasabahCifAndRekeningId(nasabahTujuan, rekeningTujuan);

        if (rekeningNasabah == null) {
            return false;
        }

        rekeningNasabah.setBalance(rekeningNasabah.getBalance() + nominal);

        rekeningNasabahRepo.save(rekeningNasabah);

        return true;
    }
}
