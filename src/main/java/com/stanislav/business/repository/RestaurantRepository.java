package com.stanislav.business.repository;


import com.stanislav.business.model.Restaurant;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.List;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {

    Restaurant getById(Long id);

//    @Query("SELECT r.title FROM restaurant r WHERE r.title LIKE :title")
//@Query("SELECT r FROM payeatpray.restaurant r ")
    List<Restaurant> findByTitleIgnoreCaseContaining(String title, Pageable pageable);

    List<Restaurant> findByTitleIgnoreCaseContaining(String title);

    Long countByTitleIgnoreCaseContaining(String title);

    Long getByTitleLike(String title);

}
