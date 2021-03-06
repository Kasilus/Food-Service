package com.stanislav.business.web;


import com.stanislav.business.model.User;
import com.stanislav.business.service.SecurityService;
import com.stanislav.business.service.UserService;
import com.stanislav.business.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public String accessDenied(Principal user, Model model){

        if (user!=null){
            model.addAttribute("errorMsg", user.getName() + ", you don't have access to this page");
        } else {
            model.addAttribute("errorMsg", "You don't have access to this page");
        }

        return "/accessDenied";
    }

    @RequestMapping(value = "/enter_registration",
            method = RequestMethod.GET)
    public String login(@RequestParam(value = "error",
            required = false) String error, String logout, Model model) {

        if (error != null) {
            model.addAttribute("error", "Incorrect login or password!");
        }

        if (logout != null){
            model.addAttribute("message", "You have been logged out successfully!");
        }

        model.addAttribute("userForm", new User());

        return "enter_registration";
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

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication!=null){
            new SecurityContextLogoutHandler().logout(request,response,authentication);
        }

        return "redirect:/enter_registration?logout";
    }

}
