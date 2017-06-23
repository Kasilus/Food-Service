package com.stanislav.business.repository;

import com.stanislav.business.model.RestaurantType;
import org.springframework.data.jpa.repository.JpaRepository;


public interface RestaurantTypeRepository extends JpaRepository<RestaurantType, Long> {
}
