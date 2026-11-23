-- Script khởi tạo Database autoshowroom cho Hệ thống Showroom Ô Tô AutoLux (50 Xe Tuyển Chọn - Mỗi Loại 10 Xe)
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

-- 2. Bảng Xe ô tô (Cars) - 50 Xe (Mỗi Category đúng 10 Xe)
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
-- =================== NHÓM 1: SPORT (SIÊU XE THỂ THAO - 10 XE) ===================
(1, 'Mercedes-AMG GT 63 S E-Performance', 'Mercedes-Benz', 'sport', 12500000000, 13200000000, '4.0L V8 Biturbo + Motor điện Hybrid', '843 mã lực / 1.470 Nm', '2.9 giây (0-100 km/h)', 'AMG SPEEDSHIFT MCT 9G', '316 km/h', 'Xăng lai Điện (PHEV)', 'images/car-1.jpg', 'Siêu phẩm AMG', 'Chiếc 4 cửa mạnh mẽ nhất lịch sử AMG, kết hợp khối động cơ V8 Biturbo danh tiếng cùng công nghệ truyền động điện tử F1 độc quyền.', TRUE),
(3, 'BMW M8 Competition Gran Coupe', 'BMW', 'sport', 10990000000, 11500000000, '4.4L V8 M TwinPower Turbo', '625 mã lực / 750 Nm', '3.2 giây (0-100 km/h)', '8 Cấp M Steptronic với Drivelogic', '305 km/h', 'Dung tích bình xăng 68L', 'images/car-3.jpg', 'Bán chạy', 'Tuyệt tác Gran Coupe hòa quyện giữa vẻ đẹp khí động học đỉnh cao và sức mạnh trường đua của phân nhánh M Motorsport danh tiếng.', TRUE),
(7, 'Porsche 911 GT3 RS (Thế hệ 992)', 'Porsche', 'sport', 19800000000, 20500000000, '4.0L Hút khí tự nhiên 6 xi-lanh đối đỉnh', '525 mã lực / 465 Nm', '3.2 giây (0-100 km/h)', 'PDK 7 Cấp siêu tốc', '296 km/h', 'Xăng tiêu chuẩn đường đua', 'images/car-7.jpg', 'Vua đường đua', 'Quái thú đường đua hợp pháp lăn bánh trên phố. Hệ thống cánh gió khí động học chủ động DRS lấy cảm hứng trực tiếp từ xe đua công thức 1.', FALSE),
(10, 'Ferrari Roma Spider', 'Ferrari', 'sport', 18500000000, 19200000000, '3.9L V8 Twin-Turbo F154', '620 mã lực / 760 Nm', '3.4 giây (0-100 km/h)', 'Hộp số ly hợp kép DCT 8 cấp', '318 km/h', 'Xăng cao cấp RON 98', 'images/car-10.jpg', 'Siêu Phẩm Ý', 'Mui trần sang trọng mang phong cách La Mã cổ điển pha lẫn hiện đại. Mái vải điện tử đóng mở trong 13.5 giây.', TRUE),
(13, 'Bentley Continental GT Speed', 'Bentley', 'sport', 22000000000, 23000000000, '6.0L W12 TSI Twin-Turbocharged', '659 mã lực / 900 Nm', '3.6 giây (0-100 km/h)', 'DCT 8 cấp ZF SportShift', '335 km/h', 'Dung tích bình 90L xăng cao cấp', 'images/car-13.jpg', 'Grand Tourer', 'Xe Grand Tourer thực thụ: 335 km/h trên đường thẳng nhưng vẫn có thể thong dong qua phố. Nội thất ốp gỗ thủ công Briar.', FALSE),
(33, 'Ferrari 296 GTB Assetto Fiorano', 'Ferrari', 'sport', 23000000000, 24200000000, '3.0L V6 Turbo 120° + Motor điện PHEV', '830 mã lực / 740 Nm', '2.9 giây (0-100 km/h)', 'DCT 8 cấp F1', '330 km/h', 'Xăng lai Điện 7.45 kWh', 'images/car-33.jpg', 'PHEV Siêu Tốc', 'Siêu xe berlinetta hybrid sạc ngoài đỉnh cao mang lại cảm xúc phấn khích chưa từng có cùng âm thanh Piccolo V12 trứ danh.', TRUE),
(34, 'McLaren 750S Spider Performance', 'McLaren', 'sport', 22500000000, 23800000000, '4.0L V8 Twin-Turbo M840T', '750 mã lực / 800 Nm', '2.8 giây (0-100 km/h)', 'SSG 7 cấp ly hợp kép', '332 km/h', 'Xăng cao cấp RON 98', 'images/car-34.jpg', 'Khung Carbon Siêu Nhẹ', 'Siêu phẩm siêu xe Anh Quốc với khung thân Monocage II-S siêu nhẹ, kiểm soát khung gầm thế hệ 3 Proactive Chassis Control III.', FALSE),
(35, 'Lamborghini Huracan Tecnica', 'Lamborghini', 'sport', 19500000000, 20400000000, '5.2L V10 Hút khí tự nhiên thuần chủng', '640 mã lực / 565 Nm', '3.2 giây (0-100 km/h)', 'LDF 7 cấp ly hợp kép', '325 km/h', 'Xăng RON 98 tiêu chuẩn', 'images/car-35.jpg', 'V10 Huyền Thoại', 'Bản nâng cấp khí động học hoàn hảo nối liền đường phố và trường đua. Động cơ V10 hút khí tự nhiên đem lại âm thanh phấn khích tột cùng.', FALSE),
(36, 'Aston Martin DBS Superleggera', 'Aston Martin', 'sport', 25000000000, 26500000000, '5.2L V12 Twin-Turbocharged', '715 mã lực / 900 Nm', '3.4 giây (0-100 km/h)', 'ZF 8 cấp tự động gắn cầu sau', '340 km/h', 'Xăng RON 98 cao cấp', 'images/car-36.jpg', 'Tuyệt Tác Anh Quốc', 'Chiếc Super GT đầu bảng của Aston Martin. Thân xe carbon siêu nhẹ Superleggera kết hợp cánh gió ảo Aeroblade II cho lực nén 180kg.', TRUE),
(37, 'Chevrolet Corvette Z06 3LZ', 'Chevrolet', 'sport', 7500000000, 8200000000, '5.5L V8 LT6 Flat-Plane Crank DOHC', '670 mã lực / 624 Nm', '2.6 giây (0-100 km/h)', 'Tremec 8 cấp ly hợp kép', '314 km/h', 'Xăng thể thao RON 98', 'images/car-37.jpg', 'Siêu Xe Mỹ', 'Động cơ V8 hút khí tự nhiên mạnh mẽ nhất từng được sản xuất hàng loạt. Vòng tua cực đại chạm ngưỡng 8.600 vòng/phút.', FALSE),

