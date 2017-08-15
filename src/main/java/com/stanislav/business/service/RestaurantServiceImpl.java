package com.stanislav.business.service;

import com.stanislav.business.model.Restaurant;
import com.stanislav.business.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    RestaurantRepository restaurantRepository;

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

}
