package com.stanislav.business.web;


import com.stanislav.business.service.SecurityService;
import com.stanislav.business.service.UserService;
import com.stanislav.business.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/enter_registration", method = RequestMethod.GET)
    public String enterRegistration(Model model, String error, String logout){

        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        logger.debug("Request Mapping /enter_registration");

        return "enter_registration";
    }

    @RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
    public String index(Model model){

        logger.debug("Request Mapping / or /index");

        return "index";
    }
}
