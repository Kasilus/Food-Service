package com.stanislav.business.model;

import javax.persistence.*;

@Entity
@Table(name = "profiles")
public class User {

    private Long id;
    private String name;
    private String username;
    private String password;
    private String passwordConfirm;
    private String email;
    private String registertime;
    private Sex sex;
    private Role role;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegisterTime() {
        return registertime;
    }

    public void setRegisterTime(String registerTime) {
        this.registertime = registerTime;
    }

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex m) {
        sex = m;
    }

    @OneToOne
    @JoinTable(name = "profile_profilecategory",
    joinColumns = @JoinColumn(name = "user_id"),
    inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
