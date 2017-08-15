package com.stanislav.business.service;

import com.stanislav.business.model.Restaurant;

import java.util.List;

public interface RestaurantService {

    Restaurant getById(long id);

    List<Restaurant> getRestaurantsForCurrentPage(Integer pageNumber, Integer onPage);

    Long getNumberOfAllPages(Integer onPage);
}
