package com.stanislav.business.service;


import com.stanislav.business.model.*;
import com.stanislav.business.model.enumerations.Sex;
import com.stanislav.business.repository.RestaurantRepository;
import com.stanislav.business.repository.RestaurantTypeRepository;
import com.stanislav.business.repository.RoleRepository;
import com.stanislav.business.repository.UserRepository;
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
    private RestaurantRepository restaurantRepository;

    @Autowired
    private RestaurantTypeRepository restaurantTypeRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);


    @Override
    public void save(User user) {


        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        List<Role> roles = roleRepository.findAll();
        Iterator<Role> iterator = roles.iterator();
        String userType = user.getUserType();

        selectRolesForUser(iterator, userType);


        if (userType.equals("restaurant")) {
            user.setSex(Sex.M);
        }
        user.setRoles(new HashSet<>(roles));
        user.setRegisterTime(new Timestamp(new Date().getTime()));
        userRepository.save(user);

        if (userType.equals("restaurant")){
            saveRestaurantForUser(user.getId());
        }

    }


    private void saveRestaurantForUser(Long userId) {

        Restaurant restaurant = new Restaurant();
        restaurant.setId(userId);
        restaurant.setType(restaurantTypeRepository.findOne(1l));
        restaurantRepository.save(restaurant);

    }

    private void selectRolesForUser(Iterator<Role> iterator, String userType) {

        while (iterator.hasNext()){
            Role role = iterator.next();
            if (role.getName().equals("ROLE_ADMIN")){
                iterator.remove();
            }
        }

        if (userType.equals("user")){

            while (iterator.hasNext()){
                Role role = iterator.next();
                if (role.getName().equals("ROLE_RESTAURANT")){
                    iterator.remove();
                }
            }
        }

    }

    @Override
    public User findByUsername(String username) {
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
