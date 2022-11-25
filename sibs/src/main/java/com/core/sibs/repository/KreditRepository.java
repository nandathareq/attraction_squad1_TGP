package com.core.sibs.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.core.sibs.entity.Kredit;

public interface KreditRepository extends JpaRepository<Kredit, Long>{
    Kredit findByNama(String string);
}
