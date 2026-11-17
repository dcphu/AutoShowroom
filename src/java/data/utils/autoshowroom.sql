-- Script khởi tạo Database autoshowroom cho Hệ thống Showroom Ô Tô AutoLux
CREATE DATABASE IF NOT EXISTS autoshowroom CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE autoshowroom;

-- 1. Bảng Danh mục xe (Categories)
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    icon VARCHAR(100) DEFAULT 'fa-solid fa-car'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories (id, name, slug, icon) VALUES
(1, 'Sedan Hạng Sang', 'sedan', 'fa-solid fa-car-side'),
(2, 'SUV / Crossover', 'suv', 'fa-solid fa-truck-monster'),
(3, 'Siêu Xe Thể Thao', 'sport', 'fa-solid fa-gauge-high'),
(4, 'Xe Điện Flagship EV', 'electric', 'fa-solid fa-bolt'),
(5, 'Siêu Sang Quý Tộc', 'luxury', 'fa-solid fa-crown');

-- 2. Bảng Xe ô tô (Cars)
DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price BIGINT NOT NULL,
    original_price BIGINT DEFAULT 0,
    engine VARCHAR(255),
    power VARCHAR(255),
    acceleration VARCHAR(100),
    transmission VARCHAR(150),
    top_speed VARCHAR(100),
    range_or_fuel VARCHAR(150),
    image_url TEXT,
    badge VARCHAR(100),
    description TEXT,
    is_featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cars (id, name, brand, category, price, original_price, engine, power, acceleration, transmission, top_speed, range_or_fuel, image_url, badge, description, is_featured) VALUES
(1, 'Mercedes-AMG GT 63 S E-Performance', 'Mercedes-Benz', 'sport', 12500000000, 13200000000, '4.0L V8 Biturbo + Motor điện Hybrid', '843 mã lực / 1.470 Nm', '2.9 giây (0-100 km/h)', 'AMG SPEEDSHIFT MCT 9G', '316 km/h', 'Xăng lai Điện (PHEV)', 'images/car-1.jpg', 'Siêu phẩm AMG', 'Chiếc 4 cửa mạnh mẽ nhất lịch sử AMG, kết hợp khối động cơ V8 Biturbo danh tiếng cùng công nghệ truyền động điện tử F1 độc quyền.', TRUE),
(2, 'Porsche Taycan Turbo S Cross Turismo', 'Porsche', 'electric', 8500000000, 8900000000, 'Động cơ Điện kép Permanent Magnet', '761 mã lực (Launch Control)', '2.8 giây (0-100 km/h)', 'Hộp số 2 cấp độc quyền Porsche', '260 km/h', 'Pin 93.4 kWh (512 km/lần sạc)', 'images/car-2.jpg', 'Xe Điện Flagship', 'Đỉnh cao thuần điện phong cách thể thao Đức. Trải nghiệm cảm giác dính ghế tức thì cùng hệ thống treo khí nén chủ động 3 buồng PASM.', TRUE),
(3, 'BMW M8 Competition Gran Coupe', 'BMW', 'sport', 10990000000, 11500000000, '4.4L V8 M TwinPower Turbo', '625 mã lực / 750 Nm', '3.2 giây (0-100 km/h)', '8 Cấp M Steptronic với Drivelogic', '305 km/h', 'Dung tích bình xăng 68L', 'images/car-3.jpg', 'Bán chạy', 'Tuyệt tác Gran Coupe hòa quyện giữa vẻ đẹp khí động học đỉnh cao và sức mạnh trường đua của phân nhánh M Motorsport danh tiếng.', TRUE),
(4, 'Audi RS e-tron GT Quattro', 'Audi', 'electric', 7200000000, 7500000000, 'Hệ dẫn động 4 bánh toàn thời gian Quattro Điện', '637 mã lực / 830 Nm', '3.3 giây (0-100 km/h)', 'Tự động 2 cấp', '250 km/h', 'Phạm vi di chuyển 472 km', 'images/car-4.jpg', 'Ưu đãi 100% trước bạ', 'Ngôn ngữ thiết kế vị lai cuốn hút từng ánh nhìn. Công nghệ sạc nhanh 800V giúp nạp từ 5% lên 80% chỉ trong vòng 22.5 phút.', TRUE),
(5, 'Mercedes-Maybach S 680 4MATIC', 'Mercedes-Benz', 'luxury', 16990000000, 17500000000, '6.0L V12 BiTurbo Handcrafted', '612 mã lực / 900 Nm', '4.5 giây (0-100 km/h)', '9G-TRONIC 9 Cấp mượt mà', '250 km/h', 'Xăng không chì cao cấp', 'images/car-5.jpg', 'Chủ tịch Tinh hoa', 'Đỉnh cao xa xỉ thượng thừa dành cho giới thượng lưu. Hàng ghế thương gia First-Class tích hợp bắp chân sưởi ấm và dàn âm thanh Burmester 4D High-End.', TRUE),
(6, 'VinFast VF 9 Plus (Bản 6 Chỗ Ghế Cơ Trưởng)', 'VinFast', 'electric', 2299000000, 2450000000, '2 Motor Điện Độc lập AWD', '402 mã lực / 620 Nm', '6.5 giây (0-100 km/h)', 'Chuyển động trực tiếp 1 cấp', '200 km/h', 'Pin CATL tiên tiến (602 km/lần sạc)', 'images/car-6.jpg', 'Tự Hào Việt Nam', 'SUV điện cỡ lớn phong cách studio Pininfarina Ý. Hệ thống trợ lái nâng cao ADAS cấp độ 2 cùng dịch vụ thông minh Smart Service đỉnh cao.', FALSE),
(7, 'Porsche 911 GT3 RS (Thế hệ 992)', 'Porsche', 'sport', 19800000000, 20500000000, '4.0L Hút khí tự nhiên 6 xi-lanh đối đỉnh', '525 mã lực / 465 Nm', '3.2 giây (0-100 km/h)', 'PDK 7 Cấp siêu tốc', '296 km/h', 'Xăng tiêu chuẩn đường đua', 'images/car-7.jpg', 'Vua đường đua', 'Quái thú đường đua hợp pháp lăn bánh trên phố. Hệ thống cánh gió khí động học chủ động DRS lấy cảm hứng trực tiếp từ xe đua công thức 1.', FALSE),
(8, 'Lexus LX 600 VIP (Bản 4 Chỗ Độc Bản)', 'Lexus', 'suv', 9990000000, 10500000000, '3.5L V6 Twin-Turbo Dual VVT-i', '409 mã lực / 650 Nm', '6.9 giây (0-100 km/h)', '10 Cấp Direct Shift', '210 km/h', 'Dung tích bình 110L', 'images/car-8.jpg', 'VIP Chuyên Cơ', 'Chuyên cơ mặt đất đến từ đất nước mặt trời mọc. Độ tin cậy bền bỉ vượt thời gian, cách âm đỉnh cao và khả năng off-road đa địa hình huyền thoại.', FALSE),
(9, 'Range Rover SV LWB P530', 'Land Rover', 'luxury', 14800000000, 15200000000, '4.4L V8 Twin-Turbocharged', '530 mã lực / 750 Nm', '4.6 giây (0-100 km/h)', 'Tự động 8 cấp ZF', '261 km/h', 'Dung tích bình 90L', 'images/car-9.jpg', 'Đỉnh cao SUV', 'Vua của thế giới SUV quý tộc Anh Quốc. Chiều dài cơ sở siêu lớn, nội thất ốp gốm men thủ công và tủ lạnh mini đựng rượu sâm panh.', FALSE);

