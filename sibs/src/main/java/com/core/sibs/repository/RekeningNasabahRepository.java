package com.core.sibs.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.core.sibs.entity.*;


public interface RekeningNasabahRepository extends JpaRepository<RekeningNasabah, Long>{

    List<RekeningNasabah> findByNasabah(Nasabah nasabah);

    RekeningNasabah findByNasabahAndRekeningId(Optional<Nasabah> nasabahAsal, Optional<Rekening> rekeningAsal);
    
}
