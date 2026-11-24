package model;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class Car implements Serializable {
    private int id;
    private String name;
    private String brand;
    private String category; // sedan, suv, sport, electric, luxury
    private long price;
    private long originalPrice;
    private String engine;
    private String power;
    private String acceleration;
    private String transmission;
    private String topSpeed;
    private String rangeOrFuel;
    private String imageUrl;
    private List<String> gallery;
    private String badge;
    private String description;
    private boolean isFeatured;

    public Car() {
        this.gallery = new ArrayList<>();
    }

    public Car(int id, String name, String brand, String category, long price, long originalPrice,
               String engine, String power, String acceleration, String transmission,
               String topSpeed, String rangeOrFuel, String imageUrl, String badge,
               String description, boolean isFeatured) {
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
        this.gallery = new ArrayList<>();
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public long getPrice() { return price; }
    public void setPrice(long price) { this.price = price; }
    public long getOriginalPrice() { return originalPrice; }
    public void setOriginalPrice(long originalPrice) { this.originalPrice = originalPrice; }
    public String getEngine() { return engine; }
    public void setEngine(String engine) { this.engine = engine; }
    public String getPower() { return power; }
    public void setPower(String power) { this.power = power; }
    public String getAcceleration() { return acceleration; }
    public void setAcceleration(String acceleration) { this.acceleration = acceleration; }
    public String getTransmission() { return transmission; }
    public void setTransmission(String transmission) { this.transmission = transmission; }
    public String getTopSpeed() { return topSpeed; }
    public void setTopSpeed(String topSpeed) { this.topSpeed = topSpeed; }
    public String getRangeOrFuel() { return rangeOrFuel; }
    public void setRangeOrFuel(String rangeOrFuel) { this.rangeOrFuel = rangeOrFuel; }
    public String getImageUrl() {
        if (imageUrl != null && imageUrl.startsWith("images/")) {
            return "assets/" + imageUrl;
        }
        return imageUrl;
    }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public List<String> getGallery() { return gallery; }
    public void setGallery(List<String> gallery) { this.gallery = gallery; }
    public String getBadge() { return badge; }
    public void setBadge(String badge) { this.badge = badge; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public boolean isFeatured() { return isFeatured; }
    public void setFeatured(boolean featured) { isFeatured = featured; }

    public String getFormattedPrice() {
        NumberFormat currencyFormatter = NumberFormat.getInstance(Locale.forLanguageTag("vi-VN"));
        return currencyFormatter.format(this.price) + " đ";
    }

    public String getFormattedOriginalPrice() {
        if (this.originalPrice <= 0) return "";
        NumberFormat currencyFormatter = NumberFormat.getInstance(Locale.forLanguageTag("vi-VN"));
        return currencyFormatter.format(this.originalPrice) + " đ";
    }
}

