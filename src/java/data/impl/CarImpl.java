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
import java.util.stream.Collectors;

/**
 * Lớp CarImpl kết nối MySQL Database để lấy danh sách xe,
 * có dự phòng in-memory nếu database ngắt kết nối.
 * @author Phu
 */
public class CarImpl implements CarDao {

    private List<Car> defaultCars() {
        List<Car> list = new ArrayList<>();
        list.add(new Car(
            1, "Mercedes-AMG GT 63 S E-Performance", "Mercedes-Benz", "sport",
            12500000000L, 13200000000L, "4.0L V8 Biturbo + Motor điện Hybrid",
            "843 mã lực / 1.470 Nm", "2.9 giây (0-100 km/h)", "AMG SPEEDSHIFT MCT 9G",
            "316 km/h", "Xăng lai Điện (PHEV)",
            "images/car-1.jpg",
            "Siêu phẩm AMG",
            "Chiếc 4 cửa mạnh mẽ nhất lịch sử AMG, kết hợp khối động cơ V8 Biturbo danh tiếng cùng công nghệ truyền động điện tử F1 độc quyền.",
            true
        ));
        list.add(new Car(
            2, "Porsche Taycan Turbo S Cross Turismo", "Porsche", "electric",
            8500000000L, 8900000000L, "Động cơ Điện kép Permanent Magnet",
            "761 mã lực (Launch Control)", "2.8 giây (0-100 km/h)", "Hộp số 2 cấp độc quyền Porsche",
            "260 km/h", "Pin 93.4 kWh (512 km/lần sạc)",
            "images/car-2.jpg",
            "Xe Điện Flagship",
            "Đỉnh cao thuần điện phong cách thể thao Đức. Trải nghiệm cảm giác dính ghế tức thì cùng hệ thống treo khí nén chủ động 3 buồng PASM.",
            true
        ));
        list.add(new Car(
            3, "BMW M8 Competition Gran Coupe", "BMW", "sport",
            10990000000L, 11500000000L, "4.4L V8 M TwinPower Turbo",
            "625 mã lực / 750 Nm", "3.2 giây (0-100 km/h)", "8 Cấp M Steptronic với Drivelogic",
            "305 km/h", "Dung tích bình xăng 68L",
            "images/car-3.jpg",
            "Bán chạy",
            "Tuyệt tác Gran Coupe hòa quyện giữa vẻ đẹp khí động học đỉnh cao và sức mạnh trường đua của phân nhánh M Motorsport danh tiếng.",
            true
        ));
        list.add(new Car(
            4, "Audi RS e-tron GT Quattro", "Audi", "electric",
            7200000000L, 7500000000L, "Hệ dẫn động 4 bánh toàn thời gian Quattro Điện",
            "637 mã lực / 830 Nm", "3.3 giây (0-100 km/h)", "Tự động 2 cấp",
            "250 km/h", "Phạm vi di chuyển 472 km",
            "images/car-4.jpg",
            "Ưu đãi 100% trước bạ",
            "Ngôn ngữ thiết kế vị lai cuốn hút từng ánh nhìn. Công nghệ sạc nhanh 800V giúp nạp từ 5% lên 80% chỉ trong vòng 22.5 phút.",
            true
        ));
        list.add(new Car(
            5, "Mercedes-Maybach S 680 4MATIC", "Mercedes-Benz", "luxury",
            16990000000L, 17500000000L, "6.0L V12 BiTurbo Handcrafted",
            "612 mã lực / 900 Nm", "4.5 giây (0-100 km/h)", "9G-TRONIC 9 Cấp mượt mà",
            "250 km/h", "Xăng không chì cao cấp",
            "images/car-5.jpg",
            "Chủ tịch Tinh hoa",
            "Đỉnh cao xa xỉ thượng thừa dành cho giới thượng lưu. Hàng ghế thương gia First-Class tích hợp bắp chân sưởi ấm và dàn âm thanh Burmester 4D High-End.",
            true
        ));
        list.add(new Car(
            6, "VinFast VF 9 Plus (Bản 6 Chỗ Ghế Cơ Trưởng)", "VinFast", "electric",
            2299000000L, 2450000000L, "2 Motor Điện Độc lập AWD",
            "402 mã lực / 620 Nm", "6.5 giây (0-100 km/h)", "Chuyển động trực tiếp 1 cấp",
            "200 km/h", "Pin CATL tiên tiến (602 km/lần sạc)",
            "images/car-6.jpg",
            "Tự Hào Việt Nam",
            "SUV điện cỡ lớn phong cách studio Pininfarina Ý. Hệ thống trợ lái nâng cao ADAS cấp độ 2 cùng dịch vụ thông minh Smart Service đỉnh cao.",
            false
        ));
        list.add(new Car(
            7, "Porsche 911 GT3 RS (Thế hệ 992)", "Porsche", "sport",
            19800000000L, 20500000000L, "4.0L Hút khí tự nhiên 6 xi-lanh đối đỉnh",
            "525 mã lực / 465 Nm", "3.2 giây (0-100 km/h)", "PDK 7 Cấp siêu tốc",
            "296 km/h", "Xăng tiêu chuẩn đường đua",
            "images/car-7.jpg",
            "Vua đường đua",
            "Quái thú đường đua hợp pháp lăn bánh trên phố. Hệ thống cánh gió khí động học chủ động DRS lấy cảm hứng trực tiếp từ xe đua công thức 1.",
            false
        ));
        list.add(new Car(
            8, "Lexus LX 600 VIP (Bản 4 Chỗ Độc Bản)", "Lexus", "suv",
            9990000000L, 10500000000L, "3.5L V6 Twin-Turbo Dual VVT-i",
            "409 mã lực / 650 Nm", "6.9 giây (0-100 km/h)", "10 Cấp Direct Shift",
            "210 km/h", "Dung tích bình 110L",
            "images/car-8.jpg",
            "VIP Chuyên Cơ",
            "Chuyên cơ mặt đất đến từ đất nước mặt trời mọc. Độ tin cậy bền bỉ vượt thời gian, cách âm đỉnh cao và khả năng off-road đa địa hình huyền thoại.",
            false
        ));
        list.add(new Car(
            9, "Range Rover SV LWB P530", "Land Rover", "luxury",
            14800000000L, 15200000000L, "4.4L V8 Twin-Turbocharged",
            "530 mã lực / 750 Nm", "4.6 giây (0-100 km/h)", "Tự động 8 cấp ZF",
            "261 km/h", "Dung tích bình 90L",
            "images/car-9.jpg",
            "Đỉnh cao SUV",
            "Vua của thế giới SUV quý tộc Anh Quốc. Chiều dài cơ sở siêu lớn, nội thất ốp gốm men thủ công và tủ lạnh mini đựng rượu sâm panh.",
            false
        ));
        return list;
    }

