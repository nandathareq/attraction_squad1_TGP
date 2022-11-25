package id.agile.attractionreservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import id.agile.attractionreservation.entity.AttractionPlace;

@Repository
public interface AttractionPlaceRepository extends JpaRepository<AttractionPlace, Integer> {
	AttractionPlace findByPlaceName(String placename);
}
