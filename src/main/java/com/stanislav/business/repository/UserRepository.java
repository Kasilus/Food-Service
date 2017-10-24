package com.stanislav.business.repository;


import com.stanislav.business.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);

    User findByPhone(String phone);

    User findByEmail(String email);

}