    private Car extractCar(ResultSet rs) throws Exception {
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
            rs.getString("image_url"),
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
            if (con == null) return defaultCars();
            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(extractCar(rs));
                }
            }
        } catch (Exception e) {
            System.err.println("[CarImpl] Lỗi findAll từ MySQL: " + e.getMessage());
            return defaultCars();
        }
        return list.isEmpty() ? defaultCars() : list;
    }

    @Override
    public List<Car> findFeatured() {
        List<Car> list = new ArrayList<>();
        String sql = "SELECT * FROM cars WHERE is_featured = TRUE ORDER BY id ASC";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con == null) {
                return defaultCars().stream().filter(Car::isFeatured).collect(Collectors.toList());
            }
            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(extractCar(rs));
                }
            }
        } catch (Exception e) {
            return defaultCars().stream().filter(Car::isFeatured).collect(Collectors.toList());
        }
        return list;
    }

    @Override
    public Car find(int id) {
        String sql = "SELECT * FROM cars WHERE id = ?";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con == null) {
                return defaultCars().stream().filter(c -> c.getId() == id).findFirst().orElse(null);
            }
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
        return defaultCars().stream().filter(c -> c.getId() == id).findFirst().orElse(null);
    }

    @Override
    public List<Car> filter(String category, String brand, String keyword, String priceRange) {
        List<Car> all = findAll();
        return all.stream().filter(car -> {
            boolean match = true;

            if (category != null && !category.trim().isEmpty() && !category.equalsIgnoreCase("all")) {
                match = match && car.getCategory().equalsIgnoreCase(category.trim());
            }

            if (brand != null && !brand.trim().isEmpty() && !brand.equalsIgnoreCase("all")) {
                match = match && car.getBrand().equalsIgnoreCase(brand.trim());
            }

            if (keyword != null && !keyword.trim().isEmpty()) {
                String kw = keyword.trim().toLowerCase();
                boolean nameMatch = car.getName() != null && car.getName().toLowerCase().contains(kw);
                boolean brandMatch = car.getBrand() != null && car.getBrand().toLowerCase().contains(kw);
                boolean descMatch = car.getDescription() != null && car.getDescription().toLowerCase().contains(kw);
                match = match && (nameMatch || brandMatch || descMatch);
            }

            if (priceRange != null && !priceRange.trim().isEmpty() && !priceRange.equalsIgnoreCase("all")) {
                switch (priceRange) {
                    case "under3b":
                        match = match && (car.getPrice() < 3000000000L);
                        break;
                    case "3b-7b":
                        match = match && (car.getPrice() >= 3000000000L && car.getPrice() <= 7000000000L);
                        break;
                    case "7b-11b":
                        match = match && (car.getPrice() > 7000000000L && car.getPrice() <= 11000000000L);
                        break;
                    case "above11b":
                        match = match && (car.getPrice() > 11000000000L);
                        break;
                }
            }

            return match;
        }).collect(Collectors.toList());
    }

    @Override
    public List<String> getBrands() {
        return Arrays.asList("Mercedes-Benz", "Porsche", "BMW", "Audi", "VinFast", "Lexus", "Land Rover");
    }
}
