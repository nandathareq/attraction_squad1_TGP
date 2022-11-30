package com.core.sibs;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.core.sibs.entity.*;
import com.core.sibs.repository.*;

@SpringBootApplication
public class SibsApplication {

	public static void main(String[] args) {
		SpringApplication.run(SibsApplication.class, args);
	}

	private String generateRekeningNumber(int n) {
        String RekeningNumber = "0123456789";
        StringBuilder sb = new StringBuilder(n);

        for (int i = 0; i < n; i++) {
            int index = (int) (RekeningNumber.length()
                    * Math.random());

            sb.append(RekeningNumber
                    .charAt(index));
        }
        return sb.toString();
    }

	@Bean
	CommandLineRunner init(NasabahRepository nasabahRepository, RekeningRepository rekeningRepository, KreditRepository kreditRepository, RekeningNasabahRepository rekeningNasabahRepository, KreditNasabahRepository kreditNasabahRepository){
		return args -> {

			// populate nasabah
			Nasabah nasabah1 = nasabahRepository.findByNama("CIMB NIAGA");
			if(nasabah1 == null){
				nasabah1 = new Nasabah();
				nasabah1.setNama("CIMB NIAGA");
				nasabah1.setNoTelpon("081533465435");
				nasabah1.setPin("123456");
				nasabahRepository.save(nasabah1);
			}

			Nasabah nasabah2 = nasabahRepository.findByNama("Faishal Fatchur");
			if(nasabah2 == null){
				nasabah2 = new Nasabah();
				nasabah2.setNama("Faishal Fachtur");
				nasabah2.setNoTelpon("0856454327854");
				nasabah2.setPin("123456");
				nasabahRepository.save(nasabah2);
			}

			Nasabah nasabah3 = nasabahRepository.findByNama("Fachry Firdaus");
			if(nasabah3 == null){
				nasabah3 = new Nasabah();
				nasabah3.setNama("Fachry Firdaus");
				nasabah3.setNoTelpon("0811176546787");
				nasabah3.setPin("123456");
				nasabahRepository.save(nasabah3);
			}

			Nasabah nasabah4 = nasabahRepository.findByNama("Sonya Barista");
			if(nasabah4 == null){
				nasabah4 = new Nasabah();
				nasabah4.setNama("Sonya Barista");
				nasabah4.setNoTelpon("0878263746534");
				nasabah4.setPin("123456");
				nasabahRepository.save(nasabah4);
			}

			Nasabah nasabah5 = nasabahRepository.findByNama("Dhimas Putranto");
			if(nasabah5 == null){
				nasabah5 = new Nasabah();
				nasabah5.setNama("Dhimas Putranto");
				nasabah5.setNoTelpon("085676545879");
				nasabah5.setPin("123456");
				nasabahRepository.save(nasabah5);
			}

			
			Nasabah nasabah6 = nasabahRepository.findByNama("Nanda Thareq");
			if(nasabah6 == null){
				nasabah6 = new Nasabah();
				nasabah6.setNama("Nanda Thareq");
				nasabah6.setNoTelpon("085837575964");
				nasabah6.setPin("123456");
				nasabahRepository.save(nasabah6);
			}

			// populate rekening
			Rekening rekening1 = rekeningRepository.findByNama("Giro Escrow");
			if(rekening1 == null){
				rekening1 = new Rekening();
				rekening1.setNama("Giro Escrow");
				rekeningRepository.save(rekening1);
			}

			Rekening rekening2 = rekeningRepository.findByNama("Xtra Savers");
			if(rekening2 == null){
				rekening2 = new Rekening();
				rekening2.setNama("Xtra Savers");
				rekeningRepository.save(rekening2);
			}

			Rekening rekening3 = rekeningRepository.findByNama("Payroll");
			if(rekening3 == null){
				rekening3 = new Rekening();
				rekening3.setNama("Payroll");
				rekeningRepository.save(rekening3);
			}

			Rekening rekening4 = rekeningRepository.findByNama("Giro Perusahaan");
			if(rekening4 == null){
				rekening4 = new Rekening();
				rekening4.setNama("Giro Perusahaan");
				rekeningRepository.save(rekening4);
			}

			Rekening rekening5 = rekeningRepository.findByNama("Rekening Ponsel");
			if(rekening5 == null){
				rekening5 = new Rekening();
				rekening5.setNama("Rekening Ponsel");
				rekeningRepository.save(rekening5);
			}

			// populate kredit
			Kredit kredit1 = kreditRepository.findByNama("Visa Platinum Reguler");
			if(kredit1 == null){
				kredit1 = new Kredit();
				kredit1.setNama("Visa Platinum Reguler");
				kredit1.setKuota(5000000.00);
				kreditRepository.save(kredit1);
			}

			Kredit kredit2 = kreditRepository.findByNama("Mastercard Platinum");
			if(kredit2 == null){
				kredit2 = new Kredit();
				kredit2.setNama("Mastercard Platinum");
				kredit2.setKuota(10000000.00);
				kreditRepository.save(kredit2);
			}

			Kredit kredit3 = kreditRepository.findByNama("JCB platinum");
			if(kredit3 == null){
				kredit3 = new Kredit();
				kredit3.setNama("JCB platinum");
				kredit3.setKuota(20000000.00);
				kreditRepository.save(kredit3);
			}

			// set rekening ownership and balance

			RekeningNasabah escrow = new RekeningNasabah();
			escrow.setNasabah(nasabah1);
			escrow.setRekeningId(rekening1);
			escrow.setBalance(0);
			rekeningNasabahRepository.save(escrow);

			Nasabah[] nasabahs = {nasabah2, nasabah3, nasabah4, nasabah5, nasabah6};
			Rekening[] rekenings = {rekening2, rekening3, rekening4, rekening5};
			Kredit[] kredits = {kredit1, kredit2, kredit3};

			for (Nasabah nasabah : nasabahs) {
				for (Rekening rekening : rekenings) {
					RekeningNasabah rek = new RekeningNasabah();
					rek.setNasabah(nasabah);
					rek.setRekeningId(rekening);
					rek.setBalance(10000000.00);
					rek.setNomorRekening(generateRekeningNumber(12));
					rekeningNasabahRepository.save(rek);
				}

				for (Kredit kredit : kredits) {
					KreditNasabah rek = new KreditNasabah();
					rek.setNasabahCif(nasabah);
					rek.setKreditId(kredit);
					rek.setOutstanding(0);
					kreditNasabahRepository.save(rek);
				}
			}
		};
	}
}
