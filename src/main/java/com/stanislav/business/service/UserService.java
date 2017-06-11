package com.stanislav.business.service;

import com.stanislav.business.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);

}
