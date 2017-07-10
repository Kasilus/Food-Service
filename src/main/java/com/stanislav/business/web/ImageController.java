package com.stanislav.business.web;

import com.stanislav.business.model.Restaurant;
import com.stanislav.business.repository.RestaurantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/myImage")
public class ImageController {

    @Autowired
    RestaurantRepository restaurantService;

    @RequestMapping(value = "/imageDisplay", method = RequestMethod.GET)
    public void showImage(@RequestParam("id") Long restaurantId, HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {


        Restaurant restaurant = restaurantService.getById(restaurantId);
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(restaurant.getImage());


        response.getOutputStream().close();

    }
}
