package id.agile.attractionreservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import id.agile.attractionreservation.entity.GrandInvoice;

@Repository
public interface GrandInvoiceRepository extends JpaRepository<GrandInvoice, Integer> {

}
