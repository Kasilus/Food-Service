package com.stanislav.business.repository;


import com.stanislav.business.model.Meal;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MealRepository extends JpaRepository<Meal, Long> {

    Meal[] getAllByUser(Long id);

}
