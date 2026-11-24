package data.impl;

import data.dao.CategoryDao;
import data.driver.MySQLDriver;
import model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Lớp CategoryImpl thực thi CategoryDao
 * Hỗ trợ truy vấn dữ liệu từ MySQL Database và cung cấp dữ liệu mặc định an toàn
 * @author Phu
 */
public class CategoryImpl implements CategoryDao {

    private List<Category> getDefaultCategories() {
        List<Category> list = new ArrayList<>();
        list.add(new Category(1, "Sedan Hạng Sang", "sedan", "fa-solid fa-car-side"));
        list.add(new Category(2, "SUV / Crossover", "suv", "fa-solid fa-truck-monster"));
        list.add(new Category(3, "Siêu Xe Thể Thao", "sport", "fa-solid fa-gauge-high"));
        list.add(new Category(4, "Xe Điện Flagship EV", "electric", "fa-solid fa-bolt"));
        list.add(new Category(5, "Siêu Sang Quý Tộc", "luxury", "fa-solid fa-crown"));
        return list;
    }

    @Override
    public List<Category> finAll() {
        return findAll();
    }

    @Override
    public List<Category> findAll() {
        List<Category> lstCategory = new ArrayList<>();
        String sql = "SELECT * FROM categories";

        try (Connection con = MySQLDriver.getConnection()) {
            if (con == null) {
                return getDefaultCategories();
            }

            try (PreparedStatement sttm = con.prepareStatement(sql);
                 ResultSet rs = sttm.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String slug = null;
                    try {
                        slug = rs.getString("slug");
                    } catch (Exception ignored) {}
                    if (slug == null || slug.trim().isEmpty()) {
                        slug = name.toLowerCase().replace(" ", "-");
                    }

                    String icon = "fa-solid fa-car";
                    try {
                        String dbIcon = rs.getString("icon");
                        if (dbIcon != null && !dbIcon.trim().isEmpty()) {
                            icon = dbIcon.trim();
                        }
                    } catch (Exception ignored) {}

                    lstCategory.add(new Category(id, name, slug.trim(), icon));
                }
            }
        } catch (SQLException ex) {
            // Khi bảng chưa tạo trong MySQL, dùng danh mục mặc định cho showroom
            return getDefaultCategories();
        }

        return lstCategory.isEmpty() ? getDefaultCategories() : lstCategory;
    }

    @Override
    public void insert(String name) {
        String sql = "INSERT INTO categories (name) VALUES (?)";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement sttm = con.prepareStatement(sql)) {
                    sttm.setString(1, name);
                    sttm.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM categories WHERE id = ?";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement sttm = con.prepareStatement(sql)) {
                    sttm.setInt(1, id);
                    sttm.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void update(int id, String newName) {
        String sql = "UPDATE categories SET name = ? WHERE id = ?";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement sttm = con.prepareStatement(sql)) {
                    sttm.setString(1, newName);
                    sttm.setInt(2, id);
                    sttm.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Category find(int id) {
        for (Category c : findAll()) {
            if (c.getId() == id) return c;
        }
        return null;
    }

    @Override
    public Category findBySlug(String slug) {
        if (slug == null) return null;
        for (Category c : findAll()) {
            if (slug.equalsIgnoreCase(c.getSlug())) return c;
        }
        return null;
    }
}