-- 3. Bảng Lịch Đặt Lái Thử (Bookings)
DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    email VARCHAR(150),
    car_id INT,
    car_name VARCHAR(255),
    booking_date VARCHAR(50),
    booking_time VARCHAR(50),
    location_type VARCHAR(50) DEFAULT 'showroom',
    notes TEXT,
    status VARCHAR(50) DEFAULT 'Chờ xác nhận',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO bookings (id, full_name, phone, email, car_id, car_name, booking_date, booking_time, location_type, notes, status) VALUES
(101, 'Nguyễn Văn An', '0905123456', 'an.nguyen@gmail.com', 1, 'Mercedes-AMG GT 63 S E-Performance', '20/11/2026', '09:00', 'showroom', 'Muốn thử tăng tốc trên đường thử và tư vấn gói cá nhân hóa màu sơn Designo.', 'Đã xác nhận'),
(102, 'Trần Thị Mai Phương', '0988776655', 'phuong.tran@vietgroup.vn', 2, 'Porsche Taycan Turbo S Cross Turismo', '22/11/2026', '14:30', 'home', 'Yêu cầu mang xe đến khu đô thị Sala để trải nghiệm thực tế cùng gia đình.', 'Chờ xác nhận');

-- 4. Bảng Tin Nhắn Tư Vấn & Phản Hồi (Contacts)
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    email VARCHAR(150),
    subject VARCHAR(255),
    message TEXT,
    status VARCHAR(50) DEFAULT 'Chưa phản hồi',
    reply_message TEXT,
    replied_by VARCHAR(100),
    replied_at VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO contacts (id, full_name, phone, email, subject, message, status, reply_message, replied_by, replied_at) VALUES
(101, 'Lê Hoàng Long', '0912345678', 'long.le@hoanglongcorp.com', 'Tư vấn mua xe trả góp Maybach S680', 'Tôi muốn biết hạn mức vay tối đa của ngân hàng đối với dòng xe Maybach S680 và thời gian giải ngân bao lâu?', 'Đã phản hồi', 'Chào anh Long, dòng xe Maybach S680 hiện được ngân hàng đối tác hỗ trợ vay đến 85% trong 8 năm, thủ tục giải ngân chỉ trong 24 giờ. Chuyên viên tài chính của AutoLux sẽ liên hệ trực tiếp gửi bảng dự toán chi tiết cho anh.', 'Trần Quang Huy (Trưởng phòng KD)', '13/11/2026 10:45'),
(102, 'Vũ Đình Tuấn', '0933221100', 'tuan.vu@architect.vn', 'Hỏi thời gian bàn giao xe Porsche 911 GT3 RS', 'Mẫu xe GT3 RS màu xám xi-măng Arctic Grey hiện có sẵn giao ngay tại showroom Hà Nội không?', 'Chưa phản hồi', NULL, NULL, NULL);

