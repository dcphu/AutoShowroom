package data.impl;

import data.dao.CarDao;
import data.driver.MySQLDriver;
import model.Car;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Lớp CarImpl kết nối MySQL Database để lấy danh sách và lọc xe theo tiêu chuẩn MVC.
 * Dữ liệu xe được quản lý 100% từ bảng `cars` trong Cơ sở dữ liệu.
 * @author Phu
 */
public class CarImpl implements CarDao {

    private Car extractCar(ResultSet rs) throws Exception {
        String img = rs.getString("image_url");
        if (img != null && img.startsWith("images/")) {
            img = "assets/" + img;
        }
        return new Car(
            rs.getInt("id"),
            rs.getString("name"),
            rs.getString("brand"),
            rs.getString("category"),
            rs.getLong("price"),
            rs.getLong("original_price"),
            rs.getString("engine"),
            rs.getString("power"),
            rs.getString("acceleration"),
            rs.getString("transmission"),
            rs.getString("top_speed"),
            rs.getString("range_or_fuel"),
            img,
            rs.getString("badge"),
            rs.getString("description"),
            rs.getBoolean("is_featured")
        );
    }

    @Override
    public List<Car> findAll() {
        List<Car> list = new ArrayList<>();
        String sql = "SELECT * FROM cars ORDER BY id ASC";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(extractCar(rs));
                }
            }
        } catch (Exception e) {
            System.err.println("[CarImpl] Lỗi findAll từ MySQL: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<Car> findFeatured() {
        List<Car> list = new ArrayList<>();
        String sql = "SELECT * FROM cars WHERE is_featured = TRUE ORDER BY id ASC";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(extractCar(rs));
                }
            }
        } catch (Exception e) {
            System.err.println("[CarImpl] Lỗi findFeatured từ MySQL: " + e.getMessage());
        }
        return list;
    }

    @Override
    public Car find(int id) {
        String sql = "SELECT * FROM cars WHERE id = ?";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con == null) return null;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return extractCar(rs);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[CarImpl] Lỗi find id=" + id + ": " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<Car> filter(String category, String brand, String keyword, String priceRange) {
        List<Car> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM cars WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (category != null && !category.trim().isEmpty() && !category.equalsIgnoreCase("all")) {
            sql.append(" AND LOWER(category) = ?");
            params.add(category.trim().toLowerCase());
        }

        if (brand != null && !brand.trim().isEmpty() && !brand.equalsIgnoreCase("all")) {
            sql.append(" AND LOWER(brand) = ?");
            params.add(brand.trim().toLowerCase());
        }

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND (LOWER(name) LIKE ? OR LOWER(brand) LIKE ? OR LOWER(description) LIKE ?)");
            String kw = "%" + keyword.trim().toLowerCase() + "%";
            params.add(kw);
            params.add(kw);
            params.add(kw);
        }

        if (priceRange != null && !priceRange.trim().isEmpty() && !priceRange.equalsIgnoreCase("all")) {
            switch (priceRange) {
                case "under3b":
                    sql.append(" AND price < ?");
                    params.add(3000000000L);
                    break;
                case "3b-7b":
                    sql.append(" AND price >= ? AND price <= ?");
                    params.add(3000000000L);
                    params.add(7000000000L);
                    break;
                case "7b-11b":
                    sql.append(" AND price > ? AND price <= ?");
                    params.add(7000000000L);
                    params.add(11000000000L);
                    break;
                case "above11b":
                    sql.append(" AND price > ?");
                    params.add(11000000000L);
                    break;
            }
        }

        sql.append(" ORDER BY id ASC");

        try (Connection con = MySQLDriver.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql.toString())) {
                for (int i = 0; i < params.size(); i++) {
                    Object param = params.get(i);
                    if (param instanceof Long) {
                        ps.setLong(i + 1, (Long) param);
                    } else {
                        ps.setString(i + 1, param.toString());
                    }
                }
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        list.add(extractCar(rs));
                    }
                }
            }
            return list;
        } catch (Exception e) {
            System.err.println("[CarImpl] Lỗi filter từ MySQL: " + e.getMessage());
            return list;
        }
    }

    @Override
    public List<String> getBrands() {
        List<String> brands = new ArrayList<>();
        String sql = "SELECT DISTINCT brand FROM cars WHERE brand IS NOT NULL AND brand != '' ORDER BY brand ASC";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        brands.add(rs.getString("brand"));
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[CarImpl] Lỗi getBrands từ MySQL: " + e.getMessage());
        }
        if (brands.isEmpty()) {
            brands = Arrays.asList("Mercedes-Benz", "Porsche", "BMW", "Audi", "VinFast", "Lexus", "Land Rover", "Ferrari", "Lamborghini", "Rolls-Royce", "Bentley", "Maserati");
        }
        return brands;
    }
}
