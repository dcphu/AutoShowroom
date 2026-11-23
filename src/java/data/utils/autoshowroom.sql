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

-- 2. Bảng Xe ô tô (Cars) - 50 Xe (Mỗi Category đúng 10 Xe, ảnh thật độc bản 100%)
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
(2, 'BMW M8 Competition Gran Coupe', 'BMW', 'sport', 10990000000, 11500000000, '4.4L V8 M TwinPower Turbo', '625 mã lực / 750 Nm', '3.2 giây (0-100 km/h)', '8 Cấp M Steptronic với Drivelogic', '305 km/h', 'Dung tích bình xăng 68L', 'images/car-2.jpg', 'Bán chạy', 'Tuyệt tác Gran Coupe hòa quyện giữa vẻ đẹp khí động học đỉnh cao và sức mạnh trường đua của phân nhánh M Motorsport danh tiếng.', TRUE),
(3, 'Porsche 911 GT3 RS (Thế hệ 992)', 'Porsche', 'sport', 19800000000, 20500000000, '4.0L Hút khí tự nhiên 6 xi-lanh đối đỉnh', '525 mã lực / 465 Nm', '3.2 giây (0-100 km/h)', 'PDK 7 Cấp siêu tốc', '296 km/h', 'Xăng tiêu chuẩn đường đua', 'images/car-3.jpg', 'Vua đường đua', 'Quái thú đường đua hợp pháp lăn bánh trên phố. Hệ thống cánh gió khí động học chủ động DRS lấy cảm hứng trực tiếp từ xe đua công thức 1.', FALSE),
(4, 'Ferrari Roma Spider', 'Ferrari', 'sport', 18500000000, 19200000000, '3.9L V8 Twin-Turbo F154', '620 mã lực / 760 Nm', '3.4 giây (0-100 km/h)', 'Hộp số ly hợp kép DCT 8 cấp', '318 km/h', 'Xăng cao cấp RON 98', 'images/car-4.jpg', 'Siêu Phẩm Ý', 'Mui trần sang trọng mang phong cách La Mã cổ điển pha lẫn hiện đại. Hệ thống mái vải điện tử đóng mở trong 13.5 giây, trải nghiệm cabin đẳng cấp Ferrari.', TRUE),
(5, 'Bentley Continental GT Speed', 'Bentley', 'sport', 22000000000, 23000000000, '6.0L W12 TSI Twin-Turbocharged', '659 mã lực / 900 Nm', '3.6 giây (0-100 km/h)', 'DCT 8 cấp ZF SportShift', '335 km/h', 'Dung tích bình 90L', 'images/car-5.jpg', 'Quý Tộc Anh Quốc', 'Đỉnh cao grand tourer xa xỉ bậc nhất hành tinh. Động cơ W12 huyền thoại kết hợp hệ thống đánh lái 4 bánh điện tử và vi sai chống trượt điện tử eLSD.', FALSE),
(6, 'Ferrari 296 GTB Assetto Fiorano', 'Ferrari', 'sport', 23000000000, 24200000000, '3.0L V6 Turbo 120 độ + Motor điện Plug-in', '830 mã lực / 740 Nm', '2.9 giây (0-100 km/h)', '8 Cấp F1 ly hợp kép DCT', '330 km/h', 'Xăng lai Điện PHEV (25 km thuần điện)', 'images/car-6.jpg', 'Bứt Tốc 2.9s', 'Kỷ nguyên siêu xe hybrid mới của Ngựa chồm Maranello. Gói khí động học Assetto Fiorano nâng cấp sợi carbon siêu nhẹ và giảm chấn Multimatic đường đua.', TRUE),
(7, 'McLaren 750S Spider Performance', 'McLaren', 'sport', 22500000000, 23500000000, '4.0L V8 Twin-Turbo M840T', '750 mã lực / 800 Nm', '2.8 giây (0-100 km/h)', '7 Cấp SSG ly hợp kép', '332 km/h', 'Xăng RON 98 tiêu chuẩn đua', 'images/car-7.jpg', 'Khung Carbon Monocage', 'Đỉnh cao chế tác siêu xe Woking nước Anh. Khung gầm carbon Monocage II-S siêu cứng, cánh gió chủ động điều khiển điện tử phanh khí động học Airbrake.', FALSE),
(8, 'Lamborghini Huracan Tecnica', 'Lamborghini', 'sport', 19500000000, 20800000000, '5.2L V10 Hút khí tự nhiên', '640 mã lực / 565 Nm', '3.2 giây (0-100 km/h)', '7 Cấp LDF ly hợp kép', '325 km/h', 'Dung tích bình 80L', 'images/car-8.jpg', 'Âm Thanh V10 Huyền Thoại', 'Bản giao hưởng động cơ V10 hút khí tự nhiên thuần khiết cuối cùng. Hệ thống đánh lái bánh sau LDVI phân tích dữ liệu lái thời gian thực theo thời gian thực.', FALSE),
(9, 'Aston Martin DBS Superleggera', 'Aston Martin', 'sport', 25000000000, 26500000000, '5.2L V12 Twin-Turbo BiTurbo', '715 mã lực / 900 Nm', '3.4 giây (0-100 km/h)', 'ZF 8 Cấp tự động thể thao', '340 km/h', 'Xăng cao cấp RON 98', 'images/car-9.jpg', 'Chiến Mã Điệp Viên 007', 'Chiến binh Super GT uy lực nhất gia đình Aston Martin. Khung vỏ hợp kim nhôm siêu nhẹ Superleggera kết hợp bộ khuếch tán kép lấy cảm hứng từ xe đua F1.', TRUE),
(10, 'Chevrolet Corvette Z06 3LZ', 'Chevrolet', 'sport', 7500000000, 7900000000, '5.5L V8 LT6 Flat-Plane Crank Hút khí tự nhiên', '670 mã lực / 624 Nm', '2.6 giây (0-100 km/h)', 'Tremec 8 Cấp ly hợp kép DCT', '314 km/h', 'Xăng RON 95/98', 'images/car-10.jpg', 'Siêu Xe Động Cơ Giữa', 'Siêu phẩm động cơ đặt giữa cơ bắp Mỹ với khối động cơ V8 Flat-Plane Crank mạnh mẽ nhất thế giới, vòng tua máy chạm ngưỡng 8.600 vòng/phút xé gió gầm rú.', FALSE),
(11, 'Mercedes-Maybach S 680 4MATIC', 'Mercedes-Benz', 'sedan', 16990000000, 17500000000, '6.0L V12 BiTurbo Handcrafted', '612 mã lực / 900 Nm', '4.5 giây (0-100 km/h)', '9G-TRONIC 9 Cấp mượt mà', '250 km/h', 'Xăng không chì cao cấp', 'images/car-11.jpg', 'Chủ tịch Tinh hoa', 'Đỉnh cao xa xỉ thượng thừa dành cho giới thượng lưu. Hàng ghế thương gia First-Class tích hợp bắp chân sưởi ấm và dàn âm thanh Burmester 4D High-End.', TRUE),
(12, 'Rolls-Royce Ghost Extended', 'Rolls-Royce', 'sedan', 35000000000, 36500000000, '6.75L V12 Twin-Turbo Black Badge', '571 mã lực / 850 Nm', '4.5 giây (0-100 km/h)', 'ZF 8-Speed tự động cực êm', '250 km/h', 'Xăng không chì chuẩn Anh', 'images/car-12.jpg', 'Đỉnh Hào Môn', 'Trải nghiệm đẳng cấp vô song dành cho những ai vượt lên trên mọi thứ xa xỉ. Trần xe chứa 1.344 ngôi sao lấy cảm hứng từ bầu trời đêm Spire Mountain.', FALSE),
(13, 'Mercedes-Benz EQS 580 4MATIC', 'Mercedes-Benz', 'sedan', 6200000000, 6500000000, 'Động cơ Điện Kép 4MATIC', '516 mã lực / 855 Nm', '4.3 giây (0-100 km/h)', 'Tự động 1 cấp trực tiếp', '210 km/h', 'Pin 108.4 kWh (670 km/lần sạc)', 'images/car-13.jpg', 'Xe Điện Hạng Sang', 'Mẫu sedan điện flagship mở ra kỷ nguyên tương lai. Màn hình MBUX Hyperscreen liền khối 56 inch uốn cong trải dài cả khoang lái.', FALSE),
(14, 'Maserati Quattroporte Trofeo', 'Maserati', 'sedan', 12800000000, 13500000000, '3.8L V8 Twin-Turbo Ferrari', '580 mã lực / 730 Nm', '4.5 giây (0-100 km/h)', 'ZF 8 cấp tự động', '326 km/h', 'Dung tích bình 80L', 'images/car-14.jpg', 'Siêu Sedan Ý', 'Sedan thể thao đỉnh cao của cây đinh ba nước Ý trang bị trái tim V8 do Ferrari chế tác thủ công. Âm thanh ống xả thể thao đầy cảm xúc mê hoặc.', FALSE),
(15, 'BMW 760i xDrive M Sport (G70)', 'BMW', 'sedan', 6500000000, 6890000000, '4.4L V8 TwinPower Turbo Mild-Hybrid 48V', '544 mã lực / 750 Nm', '4.2 giây (0-100 km/h)', '8 Cấp Steptronic Sport', '250 km/h', 'Xăng Mild-Hybrid (Bình 74L)', 'images/car-15.jpg', 'Rạp Chiếu Phim 31.3 Inch', 'Đỉnh cao sedan công nghệ đầu bảng nhà BMW. Màn hình giải trí trần xe BMW Theater Screen 31.3 inch độ phân giải 8K, cửa tự động đóng mở thông minh điện tử.', TRUE),
(16, 'Audi A8L 55 TFSI Quattro Prestige', 'Audi', 'sedan', 5800000000, 6150000000, '3.0L V6 Turbocharged MHEV 48V', '340 mã lực / 500 Nm', '5.7 giây (0-100 km/h)', 'Tiptronic 8 Cấp mượt mà', '250 km/h', 'Xăng lai Điện Mild-Hybrid', 'images/car-16.jpg', 'Đèn Matrix OLED Kỹ Thuật Số', 'Kiến trúc sedan thương gia chuẩn mực nước Đức. Treo khí nén chủ động thích ứng Predictive Active Suspension dự đoán mặt đường nâng hạ thân xe trong tích tắc.', FALSE),
(17, 'Lexus LS 500h Executive Hybrid', 'Lexus', 'sedan', 8300000000, 8750000000, '3.5L V6 Động cơ kép Multi-Stage Hybrid', '354 mã lực / 350 Nm', '5.4 giây (0-100 km/h)', 'Multi-Stage Hybrid 10 cấp ảo', '250 km/h', 'Xăng lai Điện Hybrid (6.7L/100km)', 'images/car-17.jpg', 'Nghệ Thuật Kính Kiriko', 'Tuyệt tác thủ công Takumi đậm đà tinh thần Omotenashi Nhật Bản. Tấm ốp cửa bằng kính pha lê cắt vát Kiriko thủ công và da aniline hảo hạng.', FALSE),
(18, 'Mercedes-Benz S 450 4MATIC Luxury', 'Mercedes-Benz', 'sedan', 5550000000, 5850000000, '3.0L I6 Twin-Scroll Turbo EQ Boost', '367 mã lực / 500 Nm', '5.1 giây (0-100 km/h)', '9G-TRONIC 9 Cấp tự động', '250 km/h', 'Xăng EQ Boost (Bình 65L)', 'images/car-18.jpg', 'Sedan Doanh Nhân Số 1', 'Biểu tượng sedan hạng sang đẳng cấp toàn cầu. Đánh lái trục sau lên đến 10 độ giúp chiếc xe dài hơn 5m quay đầu linh hoạt như xe hatchback cỡ nhỏ.', FALSE),
(19, 'Genesis G90 3.5T E-Supercharger AWD', 'Genesis', 'sedan', 4200000000, 4500000000, '3.5L V6 Twin-Turbo + E-Supercharger 48V', '415 mã lực / 549 Nm', '5.1 giây (0-100 km/h)', 'Tự động 8 cấp', '250 km/h', 'Xăng RON 95 (Bình 73L)', 'images/car-19.jpg', 'Sedan Thượng Lưu Hàn Quốc', 'Sedan hạng sang cao cấp nhất châu Á. Hệ thống treo khí nén đa buồng Chamber Air Suspension cùng cửa hít điện tử tự động đóng bằng nút bấm trên bệ tì tay.', FALSE),
(20, 'Volvo S90 Recharge Ultimate Plug-in', 'Volvo', 'sedan', 2750000000, 2900000000, '2.0L Turbo + Supercharger + Motor điện T8', '455 mã lực / 709 Nm', '4.8 giây (0-100 km/h)', 'Geartronic 8 Cấp tự động', '180 km/h (Giới hạn an toàn)', 'Xăng lai Điện PHEV (90 km điện)', 'images/car-20.jpg', 'An Toàn Nhất Thế Giới', 'Sedan Bắc Âu lịch lãm với cần số pha lê Orrefors chế tác thủ công từ Thụy Điển, dàn âm thanh Bowers & Wilkins 19 loa tái hiện âm hưởng nhà hát Göteborg.', FALSE),
(21, 'Lexus LX 600 VIP (Bản 4 Chỗ Độc Bản)', 'Lexus', 'suv', 9990000000, 10500000000, '3.5L V6 Twin-Turbo Dual VVT-i', '409 mã lực / 650 Nm', '6.9 giây (0-100 km/h)', '10 Cấp Direct Shift', '210 km/h', 'Dung tích bình 110L', 'images/car-21.jpg', 'VIP Chuyên Cơ', 'Chuyên cơ mặt đất đến từ đất nước mặt trời mọc. Độ tin cậy bền bỉ vượt thời gian, cách âm đỉnh cao và khả năng off-road đa địa hình huyền thoại.', FALSE),
(22, 'Lamborghini Urus Performante', 'Lamborghini', 'suv', 16800000000, 17400000000, '4.0L V8 Twin-Turbocharged', '666 mã lực / 850 Nm', '3.3 giây (0-100 km/h)', 'ZF 8 cấp tự động thể thao', '306 km/h', 'Xăng tiêu chuẩn đường đua', 'images/car-22.jpg', 'SUV Siêu Xe', 'SUV nhanh nhất thế giới tại thời điểm ra mắt. Khung gầm carbon-fibre siêu nhẹ, hệ thống Lamborghini Dynamic Steering và chế độ lái RALLY trượt bánh phấn khích.', TRUE),
(23, 'Porsche Cayenne Turbo GT', 'Porsche', 'suv', 12200000000, 12900000000, '4.0L V8 Biturbo', '659 mã lực / 850 Nm', '3.3 giây (0-100 km/h)', 'Tiptronic S 8 cấp', '305 km/h', 'Dung tích bình 90L', 'images/car-23.jpg', 'SUV Đường Đua', 'Chiếc SUV giữ kỷ lục tốc độ hoàn thành vòng đua Nürburgring danh tiếng. Ống xả kép Titanium đặt giữa thân xe và trần xe bằng sợi carbon siêu nhẹ.', FALSE),
(24, 'BMW X7 M60i xDrive', 'BMW', 'suv', 7800000000, 8200000000, '4.4L V8 M TwinPower Turbo', '530 mã lực / 750 Nm', '4.7 giây (0-100 km/h)', 'Sport Steptronic 8 cấp', '250 km/h', 'Dung tích bình 83L', 'images/car-24.jpg', 'SUV Flagship', 'SUV 7 chỗ cỡ lớn đầu bảng gia đình BMW X-Series. Cụm đèn pha pha lê Iconic Glow phát sáng rực rỡ và hệ thống treo khí nén 2 cầu thích ứng đỉnh cao.', FALSE),
(25, 'Mercedes-AMG G 63 V8 Biturbo', 'Mercedes-Benz', 'suv', 11750000000, 12400000000, '4.0L V8 Biturbo Handcrafted', '585 mã lực / 850 Nm', '4.5 giây (0-100 km/h)', 'AMG SPEEDSHIFT TCT 9G', '240 km/h', 'Xăng cao cấp RON 98 (Bình 100L)', 'images/car-25.jpg', 'Ông Vua Địa Hình', 'Biểu tượng SUV địa hình bất tử của nước Đức. Ba khóa vi sai độc lập cơ học, ống xả kép hai bên hông xe tạo âm thanh gầm rú đặc trưng không thể nhầm lẫn.', TRUE),
(26, 'Aston Martin DBX707 V8', 'Aston Martin', 'suv', 21800000000, 22900000000, '4.0L V8 Twin-Turbo AMG tinh chỉnh', '707 mã lực / 900 Nm', '3.3 giây (0-100 km/h)', '9 Cấp ly hợp ướt Wet-Clutch', '310 km/h', 'Xăng cao cấp (Bình 85L)', 'images/car-26.jpg', 'SUV Mạnh Mẽ 707HP', 'Mãnh thú SUV xa xỉ đến từ xứ sở sương mù. Sức mạnh 707 mã lực biến chiếc SUV đồ sộ bứt tốc ngang ngửa những siêu xe đường đua thực thụ.', FALSE),
(27, 'Bentley Bentayga EWB Azure V8', 'Bentley', 'suv', 21000000000, 22200000000, '4.0L V8 Twin-Turbocharged', '550 mã lực / 770 Nm', '4.6 giây (0-100 km/h)', 'ZF 8 Cấp tự động', '290 km/h', 'Xăng không chì cao cấp', 'images/car-27.jpg', 'Ghế Hàng Không Airline Seat', 'Phiên bản trục cơ sở kéo dài EWB mang đến khoang sau rộng rãi như chuyên cơ riêng. Ghế Bentley Airline Seat có 22 hướng chỉnh và cảm biến tự động sưởi thông minh.', FALSE),
(28, 'Land Rover Defender 110 V8 Carpathian', 'Land Rover', 'suv', 10500000000, 11200000000, '5.0L V8 Supercharged siêu nạp', '525 mã lực / 625 Nm', '5.2 giây (0-100 km/h)', 'Tự động 8 cấp điện tử', '240 km/h', 'Dung tích bình 90L', 'images/car-28.jpg', 'Chiến Binh Off-Road V8', 'Chiến binh thám hiểm bất khuất mang khối động cơ Supercharged V8 5.0L siêu nạp gầm vang. Lớp sơn mờ satin Carpathian Grey phủ màng bảo vệ chống trầy xước.', FALSE),
(29, 'Audi RS Q8 Performance Quattro', 'Audi', 'suv', 9800000000, 10400000000, '4.0L V8 Twin-Turbo MHEV 48V', '600 mã lực / 800 Nm', '3.8 giây (0-100 km/h)', '8 Cấp Tiptronic thể thao', '305 km/h', 'Xăng lai Điện Mild-Hybrid', 'images/car-29.jpg', 'SUV Coupe Hiệu Năng Cao', 'SUV Coupe mang gen thể thao đường đua Audi Sport. Vi sai thể thao Quattro Sport Differential cùng hệ thống thanh cân bằng chủ động triệt tiêu hoàn toàn góc nghiêng thân xe.', FALSE),
(30, 'Cadillac Escalade-V Series 6.2L Supercharged', 'Cadillac', 'suv', 12000000000, 12800000000, '6.2L V8 Siêu nạp Handcrafted', '682 mã lực / 885 Nm', '4.4 giây (0-100 km/h)', '10 Cấp tự động điều khiển điện tử', '200 km/h', 'Xăng cao cấp (Bình 107L)', 'images/car-30.jpg', 'Khủng Long Mỹ 682HP', 'Chiếc SUV full-size uy quyền bậc nhất nước Mỹ mang logo V-Series danh giá. Màn hình cong OLED 38 inch siêu sắc nét và dàn âm thanh AKG Studio Reference 36 loa.', TRUE),
(31, 'Porsche Taycan Turbo S Cross Turismo', 'Porsche', 'electric', 8500000000, 8900000000, 'Động cơ Điện kép Permanent Magnet', '761 mã lực (Launch Control)', '2.8 giây (0-100 km/h)', 'Hộp số 2 cấp độc quyền Porsche', '260 km/h', 'Pin 93.4 kWh (512 km/lần sạc)', 'images/car-31.jpg', 'Xe Điện Flagship', 'Đỉnh cao thuần điện phong cách thể thao Đức. Trải nghiệm cảm giác dính ghế tức thì cùng hệ thống treo khí nén chủ động 3 buồng PASM.', TRUE),
(32, 'Audi RS e-tron GT Quattro', 'Audi', 'electric', 7200000000, 7500000000, 'Hệ dẫn động 4 bánh toàn thời gian Quattro Điện', '637 mã lực / 830 Nm', '3.3 giây (0-100 km/h)', 'Tự động 2 cấp', '250 km/h', 'Phạm vi di chuyển 472 km', 'images/car-32.jpg', 'Ưu đãi 100% trước bạ', 'Ngôn ngữ thiết kế vị lai cuốn hút từng ánh nhìn. Công nghệ sạc nhanh 800V giúp nạp từ 5% lên 80% chỉ trong vòng 22.5 phút.', TRUE),
(33, 'VinFast VF 9 Plus (Bản 6 Chỗ Ghế Cơ Trưởng)', 'VinFast', 'electric', 2299000000, 2450000000, '2 Motor Điện Độc lập AWD', '402 mã lực / 620 Nm', '6.5 giây (0-100 km/h)', 'Chuyển động trực tiếp 1 cấp', '200 km/h', 'Pin CATL tiên tiến (602 km/lần sạc)', 'images/car-33.jpg', 'Tự Hào Việt Nam', 'SUV điện cỡ lớn phong cách studio Pininfarina Ý. Hệ thống trợ lái nâng cao ADAS cấp độ 2 cùng dịch vụ thông minh Smart Service đỉnh cao.', FALSE),
(34, 'BMW iX M60 xDrive', 'BMW', 'electric', 5490000000, 5890000000, 'Dual Electric Motor BMW M', '619 mã lực / 1.100 Nm', '3.8 giây (0-100 km/h)', 'Tự động 1 cấp', '250 km/h', 'Pin 111.5 kWh (566 km/lần sạc)', 'images/car-34.jpg', 'Flagship Điện BMW', 'SUV thuần điện mạnh nhất của gia đình BMW M. Khung xe bằng nhôm và nhựa gia cường sợi carbon Carbon Cage siêu nhẹ, dàn âm thanh Bowers & Wilkins 4D Diamond.', FALSE),
(35, 'Rolls-Royce Spectre Siêu Sang Điện', 'Rolls-Royce', 'electric', 17990000000, 18800000000, 'Dual Motor điện tách rời 2 trục', '584 mã lực / 900 Nm', '4.5 giây (0-100 km/h)', 'Tự động 1 cấp siêu êm ái', '250 km/h', 'Pin 102 kWh (530 km/lần sạc)', 'images/car-35.jpg', 'Rolls-Royce Thuần Điện Đầu Tiên', 'Kiệt tác coupe siêu sang thuần điện đầu tiên trong lịch sử Rolls-Royce. Cửa xe mở ngược Star Shower tích hợp 4.796 ngôi sao phát sáng lấp lánh như vũ trụ đêm.', TRUE),
(36, 'Lotus Eletre R Hyper-SUV', 'Lotus', 'electric', 8880000000, 9300000000, 'Dual Motor điện kép công suất cực đại', '905 mã lực / 985 Nm', '2.95 giây (0-100 km/h)', 'Hộp số 2 cấp trục sau', '265 km/h', 'Pin 112 kWh (490 km/lần sạc)', 'images/car-36.jpg', 'Hyper-SUV Điện 905HP', 'Hyper-SUV điện 2 cầu nhanh nhất thế giới. Cảm biến LiDAR ẩn hiện thông minh cùng công nghệ khí động học xẻ gió Porosity độc quyền Lotus.', FALSE),
(37, 'Tesla Model S Plaid Tri-Motor', 'Tesla', 'electric', 4500000000, 4850000000, 'Tri-Motor AWD điện 3 động cơ độc lập', '1020 mã lực / 1420 Nm', '1.99 giây (0-100 km/h)', 'Truyền động 1 cấp trực tiếp', '322 km/h', 'Pin 100 kWh (637 km/lần sạc)', 'images/car-37.jpg', 'Gia Tốc 1.99s', 'Xe thương mại bứt tốc nhanh nhất hành tinh từ 0 lên 100 km/h dưới 2 giây. Vô lăng Yoke phong cách phi thuyền không gian và hệ thống tự lái FSD.', TRUE),
(38, 'Lucid Air Sapphire Edition', 'Lucid', 'electric', 6200000000, 6600000000, '3 Motor điện siêu công suất Sapphire', '1234 mã lực / 1940 Nm', '1.89 giây (0-100 km/h)', '1 Cấp đơn mô-men xoắn xoay chiều', '330 km/h', 'Kiến trúc 900V+ (687 km/lần sạc)', 'images/car-38.jpg', '1.234 Mã Lực', 'Siêu sedan điện sang trọng của Mỹ sở hữu sức mạnh 1.234 mã lực. Tốc độ sạc nhanh nhất thế giới nạp 400km chỉ trong 15 phút sạc siêu tốc.', FALSE),
(39, 'Mercedes-AMG EQE 53 4MATIC+ Dynamic', 'Mercedes-Benz', 'electric', 4800000000, 5100000000, 'Dual Motor AMG Performance điện 400V', '687 mã lực / 1000 Nm', '3.5 giây (0-100 km/h)', 'Tự động 1 cấp AMG', '240 km/h', 'Pin 90.6 kWh (518 km/lần sạc)', 'images/car-39.jpg', 'AMG Performance EV', 'Sedan thể thao điện hiệu năng cao AMG với gói RACE START tăng lực tức thời, hệ thống âm thanh AMG SOUND EXPERIENCE truyền cảm xúc phấn khích.', FALSE),
(40, 'Porsche Macan EV Turbo AWD', 'Porsche', 'electric', 5900000000, 6250000000, 'Dual Motor PSM thế hệ mới nền tảng PPE', '639 mã lực (Launch Control)', '3.3 giây (0-100 km/h)', 'Hộp số 1 cấp tỷ số truyền tối ưu', '260 km/h', 'Pin 100 kWh sạc nhanh 270kW (591 km)', 'images/car-40.jpg', 'Nền Tảng PPE 800V', 'SUV điện thế hệ mới mang ADN thể thao thuần khiết Porsche. Đánh lái trục sau 5 độ và khóa vi sai điện tử cầu sau Porsche Torque Vectoring Plus.', FALSE),
(41, 'Range Rover SV LWB P530', 'Land Rover', 'luxury', 14800000000, 15200000000, '4.4L V8 Twin-Turbocharged', '530 mã lực / 750 Nm', '4.6 giây (0-100 km/h)', 'Tự động 8 cấp ZF', '261 km/h', 'Dung tích bình 90L', 'images/car-41.jpg', 'Đỉnh cao SUV', 'Vua của thế giới SUV quý tộc Anh Quốc. Chiều dài cơ sở siêu lớn, nội thất ốp gốm men thủ công và tủ lạnh mini đựng rượu sâm panh.', FALSE),
(42, 'Mercedes-AMG GLE 63 S 4MATIC+', 'Mercedes-Benz', 'luxury', 8900000000, 9300000000, '4.0L V8 Biturbo Mild-Hybrid', '612 mã lực / 850 Nm', '3.8 giây (0-100 km/h)', 'AMG SPEEDSHIFT TCT 9G', '280 km/h', 'Dung tích bình 85L', 'images/car-42.jpg', 'SUV AMG', 'Sự kết hợp hoàn hảo giữa không gian xa hoa và sức mạnh của khối động cơ V8 Biturbo danh tiếng.', FALSE),
(43, 'Rolls-Royce Phantom VIII Series II', 'Rolls-Royce', 'luxury', 48000000000, 51000000000, '6.75L V12 Twin-Turbocharged', '563 mã lực / 900 Nm', '5.3 giây (0-100 km/h)', 'ZF 8 cấp hỗ trợ vệ tinh SAT', '250 km/h', 'Xăng không chì thượng hạng', 'images/car-43.jpg', 'Đỉnh Cao Nhân Loại', 'Chiếc xe xa xỉ bậc nhất hành tinh. Không gian tĩnh lặng như phòng thu với 130kg vật liệu cách âm, thảm len cừu dày và phòng triển lãm The Gallery trên táp-lô.', TRUE),
(44, 'Rolls-Royce Cullinan Black Badge', 'Rolls-Royce', 'luxury', 38000000000, 40500000000, '6.75L V12 Twin-Turbo nâng cấp', '600 mã lực / 900 Nm', '4.9 giây (0-100 km/h)', 'ZF 8 cấp tự động', '250 km/h', 'Dung tích bình 100L', 'images/car-44.jpg', 'Kim Cương Đen', 'SUV siêu sang quyền lực nhất thế giới mang phong cách bóng đêm Black Badge. Ghế ngắm cảnh Viewing Suite mở điện phía đuôi xe thưởng thức hoàng hôn.', TRUE),
(45, 'Mercedes-Maybach GLS 600 4MATIC', 'Mercedes-Benz', 'luxury', 12500000000, 13200000000, '4.0L V8 Biturbo Mild-Hybrid EQ Boost', '558 mã lực / 730 Nm', '4.9 giây (0-100 km/h)', '9G-TRONIC 9 Cấp tự động', '250 km/h', 'Xăng RON 98', 'images/car-45.jpg', 'Chuyên Cơ Gầm Cao', 'SUV siêu sang mang phong cách du thuyền thượng lưu. Bệ bước chân tự động thò thụt mạ chrome phát sáng và chế độ nhún nhảy thoát lầy Free Driving Mode.', FALSE),
(46, 'Range Rover Autobiography LWB 4.4L', 'Land Rover', 'luxury', 13200000000, 13900000000, '4.4L V8 Twin-Turbocharged BMW M', '530 mã lực / 750 Nm', '4.6 giây (0-100 km/h)', 'ZF 8 cấp điện tử', '250 km/h', 'Xăng tiêu chuẩn RON 95', 'images/car-46.jpg', 'Hoàng Gia Anh Quốc', 'Biểu tượng quý tộc xứ sương mù. Ghế sau bọc da bán Aniline độc lập điều hòa 24 hướng, bàn làm việc mở điện và hệ thống khử tiếng ồn chủ động thế hệ 3.', FALSE),
(47, 'Bentley Mulsanne Speed Final Series', 'Bentley', 'luxury', 30000000000, 32000000000, '6.75L V8 Twin-Turbo huyền thoại L-Series', '537 mã lực / 1100 Nm', '4.9 giây (0-100 km/h)', 'ZF 8 cấp thể thao', '305 km/h', 'Dung tích bình 96L', 'images/car-47.jpg', 'Tuyệt Tác Thủ Công Crewe', 'Mẫu sedan siêu sang thủ công thuần chất Anh Quốc cuối cùng trang bị động cơ V8 6.75L huyền thoại. Mất hơn 400 giờ chế tác bằng tay tại Crewe.', FALSE),
(48, 'Lexus LM 500h 4 Chỗ Siêu VIP', 'Lexus', 'luxury', 8600000000, 9100000000, '2.4L Turbo Hybrid Dual-Boost AWD', '371 mã lực / 460 Nm', '6.9 giây (0-100 km/h)', 'Direct Shift 6 cấp Hybrid', '210 km/h', 'Xăng lai Điện Hybrid cao cấp', 'images/car-48.jpg', 'Khoang Thương Gia Di Động', 'MPV siêu sang khoang 4 chỗ tách biệt hoàn toàn bởi vách ngăn kính điện tử làm mờ, tích hợp màn hình chiếu 48 inch siêu rộng và tủ lạnh cá nhân.', FALSE),
(49, 'Hongqi L5 V12 Limousine Chủ Tịch', 'Hongqi', 'luxury', 15000000000, 16500000000, '6.0L V12 Hút khí tự nhiên nhôm nguyên khối', '408 mã lực / 550 Nm', '6.2 giây (0-100 km/h)', 'Tự động 6 cấp thủy lực', '220 km/h', 'Dung tích bình 105L', 'images/car-49.jpg', 'Quốc Bảo Hoàng Gia', 'Mẫu xe đại diện nguyên thủ quốc gia. Tay nắm cửa mạ vàng khảm ngọc bích Điêu Thuyền quý hiếm, nội thất ốp gỗ gõ truyền thống và huy hiệu cờ đỏ biểu tượng.', TRUE),
(50, 'Bentley Flying Spur W12 Mulliner', 'Bentley', 'luxury', 24500000000, 26000000000, '6.0L W12 TSI Twin-Turbocharged', '635 mã lực / 900 Nm', '3.8 giây (0-100 km/h)', 'DCT 8 Cấp ly hợp kép', '333 km/h', 'Xăng cao cấp RON 98', 'images/car-50.jpg', 'Kiệt Tác Mulliner', 'Đỉnh cao sedan siêu sang nước Anh kết hợp hiệu năng siêu xe. Gỗ ốp 3D Diamond Knurling chạm khắc đa chiều và biểu tượng Flying B phát sáng thụt thò điện tử.', TRUE);

