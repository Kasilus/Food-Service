package com.stanislav.business.web;


import com.stanislav.business.model.User;
import com.stanislav.business.service.SecurityService;
import com.stanislav.business.service.UserService;
import com.stanislav.business.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/enter_registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model){

        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()){
            return "enter_registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/index";
    }


    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public ModelAndView accessDenied(Principal user){

        ModelAndView model = new ModelAndView();

        if (user!=null){
            model.addObject("errorMsg", user.getName() + ", у Вас нет доступа к этой странице");
        } else {
            model.addObject("errorMsg", "У Вас нет доступа к этой странице");
        }
        model.setViewName("/accessDenied");
        return model;
    }

    @RequestMapping(value = "/enter_registration",
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

        model.addObject("userForm", new User());

        return model;
    }

    @RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
    public String index(Model model, Principal user){

        if (user!=null){
            model.addAttribute("nameOfUser", user.getName());
        } else {
            model.addAttribute("nameOfUser", "null");
        }

        return "index";

    }


}
