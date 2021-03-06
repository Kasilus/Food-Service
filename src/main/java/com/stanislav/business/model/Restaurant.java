package com.stanislav.business.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "restaurant")
@SecondaryTable(name = "user",pkJoinColumns = @PrimaryKeyJoinColumn(name = "user_id", referencedColumnName = "user_id"))
public class Restaurant {

    @Id
    @Column(name = "user_id")
    private Long id;

    @Column(table = "user", name = "name")
    private String title;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "type_id")
    private RestaurantType type;

    @Column(name = "image")
    private byte[] image;

//    @OneToMany
//    @JoinTable(name = "restaurant_meals")
//    private List<Meal> meals;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public RestaurantType getType() {
        return type;
    }

    public void setType(RestaurantType type) {
        this.type = type;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
