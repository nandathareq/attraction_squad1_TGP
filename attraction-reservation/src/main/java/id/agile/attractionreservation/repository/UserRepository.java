package id.agile.attractionreservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import id.agile.attractionreservation.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
