package com.core.sibs.entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;

@Entity
@Getter
@Setter
public class RekeningNasabah {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rekening", nullable = false)
    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    private Rekening rekeningId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nasabah", nullable = false)
    @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
    private Nasabah nasabah;

    private double balance;

    @Column(name = "nomor_rekening")
    private String nomorRekening;

}
