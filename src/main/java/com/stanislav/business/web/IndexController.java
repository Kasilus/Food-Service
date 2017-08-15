package com.stanislav.business.web;

import com.stanislav.business.model.Restaurant;
import com.stanislav.business.repository.RestaurantRepository;
import com.stanislav.business.service.RestaurantService;
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

    @RequestMapping(value = "home")
    public String home() {
        return "redirect:/index";
    }

}
