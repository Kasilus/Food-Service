package com.stanislav.business.service;

import com.stanislav.business.model.Meal;
import com.stanislav.business.model.Restaurant;
import com.stanislav.business.repository.MealRepository;
import com.stanislav.business.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
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
    public List<Restaurant> getRestaurantsForCurrentPageWithSpecifiedSize(Integer limit, Integer offset) {
        return restaurantRepository.findAll(new PageRequest(offset - 1, limit)).getContent();
    }

    @Override
    public List<Restaurant> getRestaurantsByTitleForCurrentPageWithSpecifiedSize(String title, Integer limit, Integer offset) {
        return restaurantRepository.findByTitleIgnoreCaseContaining(title, new PageRequest(offset - 1,limit));
    }

    @Override
    public Long getNumberOfAllPages(Integer onPage) {

        return restaurantRepository.count()/onPage + 1;

    }

    @Override
    public Long getAmountOfPages(Integer itemsOnPage) {

        Long amountOfPages = restaurantRepository.count()/itemsOnPage + 1;
        return amountOfPages;

    }

    @Override
    public Long getAmountOfPagesByTitle(String title, Integer itemsOnPage) {


        Long amountOfPages = restaurantRepository.countByTitleIgnoreCaseContaining(title)/ itemsOnPage + 1;
        return amountOfPages;

    }

    @Override
    public List<Meal> getMealsByRestaurantId(Long restaurantId) {

        Meal[] meals = mealRepository.getAllByUser(restaurantId);
        List<Meal> mealList = Arrays.asList(meals);
        return mealList;

    }




}
