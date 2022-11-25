package com.core.sibs.entity;

import javax.persistence.*;

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
    @JoinColumn(name = "rekening_id", nullable = false)
    private Rekening rekeningId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cif", nullable = false)
    private Nasabah nasabahCif;

    private double balance;
}
