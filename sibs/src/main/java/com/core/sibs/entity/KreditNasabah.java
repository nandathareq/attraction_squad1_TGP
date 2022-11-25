package com.core.sibs.entity;

import javax.persistence.*;

import lombok.*;

@Entity
@Getter
@Setter
public class KreditNasabah {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "credit_account_id")
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "kredit_id", nullable = false)
    private Kredit kreditId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cif", nullable = false)
    private Nasabah nasabahCif;

    private double outstanding;
}
