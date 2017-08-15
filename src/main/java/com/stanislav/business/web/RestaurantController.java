package com.stanislav.business.web;

import com.stanislav.business.model.Restaurant;
import com.stanislav.business.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

    @Autowired
    public RestaurantService restaurantService;

    @RequestMapping(value = "/{restaurantId}")
    public String restaurant(
            @PathVariable("restaurantId") Long restaurantId,
            Model model
    ){

        Restaurant restaurant = restaurantService.getById(restaurantId);
        model.addAttribute("restaurant", restaurant);

        return "restaurant";
    }


}
