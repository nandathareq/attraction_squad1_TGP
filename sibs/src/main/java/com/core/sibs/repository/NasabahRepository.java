package com.core.sibs.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.core.sibs.entity.Nasabah;

public interface NasabahRepository extends JpaRepository<Nasabah, Long>{
    Nasabah findByNama(String string);
}
