package com.autolux.showroom.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

@Entity
@Table(name = "cars")
public class Car implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, length = 100)
    private String brand;

    @Column(nullable = false, length = 100)
    private String category;

    @Column(nullable = false)
    private Long price;

    @Column(name = "original_price")
    private Long originalPrice = 0L;

    private String engine;
    private String power;
    private String acceleration;
    private String transmission;

    @Column(name = "top_speed")
    private String topSpeed;

    @Column(name = "range_or_fuel")
    private String rangeOrFuel;

    @Column(name = "image_url", columnDefinition = "TEXT")
    private String imageUrl;

    @Column(length = 100)
    private String badge;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "is_featured")
    private Boolean isFeatured = false;

    public Car() {
    }

    public Car(Integer id, String name, String brand, String category, Long price, Long originalPrice,
               String engine, String power, String acceleration, String transmission,
               String topSpeed, String rangeOrFuel, String imageUrl, String badge,
               String description, Boolean isFeatured) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.category = category;
        this.price = price;
        this.originalPrice = originalPrice;
        this.engine = engine;
        this.power = power;
        this.acceleration = acceleration;
        this.transmission = transmission;
        this.topSpeed = topSpeed;
        this.rangeOrFuel = rangeOrFuel;
        this.imageUrl = imageUrl;
        this.badge = badge;
        this.description = description;
        this.isFeatured = isFeatured;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Long getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Long originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public String getAcceleration() {
        return acceleration;
    }

    public void setAcceleration(String acceleration) {
        this.acceleration = acceleration;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getTopSpeed() {
        return topSpeed;
    }

    public void setTopSpeed(String topSpeed) {
        this.topSpeed = topSpeed;
    }

    public String getRangeOrFuel() {
        return rangeOrFuel;
    }

    public void setRangeOrFuel(String rangeOrFuel) {
        this.rangeOrFuel = rangeOrFuel;
    }

    public String getImageUrl() {
        if (imageUrl == null || imageUrl.trim().isEmpty()) {
            return "assets/images/car-1.jpg";
        }
        String path = imageUrl.trim();
        if (path.startsWith("http://") || path.startsWith("https://")) {
            return path;
        }
        if (path.startsWith("/")) {
            path = path.substring(1);
        }
        if (path.startsWith("images/")) {
            return "assets/" + path;
        }
        if (!path.startsWith("assets/")) {
            return "assets/images/" + path;
        }
        return path;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getBadge() {
        return badge;
    }

    public void setBadge(String badge) {
        this.badge = badge;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getIsFeatured() {
        return isFeatured;
    }

    public void setIsFeatured(Boolean isFeatured) {
        this.isFeatured = isFeatured;
    }

    public String getFormattedPrice() {
        if (this.price == null) return "0 đ";
        NumberFormat currencyFormatter = NumberFormat.getInstance(Locale.forLanguageTag("vi-VN"));
        return currencyFormatter.format(this.price) + " đ";
    }

    public String getFormattedOriginalPrice() {
        if (this.originalPrice == null || this.originalPrice <= 0) return "";
        NumberFormat currencyFormatter = NumberFormat.getInstance(Locale.forLanguageTag("vi-VN"));
        return currencyFormatter.format(this.originalPrice) + " đ";
    }
}
