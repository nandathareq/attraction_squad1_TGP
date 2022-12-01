package id.agile.attractionreservation.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import id.agile.attractionreservation.entity.SubInvoice;
import id.agile.attractionreservation.entity.User;

@Repository
public interface SubInvoiceRepository extends JpaRepository<SubInvoice, Integer> {

	Optional<SubInvoice> getOneByBookingCode(String bookingCode);

	List<SubInvoice> findByBookingCode(String bookingCode);

	List<SubInvoice> findByUserOrderByIdDesc(User user);

}
