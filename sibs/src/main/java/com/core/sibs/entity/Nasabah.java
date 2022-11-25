package com.core.sibs.entity;

import javax.persistence.*;

import lombok.*;

@Entity
@Getter
@Setter
public class Nasabah {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cif;

    @Column(name = "nama_nasabah")
    private String nama;

    @Column(name = "no_telpon")
    private String noTelpon;

}
