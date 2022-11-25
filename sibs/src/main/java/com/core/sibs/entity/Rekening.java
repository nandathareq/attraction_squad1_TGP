package com.core.sibs.entity;

import javax.persistence.*;

import lombok.*;

@Entity
@Getter
@Setter
public class Rekening {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rekening_id")
    private long id;

    @Column(name = "nama_rekening")
    private String nama;
}
