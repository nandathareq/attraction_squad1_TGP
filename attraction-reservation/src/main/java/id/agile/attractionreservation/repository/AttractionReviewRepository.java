package id.agile.attractionreservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import id.agile.attractionreservation.entity.AttractionReview;

@Repository
public interface AttractionReviewRepository extends JpaRepository<AttractionReview, Integer> {

}
