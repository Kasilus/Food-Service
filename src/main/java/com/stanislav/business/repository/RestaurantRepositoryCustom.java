package com.stanislav.business.repository;

import com.stanislav.business.model.Meal;

import java.util.List;

public interface RestaurantRepositoryCustom {

    public List<Meal> getMealsBySearchInputOnPage(String search, Integer pageNumber, Integer onPage);

}
