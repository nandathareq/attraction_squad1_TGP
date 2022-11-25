package id.agile.attractionreservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import id.agile.attractionreservation.entity.ItineraryItems;

@Repository
public interface ItineraryItemsRepository extends JpaRepository<ItineraryItems, Integer> {

}
