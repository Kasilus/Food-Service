package com.stanislav.business.validator;

import com.stanislav.business.model.User;
import com.stanislav.business.service.UserService;
import com.stanislav.business.web.UserController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserValidator.class);

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        logger.debug("Start user validation in UserValidator");

        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");

        if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }

        if (userService.findByUsername(user.getUsername())!=null){
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");

        if (!vaildEmail(user.getEmail())){
            errors.rejectValue("email", "Incorrect.userForm.mail");
        }


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty");

        if (!validPhone(user.getPhone())){
            errors.rejectValue("phone", "Incorrect.userForm.phone");
        }

        logger.debug("End user validation in UserValidator");
    }

    private static boolean vaildEmail(String email){
        return Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$").matcher(email).matches();

    }

    private static boolean validPhone(String phone){
        return Pattern.compile("\\+38[0-9]{7,15}")
                .matcher(phone).matches();
    }


}
