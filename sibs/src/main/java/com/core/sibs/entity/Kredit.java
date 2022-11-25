package com.core.sibs.entity;

import javax.persistence.*;

import lombok.*;

@Entity
@Getter
@Setter
public class Kredit {
        
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "kredit_id")
    private long id;

    @Column(name = "nama_kredit")
    private String nama;

    private double kuota;
}