-- =================== NHÓM 2: SEDAN (SEDAN HẠNG SANG - 10 XE) ===================
(5, 'Mercedes-Maybach S 680 4MATIC', 'Mercedes-Benz', 'sedan', 16990000000, 17500000000, '6.0L V12 BiTurbo Handcrafted', '612 mã lực / 900 Nm', '4.5 giây (0-100 km/h)', '9G-TRONIC 9 Cấp mượt mà', '250 km/h', 'Xăng không chì cao cấp', 'images/car-5.jpg', 'Chủ tịch Tinh hoa', 'Đỉnh cao xa xỉ thượng thừa dành cho giới thượng lưu. Hàng ghế thương gia First-Class tích hợp bắp chân sưởi ấm và dàn âm thanh Burmester 4D High-End.', TRUE),
(12, 'Rolls-Royce Ghost Extended', 'Rolls-Royce', 'sedan', 35000000000, 36500000000, '6.75L V12 Twin-Turbo Black Badge', '571 mã lực / 850 Nm', '4.5 giây (0-100 km/h)', 'ZF 8-Speed tự động cực êm', '250 km/h', 'Xăng không chì chuẩn Anh', 'images/car-12.jpg', 'Đỉnh Hào Môn', 'Trải nghiệm đẳng cấp vô song dành cho những ai vượt lên trên mọi thứ xa xỉ. Trần xe chứa 1.344 ngôi sao lấy cảm hứng từ bầu trời đêm Spire Mountain.', FALSE),
(15, 'Mercedes-Benz EQS 580 4MATIC', 'Mercedes-Benz', 'sedan', 6200000000, 6700000000, 'Dual Motor AMG Line EQ 400V', '523 mã lực / 855 Nm', '4.3 giây (0-100 km/h)', 'Hộp số tự động 1 cấp', '210 km/h', 'Pin 107.8 kWh (770 km/lần sạc WLTP)', 'images/car-15.jpg', 'Sedan Điện Sang', 'Sedan điện xa xỉ nhất từ trước đến nay của Mercedes-Benz. Màn hình Hyperscreen 56 inch trải dài toàn bảng táp lô và cabin cách âm vượt trội nhờ cửa kính 2 lớp.', FALSE),
(17, 'Maserati Quattroporte Trofeo', 'Maserati', 'sedan', 12800000000, 13500000000, '3.8L V8 Twin-Turbo Ferrari-sourced', '580 mã lực / 730 Nm', '3.5 giây (0-100 km/h)', 'ZF 8 cấp tự động thể thao', '326 km/h', 'Xăng cao cấp RON 95+', 'images/car-17.jpg', 'Siêu Sedan Ý', 'Sedan sang trọng mang dòng máu Ferrari chính hiệu. Tiếng gầm V8 vang lừng tại 7.000 vòng/phút, ghế da Pieno Fiore thủ công Poltrona Frau.', FALSE),
(21, 'BMW 760i xDrive M Sport', 'BMW', 'sedan', 6500000000, 6900000000, '4.4L V8 M TwinPower Turbo Mild-Hybrid', '544 mã lực / 750 Nm', '4.2 giây (0-100 km/h)', 'Steptronic Sport 8 cấp', '250 km/h', 'Xăng cao cấp RON 95', 'images/car-21.jpg', 'Màn Hình Rạp Phim', 'Sedan cỡ lớn đỉnh cao BMW với màn hình giải trí Theater Screen 31.3 inch độ phân giải 8K gập thả từ trần xe cùng hệ thống tự hành tân tiến.', TRUE),
(22, 'Audi A8L 55 TFSI Quattro Prestige', 'Audi', 'sedan', 5800000000, 6200000000, '3.0L V6 Turbocharged Mild Hybrid 48V', '340 mã lực / 500 Nm', '5.7 giây (0-100 km/h)', 'Tiptronic 8 cấp mượt mà', '250 km/h', 'Xăng không chì cao cấp', 'images/car-22.jpg', 'Khoang Hạng Nhất', 'Sedan trục cơ sở kéo dài sang trọng với hệ thống đèn pha LED ma trận kỹ thuật số Digital Matrix LED và ghế thương gia phía sau có chức năng massage chân.', FALSE),
(23, 'Lexus LS 500h Executive Hybrid', 'Lexus', 'sedan', 8300000000, 8750000000, '3.5L V6 Multi-Stage Hybrid cao cấp', '354 mã lực / 350 Nm', '5.4 giây (0-100 km/h)', 'Multi-Stage 10 cấp thông minh', '250 km/h', 'Xăng lai Điện Hybrid (6.7L/100km)', 'images/car-23.jpg', 'Nghệ Thuật Kiriko', 'Tuyệt phẩm thủ công bậc thầy Nhật Bản. Tấm ốp cửa bằng kính chạm khắc Kiriko thủ công kết hợp vải xếp Origami làm nổi bật sự thanh lịch yên bình.', FALSE),
(24, 'Mercedes-Benz S 450 4MATIC Luxury', 'Mercedes-Benz', 'sedan', 5550000000, 5800000000, '3.0L I6 Turbo Mild Hybrid EQ Boost', '367 mã lực / 500 Nm', '5.1 giây (0-100 km/h)', '9G-TRONIC 9 Cấp', '250 km/h', 'Xăng RON 95 cao cấp', 'images/car-24.jpg', 'Chuẩn Mực Doanh Nhân', 'Mẫu xe sang được doanh nhân Việt Nam yêu thích nhất. Hệ thống treo khí nén AIRMATIC thích ứng từng miligiây cùng túi khí bảo vệ hàng ghế sau độc quyền.', FALSE),
(25, 'Genesis G90 3.5T E-Supercharger AWD', 'Genesis', 'sedan', 4200000000, 4500000000, '3.5L V6 Twin-Turbo + E-Supercharger 48V', '409 mã lực / 549 Nm', '5.1 giây (0-100 km/h)', 'Tự động 8 cấp điện tử', '250 km/h', 'Xăng tiêu chuẩn RON 95', 'images/car-25.jpg', 'Đẳng Cấp Á Đông', 'Flagship sedan sang trọng xứ kim chi với cửa hít tự động đóng mở rảnh tay, hệ thống khử mùi lọc ion kép và dàn âm thanh Bang & Olufsen 23 loa.', FALSE),
(26, 'Volvo S90 Recharge Ultimate Plug-in', 'Volvo', 'sedan', 2750000000, 2900000000, '2.0L T8 Plug-in Hybrid AWD', '455 mã lực / 709 Nm', '4.8 giây (0-100 km/h)', 'Geartronic 8 cấp tự động', '180 km/h', 'Pin 18.8 kWh (90km thuần điện)', 'images/car-26.jpg', 'An Toàn Tuyệt Đối', 'Sedan an toàn nhất thế giới phong cách Bắc Âu Scandinavian. Cần số pha lê Orrefors chế tác thủ công cùng hệ thống lọc bụi mịn PM2.5 cao cấp.', FALSE),

