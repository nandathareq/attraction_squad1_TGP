package id.agile.attractionreservation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import id.agile.attractionreservation.entity.InvoiceItem;
import id.agile.attractionreservation.entity.User;


@Repository
public interface InvoiceItemRepository extends JpaRepository<InvoiceItem, Integer> {
	List<InvoiceItem> findBySubInvoice(int subInvoiceId);
}
