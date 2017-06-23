package com.stanislav.business.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class IndexController {

    @RequestMapping(value = "restaurants", method = RequestMethod.GET)
    public String restaurants(Principal user){

        return "restaurants";
    }

}