-- =================== NHÓM 3: SUV (SUV / CROSSOVER - 10 XE) ===================
(8, 'Lexus LX 600 VIP (Bản 4 Chỗ Độc Bản)', 'Lexus', 'suv', 9990000000, 10500000000, '3.5L V6 Twin-Turbo Dual VVT-i', '409 mã lực / 650 Nm', '6.9 giây (0-100 km/h)', '10 Cấp Direct Shift', '210 km/h', 'Dung tích bình 110L', 'images/car-8.jpg', 'VIP Chuyên Cơ', 'Chuyên cơ mặt đất đến từ đất nước mặt trời mọc. Độ tin cậy bền bỉ vượt thời gian, cách âm đỉnh cao và khả năng off-road đa địa hình huyền thoại.', FALSE),
(11, 'Lamborghini Urus Performante', 'Lamborghini', 'suv', 16800000000, 17400000000, '4.0L V8 Twin-Turbocharged', '666 mã lực / 850 Nm', '3.3 giây (0-100 km/h)', 'ZF 8 cấp tự động thể thao', '306 km/h', 'Xăng tiêu chuẩn đường đua', 'images/car-11.jpg', 'SUV Siêu Xe', 'SUV nhanh nhất thế giới tại thời điểm ra mắt. Khung gầm carbon-fibre siêu nhẹ, hệ thống Lamborghini Dynamic Steering.', TRUE),
(18, 'Porsche Cayenne Turbo GT', 'Porsche', 'suv', 12200000000, 12900000000, '4.0L V8 Twin-Turbo nâng cấp', '640 mã lực / 850 Nm', '3.3 giây (0-100 km/h)', 'PDK 8 cấp tối ưu hóa đường đua', '300 km/h', 'Xăng tiêu chuẩn đường đua RON 98', 'images/car-18.jpg', 'SUV Đường Đua', 'SUV nhanh nhất của Porsche — thiết lập kỷ lục Nürburgring cho SUV sản xuất hàng loạt. Khung gầm hạ thấp 17mm.', TRUE),
(19, 'BMW X7 M60i xDrive', 'BMW', 'suv', 7800000000, 8200000000, '4.4L V8 M TwinPower Turbo', '530 mã lực / 750 Nm', '4.5 giây (0-100 km/h)', 'Steptronic Sport 8 cấp', '250 km/h', 'Dung tích bình 83L', 'images/car-19.jpg', 'SUV Flagship', 'Flagship SUV 7 chỗ hạng sang hàng đầu của BMW với mặt lưới tản nhiệt kép khổng lồ biểu tượng. Ghế hàng hai massage 10 điểm.', FALSE),
(27, 'Mercedes-AMG G 63 V8 Biturbo', 'Mercedes-Benz', 'suv', 11750000000, 12500000000, '4.0L V8 Biturbo Handcrafted AMG', '585 mã lực / 850 Nm', '4.5 giây (0-100 km/h)', 'AMG SPEEDSHIFT TCT 9G', '240 km/h', 'Dung tích bình 100L', 'images/car-27.jpg', 'Biểu Tượng Vua Địa Hình', 'Huyền thoại việt dã G-Class với 3 khóa vi sai cơ học toàn phần, ống xả kép AMG bên hông gầm gừ uy lực và độ giữ giá số 1 thị trường xe sang.', TRUE),
(28, 'Aston Martin DBX707 V8', 'Aston Martin', 'suv', 21800000000, 22900000000, '4.0L V8 Twin-Turbo Ball Bearing AMG', '707 mã lực / 900 Nm', '3.3 giây (0-100 km/h)', 'Ly hợp ướt 9 cấp thể thao', '310 km/h', 'Xăng thể thao RON 98', 'images/car-28.jpg', 'SUV Mạnh Nhất', 'Siêu SUV sang trọng sở hữu công suất khủng 707 mã lực. Phanh gốm carbon 420mm tiêu chuẩn và hệ thống treo khí nén 3 buồng chủ động kiểm soát nghiêng thân.', TRUE),
(29, 'Bentley Bentayga EWB Azure V8', 'Bentley', 'suv', 21000000000, 22200000000, '4.0L V8 Twin-Turbocharged 32V', '550 mã lực / 770 Nm', '4.6 giây (0-100 km/h)', 'ZF 8 cấp tự động', '290 km/h', 'Dung tích bình 85L', 'images/car-29.jpg', 'Ghế Hàng Không Airline', 'Bản trục cơ sở siêu dài EWB với ghế sau Bentley Airline Seat ngả 40 độ có cảm biến nhiệt cơ thể tự động điều chỉnh sưởi làm mát và massage áp lực hơi.', FALSE),
(30, 'Land Rover Defender 110 V8 Carpathian', 'Land Rover', 'suv', 10500000000, 11200000000, '5.0L V8 Supercharged siêu nạp', '525 mã lực / 625 Nm', '5.2 giây (0-100 km/h)', 'ZF 8 cấp tự động', '240 km/h', 'Dung tích bình 90L', 'images/car-30.jpg', 'V8 Siêu Nạp', 'Phiên bản Defender mạnh mẽ nhất phủ màng phim bảo vệ mờ Carpathian Grey satin độc quyền, lội nước sâu 900mm và vi sai cầu sau chủ động kiểm soát điện tử.', FALSE),
(31, 'Audi RS Q8 Performance Quattro', 'Audi', 'suv', 9800000000, 10400000000, '4.0L V8 Biturbo MHEV 48V', '600 mã lực / 800 Nm', '3.8 giây (0-100 km/h)', 'Tiptronic 8 cấp thể thao', '305 km/h', 'Xăng RON 98 tiêu chuẩn', 'images/car-31.jpg', 'Vua Nürburgring Audi', 'Mẫu Coupe-SUV mạnh mẽ nhất của Audi Sport chia sẻ khung gầm MLB Evo cùng Lamborghini Urus. Hệ thống đánh lái 4 bánh và vi sai thể thao Quattro.', FALSE),
(32, 'Cadillac Escalade-V Series 6.2L Supercharged', 'Cadillac', 'suv', 12000000000, 12800000000, '6.2L V8 Supercharged Handbuilt', '682 mã lực / 885 Nm', '4.4 giây (0-100 km/h)', '10 Cấp tự động điện tử', '200 km/h', 'Dung tích bình 91L', 'images/car-32.jpg', 'Khủng Long Mỹ', 'Chiếc SUV Full-size mạnh nhất lịch sử Cadillac. Dàn âm thanh vòm phòng thu AKG Studio Reference 36 loa cùng màn hình cong OLED cong 38 inch.', FALSE),

