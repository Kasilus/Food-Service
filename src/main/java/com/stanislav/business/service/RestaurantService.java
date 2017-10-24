package com.stanislav.business.service;

import com.stanislav.business.model.Meal;
import com.stanislav.business.model.Restaurant;

import java.util.List;

public interface RestaurantService {

    Restaurant getById(long id);

    Long getNumberOfAllPages(Integer onPage);

    Long getAmountOfPages(Integer itemsOnPage);

    Long getAmountOfPagesByTitle(String title, Integer itemsOnPage);

    List<Meal> getMealsByRestaurantId(Long restaurantId);

    List<Restaurant> getRestaurantsForCurrentPageWithSpecifiedSize(Integer limit, Integer offset);

    List<Restaurant> getRestaurantsByTitleForCurrentPageWithSpecifiedSize(String title, Integer limit, Integer offset);


}
