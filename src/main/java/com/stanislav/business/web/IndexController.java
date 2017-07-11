package com.stanislav.business.web;

import com.stanislav.business.model.Restaurant;
import com.stanislav.business.repository.RestaurantRepository;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.hibernate.annotations.Fetch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private RestaurantRepository restaurantRepository;

    @RequestMapping(value = "restaurants", method = RequestMethod.GET)
    public String restaurants(Model model){

        Object count = model.asMap().get("count");

        Integer onPage;

        if (count != null){
            onPage = Integer.parseInt(count.toString());
        } else {
            onPage = 5;
            model.addAttribute("count", 5);
        }


        Object number = model.asMap().get("pageNumber");

        Integer pageNumber;

        if (number != null){
            pageNumber = Integer.parseInt(number.toString());
        } else {
            pageNumber = 1;
            model.addAttribute("pageNumber", 1);
        }

        long allPages = restaurantRepository.count()/onPage + 1;

        model.addAttribute("allPages", allPages);


        List<Restaurant> restaurants = restaurantRepository.findAll(new PageRequest(pageNumber - 1, onPage)).getContent();

        model.addAttribute("restaurantList", restaurants);



        return "restaurants";
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "restaurantsOnPage" , required = false) String restaurantsOnPage,
                         @RequestParam(value = "pageNumber", required = false) String pageNumber,
                         Model model){

        model.addAttribute("count", restaurantsOnPage);

        model.addAttribute("pageNumber", pageNumber);

        restaurants(model);

        return "restaurants";
    }

}