-- =================== NHÓM 4: ELECTRIC (XE ĐIỆN FLAGSHIP EV - 10 XE) ===================
(2, 'Porsche Taycan Turbo S Cross Turismo', 'Porsche', 'electric', 8500000000, 8900000000, 'Động cơ Điện kép Permanent Magnet', '761 mã lực (Launch Control)', '2.8 giây (0-100 km/h)', 'Hộp số 2 cấp độc quyền Porsche', '260 km/h', 'Pin 93.4 kWh (512 km/lần sạc)', 'images/car-2.jpg', 'Xe Điện Flagship', 'Đỉnh cao thuần điện phong cách thể thao Đức. Trải nghiệm cảm giác dính ghế tức thì cùng hệ thống treo khí nén chủ động 3 buồng PASM.', TRUE),
(4, 'Audi RS e-tron GT Quattro', 'Audi', 'electric', 7200000000, 7500000000, 'Hệ dẫn động 4 bánh toàn thời gian Quattro Điện', '637 mã lực / 830 Nm', '3.3 giây (0-100 km/h)', 'Tự động 2 cấp', '250 km/h', 'Phạm vi di chuyển 472 km', 'images/car-4.jpg', 'Ưu đãi 100% trước bạ', 'Ngôn ngữ thiết kế vị lai cuốn hút từng ánh nhìn. Công nghệ sạc nhanh 800V giúp nạp từ 5% lên 80% chỉ trong vòng 22.5 phút.', TRUE),
(6, 'VinFast VF 9 Plus (Bản 6 Chỗ Ghế Cơ Trưởng)', 'VinFast', 'electric', 2299000000, 2450000000, '2 Motor Điện Độc lập AWD', '402 mã lực / 620 Nm', '6.5 giây (0-100 km/h)', 'Chuyển động trực tiếp 1 cấp', '200 km/h', 'Pin CATL tiên tiến (602 km/lần sạc)', 'images/car-6.jpg', 'Tự Hào Việt Nam', 'SUV điện cỡ lớn phong cách studio Pininfarina Ý. Hệ thống trợ lái nâng cao ADAS cấp độ 2 cùng dịch vụ thông minh Smart Service đỉnh cao.', FALSE),
(14, 'BMW iX M60 xDrive', 'BMW', 'electric', 5490000000, 5900000000, 'Dual Motor AWD - Hệ dẫn động 4 bánh toàn thời gian', '619 mã lực / 1.100 Nm', '3.8 giây (0-100 km/h)', 'Truyền động tự động 1 cấp trực tiếp', '250 km/h', 'Pin 111.5 kWh (566 km/lần sạc WLTP)', 'images/car-14.jpg', 'Flagship Điện BMW', 'SUV điện đỉnh cao của BMW kết hợp sức mạnh M thuần chủng với bền vững tương lai. Sạc nhanh DC 200kW đầy pin từ 10% lên 80% chỉ trong 35 phút.', TRUE),
(38, 'Rolls-Royce Spectre Siêu Sang Điện', 'Rolls-Royce', 'electric', 17990000000, 19200000000, 'Dual Motor điện đồng bộ tách rời', '584 mã lực / 900 Nm', '4.5 giây (0-100 km/h)', 'Hộp số 1 cấp tỷ số truyền cố định', '250 km/h', 'Pin 102 kWh (530 km/lần sạc)', 'images/car-38.jpg', 'Siêu Coupe Thuần Điện', 'Chiếc xe thuần điện đầu tiên trong lịch sử 120 năm của Rolls-Royce. Cánh cửa Starlight Doors tích hợp 4.796 điểm phát quang lung linh huyền ảo.', TRUE),
(39, 'Lotus Eletre R Hyper-SUV', 'Lotus', 'electric', 8880000000, 9350000000, 'Dual Motor điện siêu nạp dẫn động 4 bánh', '905 mã lực / 985 Nm', '2.95 giây (0-100 km/h)', 'Hộp số 2 cấp trục sau', '265 km/h', 'Pin 112 kWh (490 km/lần sạc)', 'images/car-39.jpg', 'Hyper-SUV Điện', 'Hyper-SUV điện 2 cầu nhanh nhất thế giới. Cảm biến LiDAR ẩn hiện thông minh cùng công nghệ khí động học xẻ gió Porosity độc quyền Lotus.', FALSE),
(40, 'Tesla Model S Plaid Tri-Motor', 'Tesla', 'electric', 4500000000, 4850000000, 'Tri-Motor AWD điện 3 động cơ độc lập', '1020 mã lực / 1420 Nm', '1.99 giây (0-100 km/h)', 'Truyền động 1 cấp trực tiếp', '322 km/h', 'Pin 100 kWh (637 km/lần sạc)', 'images/car-40.jpg', 'Gia Tốc 1.99s', 'Xe thương mại bứt tốc nhanh nhất hành tinh từ 0 lên 100 km/h dưới 2 giây. Vô lăng Yoke phong cách phi thuyền không gian và hệ thống tự lái FSD.', TRUE),
(41, 'Lucid Air Sapphire Edition', 'Lucid', 'electric', 6200000000, 6600000000, '3 Motor điện siêu công suất Sapphire', '1234 mã lực / 1940 Nm', '1.89 giây (0-100 km/h)', '1 Cấp đơn mô-men xoắn xoay chiều', '330 km/h', 'Kiến trúc 900V+ (687 km/lần sạc)', 'images/car-41.jpg', '1.234 Mã Lực', 'Siêu sedan điện sang trọng của Mỹ sở hữu sức mạnh 1.234 mã lực. Tốc độ sạc nhanh nhất thế giới nạp 400km chỉ trong 15 phút sạc siêu tốc.', FALSE),
(42, 'Mercedes-AMG EQE 53 4MATIC+ Dynamic', 'Mercedes-Benz', 'electric', 4800000000, 5100000000, 'Dual Motor AMG Performance điện 400V', '687 mã lực / 1000 Nm', '3.5 giây (0-100 km/h)', 'Tự động 1 cấp AMG', '240 km/h', 'Pin 90.6 kWh (518 km/lần sạc)', 'images/car-42.jpg', 'AMG Performance EV', 'Sedan thể thao điện hiệu năng cao AMG với gói RACE START tăng lực tức thời, hệ thống âm thanh AMG SOUND EXPERIENCE truyền cảm xúc phấn khích.', FALSE),
(43, 'Porsche Macan EV Turbo AWD', 'Porsche', 'electric', 5900000000, 6250000000, 'Dual Motor PSM thế hệ mới nền tảng PPE', '639 mã lực (Launch Control)', '3.3 giây (0-100 km/h)', 'Hộp số 1 cấp tỷ số truyền tối ưu', '260 km/h', 'Pin 100 kWh sạc nhanh 270kW (591 km)', 'images/car-43.jpg', 'Nền Tảng PPE 800V', 'SUV điện thế hệ mới mang ADN thể thao thuần khiết Porsche. Đánh lái trục sau 5 độ và khóa vi sai điện tử cầu sau Porsche Torque Vectoring Plus.', FALSE),

