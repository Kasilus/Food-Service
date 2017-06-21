package com.stanislav.business.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping(value = "restaurants")
    public String restaurants(){
        return "restaurants";
    }

}
