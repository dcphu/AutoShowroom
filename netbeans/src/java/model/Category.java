package model;

import java.io.Serializable;

/**
 * Lớp đại diện cho Danh mục phân khúc xe ô tô (Sedan, SUV, Thể thao, Xe điện...)
 * @author Phu
 */
public class Category implements Serializable {

    private int id;
    private String name;
    private String slug; // sedan, suv, sport, electric, luxury
    private String icon; // icon class cho giao diện

    public Category() {
    }

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
        this.slug = name != null ? name.toLowerCase().replace(" ", "-") : "";
        this.icon = "fa-solid fa-car";
    }

    public Category(int id, String name, String slug, String icon) {
        this.id = id;
        this.name = name;
        this.slug = slug;
        this.icon = icon;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    // Các hàm tương thích getter của đồ án Shopping
    public int getCategoryId() {
        return id;
    }

    public String getCategoryName() {
        return name;
    }
}