-- 3. Bảng Yêu cầu Lái thử (Bookings)
DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    car_id INT,
    showroom_location VARCHAR(150) NOT NULL,
    booking_date DATE NOT NULL,
    time_slot VARCHAR(50) NOT NULL,
    driver_license VARCHAR(100),
    status VARCHAR(50) DEFAULT 'Chờ xác nhận',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Bảng Tin nhắn Liên hệ & Tư vấn (Contacts)
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(150),
    subject VARCHAR(255),
    message TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'Chưa phản hồi',
    reply_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Mẫu dữ liệu cho Bookings
INSERT INTO bookings (customer_name, phone, email, car_id, showroom_location, booking_date, time_slot, driver_license, status, notes) VALUES
('Nguyễn Văn Tuấn', '0912 345 678', 'tuan.nguyen@vip.vn', 1, 'Chi nhánh Keangnam Landmark 72, Hà Nội', '2026-11-28', '09:00 - 10:30', 'Hạng B2', 'Đã xác nhận', 'Khách hẹn trải nghiệm bứt tốc chế độ Race trên đại lộ Thăng Long.'),
('Lê Thị Minh Châu', '0988 776 655', 'chau.le@capital.com', 2, 'Chi nhánh KĐT Sala, TP. Thủ Đức, TP. HCM', '2026-11-29', '14:30 - 16:00', 'Hạng B2', 'Chờ xác nhận', 'Cần chuẩn bị cổng sạc nhanh DC 150kW demo tốc độ nạp pin thực tế.');

-- Mẫu dữ liệu cho Contacts
INSERT INTO contacts (fullname, phone, email, subject, message, status) VALUES
('Trần Quang Huy', '0933 666 888', 'huy.tran@vip.vn', 'Yêu cầu cá nhân hóa nội thất Maybach', 'Tôi muốn đặt thêm gói âm thanh Burmester High-End 4D và bọc da Nappa màu kem riêng.', 'Đã phản hồi'),
('Vũ Hải Đăng', '0977 999 111', 'dangvu@corp.com', 'Tư vấn gói vay doanh nghiệp', 'Bên công ty mình muốn mua 2 chiếc VF9 bản 6 chỗ, xin gửi bảng tiến độ giải ngân ngân hàng.', 'Chưa phản hồi');
