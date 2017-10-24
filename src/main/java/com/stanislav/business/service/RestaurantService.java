package com.stanislav.business.service;

import com.stanislav.business.model.Meal;
import com.stanislav.business.model.Restaurant;

import java.util.List;

public interface RestaurantService {

    Restaurant getById(long id);

    List<Restaurant> getRestaurantsForCurrentPage(Integer pageNumber, Integer onPage);

    Long getNumberOfAllPages(Integer onPage);

    Long getAmountOfPagesByTitle(String title, Integer itemsOnPage);

    List<Meal> getMealsByRestaurantId(Long restaurantId);

    List<Restaurant> getRestaurantsByTitleForCurrentPageWithSpecifiedSize(String title, Integer limit, Integer offset);
}
