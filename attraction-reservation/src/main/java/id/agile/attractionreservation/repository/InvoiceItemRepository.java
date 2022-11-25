package id.agile.attractionreservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import id.agile.attractionreservation.entity.InvoiceItem;


@Repository
public interface InvoiceItemRepository extends JpaRepository<InvoiceItem, Integer> {

}
