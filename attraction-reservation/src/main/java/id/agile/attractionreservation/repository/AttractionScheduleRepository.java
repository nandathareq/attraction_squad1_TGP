package id.agile.attractionreservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import id.agile.attractionreservation.entity.AttractionSchedule;

@Repository
public interface AttractionScheduleRepository extends JpaRepository<AttractionSchedule, Integer> {

}
