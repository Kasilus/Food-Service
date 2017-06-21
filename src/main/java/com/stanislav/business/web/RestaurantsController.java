package com.stanislav.business.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaurantsController {

    @RequestMapping(value = "home")
    public String home() {
        return "index";
    }
}