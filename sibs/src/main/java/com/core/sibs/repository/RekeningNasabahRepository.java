package com.core.sibs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.core.sibs.entity.*;


public interface RekeningNasabahRepository extends JpaRepository<RekeningNasabah, Long>{

    List<RekeningNasabah> findByNasabah(Nasabah nasabah);

    RekeningNasabah findByNomorRekening(String noRekening);
    
}
