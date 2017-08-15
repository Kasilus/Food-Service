package com.stanislav.business.service;

import com.stanislav.business.model.Meal;
import com.stanislav.business.model.Restaurant;
import com.stanislav.business.repository.MealRepository;
import com.stanislav.business.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    RestaurantRepository restaurantRepository;

    @Autowired
    MealRepository mealRepository;

    @Override
    public Restaurant getById(long id) {

        return restaurantRepository.getById(id);

    }


    @Override
    public List<Restaurant> getRestaurantsForCurrentPage(Integer pageNumber, Integer onPage) {

        return restaurantRepository.findAll(new PageRequest(pageNumber - 1, onPage)).getContent();

    }

    @Override
    public Long getNumberOfAllPages(Integer onPage) {

        return restaurantRepository.count()/onPage + 1;

    }

    @Override
    public List<Meal> getMealsByRestaurantId(Long restaurantId) {

        Meal[] meals = mealRepository.getAllByUser(restaurantId);
        List<Meal> mealList = Arrays.asList(meals);
        return mealList;

    }

}
