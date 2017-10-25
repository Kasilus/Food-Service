package com.stanislav.business.web;

import com.stanislav.business.model.User;
import com.stanislav.business.service.RestaurantService;
import com.stanislav.business.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
@RequestMapping("/personal_area")
public class PersonalAreaController {

    @Autowired
    UserService userService;

    @Autowired
    RestaurantService restaurantService;


    @RequestMapping(method = RequestMethod.GET)
    public String getInfoAboutUser(Principal principal, Model model){

        String userName = principal.getName();

        User user = userService.findByUsername(userName);
        model.addAttribute("userInfo", user);

        return "personal_area";
    }

}
