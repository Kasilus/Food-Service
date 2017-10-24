package com.stanislav.business.repository;


import com.stanislav.business.model.Restaurant;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import java.util.List;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {

    Restaurant getById(Long id);


    List<Restaurant> findByTitleIgnoreCaseContaining(String title, Pageable pageable);

    Long countByTitleIgnoreCaseContaining(String title);

}
