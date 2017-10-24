package com.stanislav.business.web;

import com.stanislav.business.model.Restaurant;
import com.stanislav.business.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/restaurants")
public class RestaurantsController {

    @Autowired
    private RestaurantService restaurantService;

    public RestaurantsController(){

    }

    public RestaurantsController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }


    @RequestMapping(method = RequestMethod.GET)
    public String restaurants(@RequestParam(value = "restaurantsOnPage" , required = false) String restaurantsOnPageAttr,
                              @RequestParam(value = "pageNumber", required = false) String pageNumberAttr,
                              @RequestParam(value = "searchInput", required = false) String searchInputAttr,
                              Model model){

        if (searchInputAttr == null){
            searchInputAttr = "";
        } else {

        }

        model.addAttribute("pageNumber", pageNumberAttr);
        model.addAttribute("count", restaurantsOnPageAttr);

        Object count = model.asMap().get("count");
        Integer restaurantsOnCurrentPage = getNumberOfRestaurantsOnCurrentPage(count, model);

        Object number = model.asMap().get("pageNumber");
        Integer pageNumber = getCurrentPageNumber(number, model);

//        List<Restaurant> restaurants = restaurantService.getRestaurantsForCurrentPage(pageNumber, restaurantsOnCurrentPage);
        List<Restaurant> restaurants = restaurantService.getRestaurantsByTitleForCurrentPageWithSpecifiedSize(searchInputAttr, restaurantsOnCurrentPage, pageNumber);

        Long allPages = restaurantService.getAmountOfPagesByTitle(searchInputAttr, restaurantsOnCurrentPage);
        model.addAttribute("allPages", allPages.toString());

        model.addAttribute("restaurantList", restaurants);













        return "restaurants";
    }

    private Integer getCurrentPageNumber(Object number, Model model) {

        Integer defaultValue = 1;

        if (number != null){
            return Integer.parseInt(number.toString());
        } else {
            model.addAttribute("pageNumber", defaultValue.toString());
            return defaultValue;
        }
    }

    private Integer getNumberOfRestaurantsOnCurrentPage(Object count, Model model) {

        Integer defaultValue = 5;

        if (count != null){
            return Integer.parseInt(count.toString());
        } else {
            model.addAttribute("count", defaultValue.toString());
            return defaultValue;
        }

    }


}