-- =================== NHÓM 5: LUXURY (SIÊU SANG QUÝ TỘC - 10 XE) ===================
(9, 'Range Rover SV LWB P530', 'Land Rover', 'luxury', 14800000000, 15200000000, '4.4L V8 Twin-Turbocharged', '530 mã lực / 750 Nm', '4.6 giây (0-100 km/h)', 'Tự động 8 cấp ZF', '261 km/h', 'Dung tích bình 90L', 'images/car-9.jpg', 'Đỉnh cao SUV', 'Vua của thế giới SUV quý tộc Anh Quốc. Chiều dài cơ sở siêu lớn, nội thất ốp gốm men thủ công và tủ lạnh mini đựng rượu sâm panh.', FALSE),
(16, 'Bentley Flying Spur W12 S', 'Bentley', 'luxury', 24500000000, 25800000000, '6.0L W12 TSI Twin-Turbocharged', '635 mã lực / 900 Nm', '3.8 giây (0-100 km/h)', 'DCT 8 cấp ZF', '318 km/h', 'Dung tích bình 90L', 'images/car-16.jpg', 'Sport Luxury', 'Sedan siêu sang có thể phi như siêu xe. Tích hợp hệ thống treo khí nén Bentley Dynamic Ride chống nghiêng thân chủ động.', TRUE),
(20, 'Mercedes-AMG GLE 63 S 4MATIC+', 'Mercedes-Benz', 'luxury', 8900000000, 9400000000, '4.0L V8 Biturbo AMG', '612 mã lực / 850 Nm', '3.8 giây (0-100 km/h)', 'AMG SPEEDSHIFT TCT 9G', '280 km/h', 'Hệ thống Mild Hybrid EQ Boost 48V', 'images/car-20.jpg', 'SUV AMG', 'GLE 63 S là SUV AMG đỉnh nhất — thú vị như xe đua nhưng thực dụng như SUV gia đình cao cấp. Hệ thống treo E-ACTIVE BODY CONTROL.', FALSE),
(44, 'Rolls-Royce Phantom VIII Series II', 'Rolls-Royce', 'luxury', 48000000000, 51000000000, '6.75L V12 Twin-Turbocharged', '563 mã lực / 900 Nm', '5.3 giây (0-100 km/h)', 'ZF 8 cấp hỗ trợ vệ tinh SAT', '250 km/h', 'Xăng không chì thượng hạng', 'images/car-44.jpg', 'Đỉnh Cao Nhân Loại', 'Chiếc xe xa xỉ bậc nhất hành tinh. Không gian tĩnh lặng như phòng thu với 130kg vật liệu cách âm, thảm len cừu dày và phòng triển lãm The Gallery trên táp-lô.', TRUE),
(45, 'Rolls-Royce Cullinan Black Badge', 'Rolls-Royce', 'luxury', 38000000000, 40500000000, '6.75L V12 Twin-Turbo nâng cấp', '600 mã lực / 900 Nm', '4.9 giây (0-100 km/h)', 'ZF 8 cấp tự động', '250 km/h', 'Dung tích bình 100L', 'images/car-45.jpg', 'Kim Cương Đen', 'SUV siêu sang quyền lực nhất thế giới mang phong cách bóng đêm Black Badge. Ghế ngắm cảnh Viewing Suite mở điện phía đuôi xe thưởng thức hoàng hôn.', TRUE),
(46, 'Mercedes-Maybach GLS 600 4MATIC', 'Mercedes-Benz', 'luxury', 12500000000, 13200000000, '4.0L V8 Biturbo Mild-Hybrid EQ Boost', '558 mã lực / 730 Nm', '4.9 giây (0-100 km/h)', '9G-TRONIC 9 Cấp tự động', '250 km/h', 'Xăng RON 98', 'images/car-46.jpg', 'Chuyên Cơ Gầm Cao', 'SUV siêu sang mang phong cách du thuyền thượng lưu. Bệ bước chân tự động thò thụt mạ chrome phát sáng và chế độ nhún nhảy thoát lầy Free Driving Mode.', FALSE),
(47, 'Range Rover Autobiography LWB 4.4L', 'Land Rover', 'luxury', 13200000000, 13900000000, '4.4L V8 Twin-Turbocharged BMW M', '530 mã lực / 750 Nm', '4.6 giây (0-100 km/h)', 'ZF 8 cấp điện tử', '250 km/h', 'Xăng tiêu chuẩn RON 95', 'images/car-47.jpg', 'Hoàng Gia Anh Quốc', 'Biểu tượng quý tộc xứ sương mù. Ghế sau bọc da bán Aniline đục lỗ điều hòa 24 hướng, bàn làm việc mở điện và hệ thống khử tiếng ồn chủ động thế hệ 3.', FALSE),
(48, 'Bentley Mulsanne Speed Final Series', 'Bentley', 'luxury', 30000000000, 32000000000, '6.75L V8 Twin-Turbo huyền thoại L-Series', '537 mã lực / 1100 Nm', '4.9 giây (0-100 km/h)', 'ZF 8 cấp thể thao', '305 km/h', 'Dung tích bình 96L', 'images/car-48.jpg', 'Tuyệt Tác Thủ Công Crewe', 'Mẫu sedan siêu sang thủ công thuần chất Anh Quốc cuối cùng trang bị động cơ V8 6.75L huyền thoại. Mất hơn 400 giờ chế tác bằng tay tại Crewe.', FALSE),
(49, 'Lexus LM 500h 4 Chỗ Siêu VIP', 'Lexus', 'luxury', 8600000000, 9100000000, '2.4L Turbo Hybrid Dual-Boost AWD', '371 mã lực / 460 Nm', '6.9 giây (0-100 km/h)', 'Direct Shift 6 cấp Hybrid', '210 km/h', 'Xăng lai Điện Hybrid cao cấp', 'images/car-49.jpg', 'Khoang Thương Gia Di Động', 'MPV siêu sang khoang 4 chỗ tách biệt hoàn toàn bởi vách ngăn kính điện tử làm mờ, tích hợp màn hình chiếu 48 inch siêu rộng và tủ lạnh cá nhân.', FALSE),
(50, 'Hongqi L5 V12 Limousine Chủ Tịch', 'Hongqi', 'luxury', 15000000000, 16500000000, '6.0L V12 Hút khí tự nhiên nhôm nguyên khối', '408 mã lực / 550 Nm', '6.2 giây (0-100 km/h)', 'Tự động 6 cấp thủy lực', '220 km/h', 'Dung tích bình 105L', 'images/car-50.jpg', 'Quốc Bảo Hoàng Gia', 'Mẫu xe đại diện nguyên thủ quốc gia. Tay nắm cửa mạ vàng khảm ngọc bích Điêu Thuyền quý hiếm, nội thất ốp gỗ gụ truyền thống và huy hiệu cờ đỏ biểu tượng.', TRUE);

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
