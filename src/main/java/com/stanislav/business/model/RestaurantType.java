package com.stanislav.business.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "restaurant_type")
public class RestaurantType {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "type_id")
    private Long id;

    @Column(name = "type")
    private String name;

    @OneToMany(mappedBy = "type")
    private Set<Restaurant> restaurants;

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

    public Set<Restaurant> getRestaurants() {
        return restaurants;
    }

    public void setRestaurants(Set<Restaurant> restaurants) {
        this.restaurants = restaurants;
    }


}
