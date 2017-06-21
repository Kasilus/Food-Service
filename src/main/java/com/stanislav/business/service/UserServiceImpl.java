package com.stanislav.business.service;


import com.stanislav.business.model.Role;
import com.stanislav.business.model.Sex;
import com.stanislav.business.model.User;
import com.stanislav.business.repository.RoleRepository;
import com.stanislav.business.repository.UserRepository;
import com.stanislav.business.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Override
    public void save(User user) {

        logger.debug("Start user save in UserServiceImpl");

        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        List<Role> roles = roleRepository.findAll();
        Iterator<Role> iterator = roles.iterator();

        while (iterator.hasNext()){
            Role role = iterator.next();
            if (role.getName().equals("ROLE_ADMIN")){
                iterator.remove();
            }
        }

        if (user.getUserType().equals("user")){
            iterator = roles.iterator();

            while (iterator.hasNext()){
                Role role = iterator.next();
                if (role.getName().equals("ROLE_RESTAURANT")){
                    iterator.remove();
                }
            }
        } else if (user.getUserType().equals("restaurant")){
            user.setSex(Sex.M);
        }

        user.setRoles(new HashSet<>(roles));
        user.setRegisterTime(new Timestamp(new Date().getTime()));
        userRepository.save(user);

        logger.debug("End user save in UserServiceImpl");
    }

    @Override
    public User findByUsername(String username) {

        logger.debug("User fin by username in UserServiceImpl");

        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findByPhone(String phone) {
        return userRepository.findByPhone(phone);
    }
}
