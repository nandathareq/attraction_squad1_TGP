package com.core.sibs.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.core.sibs.entity.Rekening;

public interface RekeningRepository extends JpaRepository<Rekening, Long>{

    Rekening findByNama(String string);
    
}
