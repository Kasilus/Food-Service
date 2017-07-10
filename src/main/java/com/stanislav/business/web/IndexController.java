package com.stanislav.business.web;

import com.stanislav.business.model.Restaurant;
import com.stanislav.business.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private RestaurantRepository restaurantRepository;

    @RequestMapping(value = "restaurants", method = RequestMethod.GET)
    public String restaurants(Principal user, Model model){

        List<Restaurant> restaurants = restaurantRepository.findAll();
        model.addAttribute("restaurantList", restaurants);

        return "restaurants";
    }

}
