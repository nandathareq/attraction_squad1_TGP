package com.core.sibs.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.core.sibs.entity.Nasabah;
import com.core.sibs.entity.Rekening;
import com.core.sibs.entity.RekeningNasabah;

public interface RekeningNasabahRepository extends JpaRepository<RekeningNasabah, Long>{

    RekeningNasabah findByNasabahCifAndRekeningId(Optional<Nasabah> nasabahAsal, Optional<Rekening> rekeningAsal);
    
}
