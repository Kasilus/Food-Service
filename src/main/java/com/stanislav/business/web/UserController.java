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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String indexPage() {
        return "index";
    }

    @RequestMapping(value = {"/", "enter_registration"},
            method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error",
            required = false) String error) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject(
                    "error",
                    "Invalid username or password!");
        }
        model.setViewName("enter_registration");

        return model;
    }


}
