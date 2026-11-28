/**
 * AutoLux AI Concierge - Trợ lý tư vấn xe sang AutoLux Motors
 * Dữ liệu xe và chính sách được chuẩn hóa 100% từ Database thực tế (KHÔNG BỊA RA)
 */
(function () {
    "use strict";

    // 1. DỮ LIỆU CHUẨN 49 MẪU XE (CHÍNH XÁC 100% TỪ HỆ THỐNG)
    const AUTOLUX_CARS = [
  {
    "id": 1,
    "name": "Mercedes-AMG GT 63 S E-Performance",
    "brand": "Mercedes-Benz",
    "category": "sport",
    "price": 12500000000,
    "originalPrice": 13200000000,
    "engine": "4.0L V8 Biturbo + Motor điện Hybrid",
    "power": "843 mã lực / 1.470 Nm",
    "acceleration": "2.9 giây (0-100 km/h)",
    "transmission": "AMG SPEEDSHIFT MCT 9G",
    "topSpeed": "316 km/h",
    "rangeOrFuel": "Xăng lai Điện (PHEV)",
    "imageUrl": "assets/images/car-1.jpg",
    "badge": "Siêu phẩm AMG",
    "description": "Chiếc 4 cửa mạnh mẽ nhất lịch sử AMG, kết hợp khối động cơ V8 Biturbo danh tiếng cùng công nghệ truyền động điện tử F1 độc quyền.",
    "isFeatured": true
  },
  {
    "id": 2,
    "name": "BMW M8 Competition Gran Coupe",
    "brand": "BMW",
    "category": "sport",
    "price": 10990000000,
    "originalPrice": 11500000000,
    "engine": "4.4L V8 M TwinPower Turbo",
    "power": "625 mã lực / 750 Nm",
    "acceleration": "3.2 giây (0-100 km/h)",
    "transmission": "8 Cấp M Steptronic với Drivelogic",
    "topSpeed": "305 km/h",
    "rangeOrFuel": "Dung tích bình xăng 68L",
    "imageUrl": "assets/images/car-2.jpg",
    "badge": "Bán chạy",
    "description": "Tuyệt tác Gran Coupe hòa quyện giữa vẻ đẹp khí động học đỉnh cao và sức mạnh trường đua của phân nhánh M Motorsport danh tiếng.",
    "isFeatured": true
  },
  {
    "id": 3,
    "name": "Porsche 911 GT3 RS (Thế hệ 992)",
    "brand": "Porsche",
    "category": "sport",
    "price": 19800000000,
    "originalPrice": 20500000000,
    "engine": "4.0L Hút khí tự nhiên 6 xi-lanh đối đỉnh",
    "power": "525 mã lực / 465 Nm",
    "acceleration": "3.2 giây (0-100 km/h)",
    "transmission": "PDK 7 Cấp siêu tốc",
    "topSpeed": "296 km/h",
    "rangeOrFuel": "Xăng tiêu chuẩn đường đua",
    "imageUrl": "assets/images/car-3.jpg",
    "badge": "Vua đường đua",
    "description": "Quái thú đường đua hợp pháp lăn bánh trên phố. Hệ thống cánh gió khí động học chủ động DRS lấy cảm hứng trực tiếp từ xe đua công thức 1.",
    "isFeatured": false
  },
  {
    "id": 4,
    "name": "Ferrari Roma Spider",
    "brand": "Ferrari",
    "category": "sport",
    "price": 18500000000,
    "originalPrice": 19200000000,
    "engine": "3.9L V8 Twin-Turbo F154",
    "power": "620 mã lực / 760 Nm",
    "acceleration": "3.4 giây (0-100 km/h)",
    "transmission": "Hộp số ly hợp kép DCT 8 cấp",
    "topSpeed": "318 km/h",
    "rangeOrFuel": "Xăng cao cấp RON 98",
    "imageUrl": "assets/images/car-4.jpg",
    "badge": "Siêu Phẩm Ý",
    "description": "Mui trần sang trọng mang phong cách La Mã cổ điển pha lẫn hiện đại. Hệ thống mái vải điện tử đóng mở trong 13.5 giây, trải nghiệm cabin đẳng cấp Ferrari.",
    "isFeatured": true
  },
  {
    "id": 5,
    "name": "Bentley Continental GT Speed",
    "brand": "Bentley",
    "category": "sport",
    "price": 22000000000,
    "originalPrice": 23000000000,
    "engine": "6.0L W12 TSI Twin-Turbocharged",
    "power": "659 mã lực / 900 Nm",
    "acceleration": "3.6 giây (0-100 km/h)",
    "transmission": "DCT 8 cấp ZF SportShift",
    "topSpeed": "335 km/h",
    "rangeOrFuel": "Dung tích bình 90L",
    "imageUrl": "assets/images/car-5.jpg",
    "badge": "Quý Tộc Anh Quốc",
    "description": "Đỉnh cao grand tourer xa xỉ bậc nhất hành tinh. Động cơ W12 huyền thoại kết hợp hệ thống đánh lái 4 bánh điện tử và vi sai chống trượt điện tử eLSD.",
    "isFeatured": false
  },
  {
    "id": 6,
    "name": "Ferrari 296 GTB Assetto Fiorano",
    "brand": "Ferrari",
    "category": "sport",
    "price": 23000000000,
    "originalPrice": 24200000000,
    "engine": "3.0L V6 Turbo 120 độ + Motor điện Plug-in",
    "power": "830 mã lực / 740 Nm",
    "acceleration": "2.9 giây (0-100 km/h)",
    "transmission": "8 Cấp F1 ly hợp kép DCT",
    "topSpeed": "330 km/h",
    "rangeOrFuel": "Xăng lai Điện PHEV (25 km thuần điện)",
    "imageUrl": "assets/images/car-6.jpg",
    "badge": "Bứt Tốc 2.9s",
    "description": "Kỷ nguyên siêu xe hybrid mới của Ngựa chồm Maranello. Gói khí động học Assetto Fiorano nâng cấp sợi carbon siêu nhẹ và giảm chấn Multimatic đường đua.",
    "isFeatured": true
  },
  {
    "id": 7,
    "name": "McLaren 750S Spider Performance",
    "brand": "McLaren",
    "category": "sport",
    "price": 22500000000,
    "originalPrice": 23500000000,
    "engine": "4.0L V8 Twin-Turbo M840T",
    "power": "750 mã lực / 800 Nm",
    "acceleration": "2.8 giây (0-100 km/h)",
    "transmission": "7 Cấp SSG ly hợp kép",
    "topSpeed": "332 km/h",
    "rangeOrFuel": "Xăng RON 98 tiêu chuẩn đua",
    "imageUrl": "assets/images/car-7.jpg",
    "badge": "Khung Carbon Monocage",
    "description": "Đỉnh cao chế tác siêu xe Woking nước Anh. Khung gầm carbon Monocage II-S siêu cứng, cánh gió chủ động điều khiển điện tử phanh khí động học Airbrake.",
    "isFeatured": false
  },
  {
    "id": 8,
    "name": "Lamborghini Huracan Tecnica",
    "brand": "Lamborghini",
    "category": "sport",
    "price": 19500000000,
    "originalPrice": 20800000000,
    "engine": "5.2L V10 Hút khí tự nhiên",
    "power": "640 mã lực / 565 Nm",
    "acceleration": "3.2 giây (0-100 km/h)",
    "transmission": "7 Cấp LDF ly hợp kép",
    "topSpeed": "325 km/h",
    "rangeOrFuel": "Dung tích bình 80L",
    "imageUrl": "assets/images/car-8.jpg",
    "badge": "Âm Thanh V10 Huyền Thoại",
    "description": "Bản giao hưởng động cơ V10 hút khí tự nhiên thuần khiết cuối cùng. Hệ thống đánh lái bánh sau LDVI phân tích dữ liệu lái thời gian thực theo thời gian thực.",
    "isFeatured": false
  },
  {
    "id": 9,
    "name": "Aston Martin DBS Superleggera",
    "brand": "Aston Martin",
    "category": "sport",
    "price": 25000000000,
    "originalPrice": 26500000000,
    "engine": "5.2L V12 Twin-Turbo BiTurbo",
    "power": "715 mã lực / 900 Nm",
    "acceleration": "3.4 giây (0-100 km/h)",
    "transmission": "ZF 8 Cấp tự động thể thao",
    "topSpeed": "340 km/h",
    "rangeOrFuel": "Xăng cao cấp RON 98",
    "imageUrl": "assets/images/car-9.jpg",
    "badge": "Chiến Mã Điệp Viên 007",
    "description": "Chiến binh Super GT uy lực nhất gia đình Aston Martin. Khung vỏ hợp kim nhôm siêu nhẹ Superleggera kết hợp bộ khuếch tán kép lấy cảm hứng từ xe đua F1.",
    "isFeatured": true
  },
  {
    "id": 10,
    "name": "Chevrolet Corvette Z06 3LZ",
    "brand": "Chevrolet",
    "category": "sport",
    "price": 7500000000,
    "originalPrice": 7900000000,
    "engine": "5.5L V8 LT6 Flat-Plane Crank Hút khí tự nhiên",
    "power": "670 mã lực / 624 Nm",
    "acceleration": "2.6 giây (0-100 km/h)",
    "transmission": "Tremec 8 Cấp ly hợp kép DCT",
    "topSpeed": "314 km/h",
    "rangeOrFuel": "Xăng RON 95/98",
    "imageUrl": "assets/images/car-10.jpg",
    "badge": "Siêu Xe Động Cơ Giữa",
    "description": "Siêu phẩm động cơ đặt giữa cơ bắp Mỹ với khối động cơ V8 Flat-Plane Crank mạnh mẽ nhất thế giới, vòng tua máy chạm ngưỡng 8.600 vòng/phút xé gió gầm rú.",
    "isFeatured": false
  },
  {
    "id": 11,
    "name": "Mercedes-Maybach S 680 4MATIC",
    "brand": "Mercedes-Benz",
    "category": "sedan",
    "price": 16990000000,
    "originalPrice": 17500000000,
    "engine": "6.0L V12 BiTurbo Handcrafted",
    "power": "612 mã lực / 900 Nm",
    "acceleration": "4.5 giây (0-100 km/h)",
    "transmission": "9G-TRONIC 9 Cấp mượt mà",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng không chì cao cấp",
    "imageUrl": "assets/images/car-11.jpg",
    "badge": "Chủ tịch Tinh hoa",
    "description": "Đỉnh cao xa xỉ thượng thừa dành cho giới thượng lưu. Hàng ghế thương gia First-Class tích hợp bắp chân sưởi ấm và dàn âm thanh Burmester 4D High-End.",
    "isFeatured": true
  },
  {
    "id": 12,
    "name": "Rolls-Royce Ghost Extended",
    "brand": "Rolls-Royce",
    "category": "sedan",
    "price": 35000000000,
    "originalPrice": 36500000000,
    "engine": "6.75L V12 Twin-Turbo Black Badge",
    "power": "571 mã lực / 850 Nm",
    "acceleration": "4.5 giây (0-100 km/h)",
    "transmission": "ZF 8-Speed tự động cực êm",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng không chì chuẩn Anh",
    "imageUrl": "assets/images/car-12.jpg",
    "badge": "Đỉnh Hào Môn",
    "description": "Trải nghiệm đẳng cấp vô song dành cho những ai vượt lên trên mọi thứ xa xỉ. Trần xe chứa 1.344 ngôi sao lấy cảm hứng từ bầu trời đêm Spire Mountain.",
    "isFeatured": false
  },
  {
    "id": 13,
    "name": "Mercedes-Benz EQS 580 4MATIC",
    "brand": "Mercedes-Benz",
    "category": "sedan",
    "price": 6200000000,
    "originalPrice": 6500000000,
    "engine": "Động cơ Điện Kép 4MATIC",
    "power": "516 mã lực / 855 Nm",
    "acceleration": "4.3 giây (0-100 km/h)",
    "transmission": "Tự động 1 cấp trực tiếp",
    "topSpeed": "210 km/h",
    "rangeOrFuel": "Pin 108.4 kWh (670 km/lần sạc)",
    "imageUrl": "assets/images/car-13.jpg",
    "badge": "Xe Điện Hạng Sang",
    "description": "Mẫu sedan điện flagship mở ra kỷ nguyên tương lai. Màn hình MBUX Hyperscreen liền khối 56 inch uốn cong trải dài cả khoang lái.",
    "isFeatured": false
  },
  {
    "id": 14,
    "name": "Maserati Quattroporte Trofeo",
    "brand": "Maserati",
    "category": "sedan",
    "price": 12800000000,
    "originalPrice": 13500000000,
    "engine": "3.8L V8 Twin-Turbo Ferrari",
    "power": "580 mã lực / 730 Nm",
    "acceleration": "4.5 giây (0-100 km/h)",
    "transmission": "ZF 8 cấp tự động",
    "topSpeed": "326 km/h",
    "rangeOrFuel": "Dung tích bình 80L",
    "imageUrl": "assets/images/car-14.jpg",
    "badge": "Siêu Sedan Ý",
    "description": "Sedan thể thao đỉnh cao của cây đinh ba nước Ý trang bị trái tim V8 do Ferrari chế tác thủ công. Âm thanh ống xả thể thao đầy cảm xúc mê hoặc.",
    "isFeatured": false
  },
  {
    "id": 15,
    "name": "BMW 760i xDrive M Sport (G70)",
    "brand": "BMW",
    "category": "sedan",
    "price": 6500000000,
    "originalPrice": 6890000000,
    "engine": "4.4L V8 TwinPower Turbo Mild-Hybrid 48V",
    "power": "544 mã lực / 750 Nm",
    "acceleration": "4.2 giây (0-100 km/h)",
    "transmission": "8 Cấp Steptronic Sport",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng Mild-Hybrid (Bình 74L)",
    "imageUrl": "assets/images/car-15.jpg",
    "badge": "Rạp Chiếu Phim 31.3 Inch",
    "description": "Đỉnh cao sedan công nghệ đầu bảng nhà BMW. Màn hình giải trí trần xe BMW Theater Screen 31.3 inch độ phân giải 8K, cửa tự động đóng mở thông minh điện tử.",
    "isFeatured": true
  },
  {
    "id": 16,
    "name": "Audi A8L 55 TFSI Quattro Prestige",
    "brand": "Audi",
    "category": "sedan",
    "price": 5800000000,
    "originalPrice": 6150000000,
    "engine": "3.0L V6 Turbocharged MHEV 48V",
    "power": "340 mã lực / 500 Nm",
    "acceleration": "5.7 giây (0-100 km/h)",
    "transmission": "Tiptronic 8 Cấp mượt mà",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng lai Điện Mild-Hybrid",
    "imageUrl": "assets/images/car-16.jpg",
    "badge": "Đèn Matrix OLED Kỹ Thuật Số",
    "description": "Kiến trúc sedan thương gia chuẩn mực nước Đức. Treo khí nén chủ động thích ứng Predictive Active Suspension dự đoán mặt đường nâng hạ thân xe trong tích tắc.",
    "isFeatured": false
  },
  {
    "id": 17,
    "name": "Lexus LS 500h Executive Hybrid",
    "brand": "Lexus",
    "category": "sedan",
    "price": 8300000000,
    "originalPrice": 8750000000,
    "engine": "3.5L V6 Động cơ kép Multi-Stage Hybrid",
    "power": "354 mã lực / 350 Nm",
    "acceleration": "5.4 giây (0-100 km/h)",
    "transmission": "Multi-Stage Hybrid 10 cấp ảo",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng lai Điện Hybrid (6.7L/100km)",
    "imageUrl": "assets/images/car-17.jpg",
    "badge": "Nghệ Thuật Kính Kiriko",
    "description": "Tuyệt tác thủ công Takumi đậm đà tinh thần Omotenashi Nhật Bản. Tấm ốp cửa bằng kính pha lê cắt vát Kiriko thủ công và da aniline hảo hạng.",
    "isFeatured": false
  },
  {
    "id": 18,
    "name": "Mercedes-Benz S 450 4MATIC Luxury",
    "brand": "Mercedes-Benz",
    "category": "sedan",
    "price": 5550000000,
    "originalPrice": 5850000000,
    "engine": "3.0L I6 Twin-Scroll Turbo EQ Boost",
    "power": "367 mã lực / 500 Nm",
    "acceleration": "5.1 giây (0-100 km/h)",
    "transmission": "9G-TRONIC 9 Cấp tự động",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng EQ Boost (Bình 65L)",
    "imageUrl": "assets/images/car-18.jpg",
    "badge": "Sedan Doanh Nhân Số 1",
    "description": "Biểu tượng sedan hạng sang đẳng cấp toàn cầu. Đánh lái trục sau lên đến 10 độ giúp chiếc xe dài hơn 5m quay đầu linh hoạt như xe hatchback cỡ nhỏ.",
    "isFeatured": false
  },
  {
    "id": 19,
    "name": "Genesis G90 3.5T E-Supercharger AWD",
    "brand": "Genesis",
    "category": "sedan",
    "price": 4200000000,
    "originalPrice": 4500000000,
    "engine": "3.5L V6 Twin-Turbo + E-Supercharger 48V",
    "power": "415 mã lực / 549 Nm",
    "acceleration": "5.1 giây (0-100 km/h)",
    "transmission": "Tự động 8 cấp",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng RON 95 (Bình 73L)",
    "imageUrl": "assets/images/car-19.jpg",
    "badge": "Sedan Thượng Lưu Hàn Quốc",
    "description": "Sedan hạng sang cao cấp nhất châu Á. Hệ thống treo khí nén đa buồng Chamber Air Suspension cùng cửa hít điện tử tự động đóng bằng nút bấm trên bệ tì tay.",
    "isFeatured": false
  },
  {
    "id": 20,
    "name": "Volvo S90 Recharge Ultimate Plug-in",
    "brand": "Volvo",
    "category": "sedan",
    "price": 2750000000,
    "originalPrice": 2900000000,
    "engine": "2.0L Turbo + Supercharger + Motor điện T8",
    "power": "455 mã lực / 709 Nm",
    "acceleration": "4.8 giây (0-100 km/h)",
    "transmission": "Geartronic 8 Cấp tự động",
    "topSpeed": "180 km/h (Giới hạn an toàn)",
    "rangeOrFuel": "Xăng lai Điện PHEV (90 km điện)",
    "imageUrl": "assets/images/car-20.jpg",
    "badge": "An Toàn Nhất Thế Giới",
    "description": "Sedan Bắc Âu lịch lãm với cần số pha lê Orrefors chế tác thủ công từ Thụy Điển, dàn âm thanh Bowers & Wilkins 19 loa tái hiện âm hưởng nhà hát Göteborg.",
    "isFeatured": false
  },
  {
    "id": 21,
    "name": "Lexus LX 600 VIP (Bản 4 Chỗ Độc Bản)",
    "brand": "Lexus",
    "category": "suv",
    "price": 9990000000,
    "originalPrice": 10500000000,
    "engine": "3.5L V6 Twin-Turbo Dual VVT-i",
    "power": "409 mã lực / 650 Nm",
    "acceleration": "6.9 giây (0-100 km/h)",
    "transmission": "10 Cấp Direct Shift",
    "topSpeed": "210 km/h",
    "rangeOrFuel": "Dung tích bình 110L",
    "imageUrl": "assets/images/car-21.jpg",
    "badge": "VIP Chuyên Cơ",
    "description": "Chuyên cơ mặt đất đến từ đất nước mặt trời mọc. Độ tin cậy bền bỉ vượt thời gian, cách âm đỉnh cao và khả năng off-road đa địa hình huyền thoại.",
    "isFeatured": false
  },
  {
    "id": 22,
    "name": "Lamborghini Urus Performante",
    "brand": "Lamborghini",
    "category": "suv",
    "price": 16800000000,
    "originalPrice": 17400000000,
    "engine": "4.0L V8 Twin-Turbocharged",
    "power": "666 mã lực / 850 Nm",
    "acceleration": "3.3 giây (0-100 km/h)",
    "transmission": "ZF 8 cấp tự động thể thao",
    "topSpeed": "306 km/h",
    "rangeOrFuel": "Xăng tiêu chuẩn đường đua",
    "imageUrl": "assets/images/car-22.jpg",
    "badge": "SUV Siêu Xe",
    "description": "SUV nhanh nhất thế giới tại thời điểm ra mắt. Khung gầm carbon-fibre siêu nhẹ, hệ thống Lamborghini Dynamic Steering và chế độ lái RALLY trượt bánh phấn khích.",
    "isFeatured": true
  },
  {
    "id": 23,
    "name": "Porsche Cayenne Turbo GT",
    "brand": "Porsche",
    "category": "suv",
    "price": 12200000000,
    "originalPrice": 12900000000,
    "engine": "4.0L V8 Biturbo",
    "power": "659 mã lực / 850 Nm",
    "acceleration": "3.3 giây (0-100 km/h)",
    "transmission": "Tiptronic S 8 cấp",
    "topSpeed": "305 km/h",
    "rangeOrFuel": "Dung tích bình 90L",
    "imageUrl": "assets/images/car-23.jpg",
    "badge": "SUV Đường Đua",
    "description": "Chiếc SUV giữ kỷ lục tốc độ hoàn thành vòng đua Nürburgring danh tiếng. Ống xả kép Titanium đặt giữa thân xe và trần xe bằng sợi carbon siêu nhẹ.",
    "isFeatured": false
  },
  {
    "id": 24,
    "name": "BMW X7 M60i xDrive",
    "brand": "BMW",
    "category": "suv",
    "price": 7800000000,
    "originalPrice": 8200000000,
    "engine": "4.4L V8 M TwinPower Turbo",
    "power": "530 mã lực / 750 Nm",
    "acceleration": "4.7 giây (0-100 km/h)",
    "transmission": "Sport Steptronic 8 cấp",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Dung tích bình 83L",
    "imageUrl": "assets/images/car-24.jpg",
    "badge": "SUV Flagship",
    "description": "SUV 7 chỗ cỡ lớn đầu bảng gia đình BMW X-Series. Cụm đèn pha pha lê Iconic Glow phát sáng rực rỡ và hệ thống treo khí nén 2 cầu thích ứng đỉnh cao.",
    "isFeatured": false
  },
  {
    "id": 25,
    "name": "Mercedes-AMG G 63 V8 Biturbo",
    "brand": "Mercedes-Benz",
    "category": "suv",
    "price": 11750000000,
    "originalPrice": 12400000000,
    "engine": "4.0L V8 Biturbo Handcrafted",
    "power": "585 mã lực / 850 Nm",
    "acceleration": "4.5 giây (0-100 km/h)",
    "transmission": "AMG SPEEDSHIFT TCT 9G",
    "topSpeed": "240 km/h",
    "rangeOrFuel": "Xăng cao cấp RON 98 (Bình 100L)",
    "imageUrl": "assets/images/car-25.jpg",
    "badge": "Ông Vua Địa Hình",
    "description": "Biểu tượng SUV địa hình bất tử của nước Đức. Ba khóa vi sai độc lập cơ học, ống xả kép hai bên hông xe tạo âm thanh gầm rú đặc trưng không thể nhầm lẫn.",
    "isFeatured": true
  },
  {
    "id": 26,
    "name": "Aston Martin DBX707 V8",
    "brand": "Aston Martin",
    "category": "suv",
    "price": 21800000000,
    "originalPrice": 22900000000,
    "engine": "4.0L V8 Twin-Turbo AMG tinh chỉnh",
    "power": "707 mã lực / 900 Nm",
    "acceleration": "3.3 giây (0-100 km/h)",
    "transmission": "9 Cấp ly hợp ướt Wet-Clutch",
    "topSpeed": "310 km/h",
    "rangeOrFuel": "Xăng cao cấp (Bình 85L)",
    "imageUrl": "assets/images/car-26.jpg",
    "badge": "SUV Mạnh Mẽ 707HP",
    "description": "Mãnh thú SUV xa xỉ đến từ xứ sở sương mù. Sức mạnh 707 mã lực biến chiếc SUV đồ sộ bứt tốc ngang ngửa những siêu xe đường đua thực thụ.",
    "isFeatured": false
  },
  {
    "id": 27,
    "name": "Bentley Bentayga EWB Azure V8",
    "brand": "Bentley",
    "category": "suv",
    "price": 21000000000,
    "originalPrice": 22200000000,
    "engine": "4.0L V8 Twin-Turbocharged",
    "power": "550 mã lực / 770 Nm",
    "acceleration": "4.6 giây (0-100 km/h)",
    "transmission": "ZF 8 Cấp tự động",
    "topSpeed": "290 km/h",
    "rangeOrFuel": "Xăng không chì cao cấp",
    "imageUrl": "assets/images/car-27.jpg",
    "badge": "Ghế Hàng Không Airline Seat",
    "description": "Phiên bản trục cơ sở kéo dài EWB mang đến khoang sau rộng rãi như chuyên cơ riêng. Ghế Bentley Airline Seat có 22 hướng chỉnh và cảm biến tự động sưởi thông minh.",
    "isFeatured": false
  },
  {
    "id": 28,
    "name": "Land Rover Defender 110 V8 Carpathian",
    "brand": "Land Rover",
    "category": "suv",
    "price": 10500000000,
    "originalPrice": 11200000000,
    "engine": "5.0L V8 Supercharged siêu nạp",
    "power": "525 mã lực / 625 Nm",
    "acceleration": "5.2 giây (0-100 km/h)",
    "transmission": "Tự động 8 cấp điện tử",
    "topSpeed": "240 km/h",
    "rangeOrFuel": "Dung tích bình 90L",
    "imageUrl": "assets/images/car-28.jpg",
    "badge": "Chiến Binh Off-Road V8",
    "description": "Chiến binh thám hiểm bất khuất mang khối động cơ Supercharged V8 5.0L siêu nạp gầm vang. Lớp sơn mờ satin Carpathian Grey phủ màng bảo vệ chống trầy xước.",
    "isFeatured": false
  },
  {
    "id": 29,
    "name": "Audi RS Q8 Performance Quattro",
    "brand": "Audi",
    "category": "suv",
    "price": 9800000000,
    "originalPrice": 10400000000,
    "engine": "4.0L V8 Twin-Turbo MHEV 48V",
    "power": "600 mã lực / 800 Nm",
    "acceleration": "3.8 giây (0-100 km/h)",
    "transmission": "8 Cấp Tiptronic thể thao",
    "topSpeed": "305 km/h",
    "rangeOrFuel": "Xăng lai Điện Mild-Hybrid",
    "imageUrl": "assets/images/car-29.jpg",
    "badge": "SUV Coupe Hiệu Năng Cao",
    "description": "SUV Coupe mang gen thể thao đường đua Audi Sport. Vi sai thể thao Quattro Sport Differential cùng hệ thống thanh cân bằng chủ động triệt tiêu hoàn toàn góc nghiêng thân xe.",
    "isFeatured": false
  },
  {
    "id": 30,
    "name": "Cadillac Escalade-V Series 6.2L Supercharged",
    "brand": "Cadillac",
    "category": "suv",
    "price": 12000000000,
    "originalPrice": 12800000000,
    "engine": "6.2L V8 Siêu nạp Handcrafted",
    "power": "682 mã lực / 885 Nm",
    "acceleration": "4.4 giây (0-100 km/h)",
    "transmission": "10 Cấp tự động điều khiển điện tử",
    "topSpeed": "200 km/h",
    "rangeOrFuel": "Xăng cao cấp (Bình 107L)",
    "imageUrl": "assets/images/car-30.jpg",
    "badge": "Khủng Long Mỹ 682HP",
    "description": "Chiếc SUV full-size uy quyền bậc nhất nước Mỹ mang logo V-Series danh giá. Màn hình cong OLED 38 inch siêu sắc nét và dàn âm thanh AKG Studio Reference 36 loa.",
    "isFeatured": true
  },
  {
    "id": 31,
    "name": "Porsche Taycan Turbo S Cross Turismo",
    "brand": "Porsche",
    "category": "electric",
    "price": 8500000000,
    "originalPrice": 8900000000,
    "engine": "Động cơ Điện kép Permanent Magnet",
    "power": "761 mã lực (Launch Control)",
    "acceleration": "2.8 giây (0-100 km/h)",
    "transmission": "Hộp số 2 cấp độc quyền Porsche",
    "topSpeed": "260 km/h",
    "rangeOrFuel": "Pin 93.4 kWh (512 km/lần sạc)",
    "imageUrl": "assets/images/car-31.jpg",
    "badge": "Xe Điện Flagship",
    "description": "Đỉnh cao thuần điện phong cách thể thao Đức. Trải nghiệm cảm giác dính ghế tức thì cùng hệ thống treo khí nén chủ động 3 buồng PASM.",
    "isFeatured": true
  },
  {
    "id": 32,
    "name": "Audi RS e-tron GT Quattro",
    "brand": "Audi",
    "category": "electric",
    "price": 7200000000,
    "originalPrice": 7500000000,
    "engine": "Hệ dẫn động 4 bánh toàn thời gian Quattro Điện",
    "power": "637 mã lực / 830 Nm",
    "acceleration": "3.3 giây (0-100 km/h)",
    "transmission": "Tự động 2 cấp",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Phạm vi di chuyển 472 km",
    "imageUrl": "assets/images/car-32.jpg",
    "badge": "Ưu đãi 100% trước bạ",
    "description": "Ngôn ngữ thiết kế vị lai cuốn hút từng ánh nhìn. Công nghệ sạc nhanh 800V giúp nạp từ 5% lên 80% chỉ trong vòng 22.5 phút.",
    "isFeatured": true
  },
  {
    "id": 33,
    "name": "VinFast VF 9 Plus (Bản 6 Chỗ Ghế Cơ Trưởng)",
    "brand": "VinFast",
    "category": "electric",
    "price": 2299000000,
    "originalPrice": 2450000000,
    "engine": "2 Motor Điện Độc lập AWD",
    "power": "402 mã lực / 620 Nm",
    "acceleration": "6.5 giây (0-100 km/h)",
    "transmission": "Chuyển động trực tiếp 1 cấp",
    "topSpeed": "200 km/h",
    "rangeOrFuel": "Pin CATL tiên tiến (602 km/lần sạc)",
    "imageUrl": "assets/images/car-33.jpg",
    "badge": "Tự Hào Việt Nam",
    "description": "SUV điện cỡ lớn phong cách studio Pininfarina Ý. Hệ thống trợ lái nâng cao ADAS cấp độ 2 cùng dịch vụ thông minh Smart Service đỉnh cao.",
    "isFeatured": false
  },
  {
    "id": 34,
    "name": "BMW iX M60 xDrive",
    "brand": "BMW",
    "category": "electric",
    "price": 5490000000,
    "originalPrice": 5890000000,
    "engine": "Dual Electric Motor BMW M",
    "power": "619 mã lực / 1.100 Nm",
    "acceleration": "3.8 giây (0-100 km/h)",
    "transmission": "Tự động 1 cấp",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Pin 111.5 kWh (566 km/lần sạc)",
    "imageUrl": "assets/images/car-34.jpg",
    "badge": "Flagship Điện BMW",
    "description": "SUV thuần điện mạnh nhất của gia đình BMW M. Khung xe bằng nhôm và nhựa gia cường sợi carbon Carbon Cage siêu nhẹ, dàn âm thanh Bowers & Wilkins 4D Diamond.",
    "isFeatured": false
  },
  {
    "id": 35,
    "name": "Rolls-Royce Spectre Siêu Sang Điện",
    "brand": "Rolls-Royce",
    "category": "electric",
    "price": 17990000000,
    "originalPrice": 18800000000,
    "engine": "Dual Motor điện tách rời 2 trục",
    "power": "584 mã lực / 900 Nm",
    "acceleration": "4.5 giây (0-100 km/h)",
    "transmission": "Tự động 1 cấp siêu êm ái",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Pin 102 kWh (530 km/lần sạc)",
    "imageUrl": "assets/images/car-35.jpg",
    "badge": "Rolls-Royce Thuần Điện Đầu Tiên",
    "description": "Kiệt tác coupe siêu sang thuần điện đầu tiên trong lịch sử Rolls-Royce. Cửa xe mở ngược Star Shower tích hợp 4.796 ngôi sao phát sáng lấp lánh như vũ trụ đêm.",
    "isFeatured": true
  },
  {
    "id": 36,
    "name": "Lotus Eletre R Hyper-SUV",
    "brand": "Lotus",
    "category": "electric",
    "price": 8880000000,
    "originalPrice": 9300000000,
    "engine": "Dual Motor điện kép công suất cực đại",
    "power": "905 mã lực / 985 Nm",
    "acceleration": "2.95 giây (0-100 km/h)",
    "transmission": "Hộp số 2 cấp trục sau",
    "topSpeed": "265 km/h",
    "rangeOrFuel": "Pin 112 kWh (490 km/lần sạc)",
    "imageUrl": "assets/images/car-36.jpg",
    "badge": "Hyper-SUV Điện 905HP",
    "description": "Hyper-SUV điện 2 cầu nhanh nhất thế giới. Cảm biến LiDAR ẩn hiện thông minh cùng công nghệ khí động học xẻ gió Porosity độc quyền Lotus.",
    "isFeatured": false
  },
  {
    "id": 37,
    "name": "Tesla Model S Plaid Tri-Motor",
    "brand": "Tesla",
    "category": "electric",
    "price": 4500000000,
    "originalPrice": 4850000000,
    "engine": "Tri-Motor AWD điện 3 động cơ độc lập",
    "power": "1020 mã lực / 1420 Nm",
    "acceleration": "1.99 giây (0-100 km/h)",
    "transmission": "Truyền động 1 cấp trực tiếp",
    "topSpeed": "322 km/h",
    "rangeOrFuel": "Pin 100 kWh (637 km/lần sạc)",
    "imageUrl": "assets/images/car-37.jpg",
    "badge": "Gia Tốc 1.99s",
    "description": "Xe thương mại bứt tốc nhanh nhất hành tinh từ 0 lên 100 km/h dưới 2 giây. Vô lăng Yoke phong cách phi thuyền không gian và hệ thống tự lái FSD.",
    "isFeatured": true
  },
  {
    "id": 38,
    "name": "Lucid Air Sapphire Edition",
    "brand": "Lucid",
    "category": "electric",
    "price": 6200000000,
    "originalPrice": 6600000000,
    "engine": "3 Motor điện siêu công suất Sapphire",
    "power": "1234 mã lực / 1940 Nm",
    "acceleration": "1.89 giây (0-100 km/h)",
    "transmission": "1 Cấp đơn mô-men xoắn xoay chiều",
    "topSpeed": "330 km/h",
    "rangeOrFuel": "Kiến trúc 900V+ (687 km/lần sạc)",
    "imageUrl": "assets/images/car-38.jpg",
    "badge": "1.234 Mã Lực",
    "description": "Siêu sedan điện sang trọng của Mỹ sở hữu sức mạnh 1.234 mã lực. Tốc độ sạc nhanh nhất thế giới nạp 400km chỉ trong 15 phút sạc siêu tốc.",
    "isFeatured": false
  },
  {
    "id": 39,
    "name": "Mercedes-AMG EQE 53 4MATIC+ Dynamic",
    "brand": "Mercedes-Benz",
    "category": "electric",
    "price": 4800000000,
    "originalPrice": 5100000000,
    "engine": "Dual Motor AMG Performance điện 400V",
    "power": "687 mã lực / 1000 Nm",
    "acceleration": "3.5 giây (0-100 km/h)",
    "transmission": "Tự động 1 cấp AMG",
    "topSpeed": "240 km/h",
    "rangeOrFuel": "Pin 90.6 kWh (518 km/lần sạc)",
    "imageUrl": "assets/images/car-39.jpg",
    "badge": "AMG Performance EV",
    "description": "Sedan thể thao điện hiệu năng cao AMG với gói RACE START tăng lực tức thời, hệ thống âm thanh AMG SOUND EXPERIENCE truyền cảm xúc phấn khích.",
    "isFeatured": false
  },
  {
    "id": 40,
    "name": "Porsche Macan EV Turbo AWD",
    "brand": "Porsche",
    "category": "electric",
    "price": 5900000000,
    "originalPrice": 6250000000,
    "engine": "Dual Motor PSM thế hệ mới nền tảng PPE",
    "power": "639 mã lực (Launch Control)",
    "acceleration": "3.3 giây (0-100 km/h)",
    "transmission": "Hộp số 1 cấp tỷ số truyền tối ưu",
    "topSpeed": "260 km/h",
    "rangeOrFuel": "Pin 100 kWh sạc nhanh 270kW (591 km)",
    "imageUrl": "assets/images/car-40.jpg",
    "badge": "Nền Tảng PPE 800V",
    "description": "SUV điện thế hệ mới mang ADN thể thao thuần khiết Porsche. Đánh lái trục sau 5 độ và khóa vi sai điện tử cầu sau Porsche Torque Vectoring Plus.",
    "isFeatured": false
  },
  {
    "id": 41,
    "name": "Range Rover SV LWB P530",
    "brand": "Land Rover",
    "category": "luxury",
    "price": 14800000000,
    "originalPrice": 15200000000,
    "engine": "4.4L V8 Twin-Turbocharged",
    "power": "530 mã lực / 750 Nm",
    "acceleration": "4.6 giây (0-100 km/h)",
    "transmission": "Tự động 8 cấp ZF",
    "topSpeed": "261 km/h",
    "rangeOrFuel": "Dung tích bình 90L",
    "imageUrl": "assets/images/car-41.jpg",
    "badge": "Đỉnh cao SUV",
    "description": "Vua của thế giới SUV quý tộc Anh Quốc. Chiều dài cơ sở siêu lớn, nội thất ốp gốm men thủ công và tủ lạnh mini đựng rượu sâm panh.",
    "isFeatured": false
  },
  {
    "id": 42,
    "name": "Mercedes-AMG GLE 63 S 4MATIC+",
    "brand": "Mercedes-Benz",
    "category": "luxury",
    "price": 8900000000,
    "originalPrice": 9300000000,
    "engine": "4.0L V8 Biturbo Mild-Hybrid",
    "power": "612 mã lực / 850 Nm",
    "acceleration": "3.8 giây (0-100 km/h)",
    "transmission": "AMG SPEEDSHIFT TCT 9G",
    "topSpeed": "280 km/h",
    "rangeOrFuel": "Dung tích bình 85L",
    "imageUrl": "assets/images/car-42.jpg",
    "badge": "SUV AMG",
    "description": "Sự kết hợp hoàn hảo giữa không gian xa hoa và sức mạnh của khối động cơ V8 Biturbo danh tiếng.",
    "isFeatured": false
  },
  {
    "id": 43,
    "name": "Rolls-Royce Phantom VIII Series II",
    "brand": "Rolls-Royce",
    "category": "luxury",
    "price": 48000000000,
    "originalPrice": 51000000000,
    "engine": "6.75L V12 Twin-Turbocharged",
    "power": "563 mã lực / 900 Nm",
    "acceleration": "5.3 giây (0-100 km/h)",
    "transmission": "ZF 8 cấp hỗ trợ vệ tinh SAT",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng không chì thượng hạng",
    "imageUrl": "assets/images/car-43.jpg",
    "badge": "Đỉnh Cao Nhân Loại",
    "description": "Chiếc xe xa xỉ bậc nhất hành tinh. Không gian tĩnh lặng như phòng thu với 130kg vật liệu cách âm, thảm len cừu dày và phòng triển lãm The Gallery trên táp-lô.",
    "isFeatured": true
  },
  {
    "id": 44,
    "name": "Rolls-Royce Cullinan Black Badge",
    "brand": "Rolls-Royce",
    "category": "luxury",
    "price": 38000000000,
    "originalPrice": 40500000000,
    "engine": "6.75L V12 Twin-Turbo nâng cấp",
    "power": "600 mã lực / 900 Nm",
    "acceleration": "4.9 giây (0-100 km/h)",
    "transmission": "ZF 8 cấp tự động",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Dung tích bình 100L",
    "imageUrl": "assets/images/car-44.jpg",
    "badge": "Kim Cương Đen",
    "description": "SUV siêu sang quyền lực nhất thế giới mang phong cách bóng đêm Black Badge. Ghế ngắm cảnh Viewing Suite mở điện phía đuôi xe thưởng thức hoàng hôn.",
    "isFeatured": true
  },
  {
    "id": 45,
    "name": "Mercedes-Maybach GLS 600 4MATIC",
    "brand": "Mercedes-Benz",
    "category": "luxury",
    "price": 12500000000,
    "originalPrice": 13200000000,
    "engine": "4.0L V8 Biturbo Mild-Hybrid EQ Boost",
    "power": "558 mã lực / 730 Nm",
    "acceleration": "4.9 giây (0-100 km/h)",
    "transmission": "9G-TRONIC 9 Cấp tự động",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng RON 98",
    "imageUrl": "assets/images/car-45.jpg",
    "badge": "Chuyên Cơ Gầm Cao",
    "description": "SUV siêu sang mang phong cách du thuyền thượng lưu. Bệ bước chân tự động thò thụt mạ chrome phát sáng và chế độ nhún nhảy thoát lầy Free Driving Mode.",
    "isFeatured": false
  },
  {
    "id": 46,
    "name": "Range Rover Autobiography LWB 4.4L",
    "brand": "Land Rover",
    "category": "luxury",
    "price": 13200000000,
    "originalPrice": 13900000000,
    "engine": "4.4L V8 Twin-Turbocharged BMW M",
    "power": "530 mã lực / 750 Nm",
    "acceleration": "4.6 giây (0-100 km/h)",
    "transmission": "ZF 8 cấp điện tử",
    "topSpeed": "250 km/h",
    "rangeOrFuel": "Xăng tiêu chuẩn RON 95",
    "imageUrl": "assets/images/car-46.jpg",
    "badge": "Hoàng Gia Anh Quốc",
    "description": "Biểu tượng quý tộc xứ sương mù. Ghế sau bọc da bán Aniline độc lập điều hòa 24 hướng, bàn làm việc mở điện và hệ thống khử tiếng ồn chủ động thế hệ 3.",
    "isFeatured": false
  },
  {
    "id": 47,
    "name": "Bentley Mulsanne Speed Final Series",
    "brand": "Bentley",
    "category": "luxury",
    "price": 30000000000,
    "originalPrice": 32000000000,
    "engine": "6.75L V8 Twin-Turbo huyền thoại L-Series",
    "power": "537 mã lực / 1100 Nm",
    "acceleration": "4.9 giây (0-100 km/h)",
    "transmission": "ZF 8 cấp thể thao",
    "topSpeed": "305 km/h",
    "rangeOrFuel": "Dung tích bình 96L",
    "imageUrl": "assets/images/car-47.jpg",
    "badge": "Tuyệt Tác Thủ Công Crewe",
    "description": "Mẫu sedan siêu sang thủ công thuần chất Anh Quốc cuối cùng trang bị động cơ V8 6.75L huyền thoại. Mất hơn 400 giờ chế tác bằng tay tại Crewe.",
    "isFeatured": false
  },
  {
    "id": 49,
    "name": "Hongqi L5 V12 Limousine Chủ Tịch",
    "brand": "Hongqi",
    "category": "luxury",
    "price": 15000000000,
    "originalPrice": 16500000000,
    "engine": "6.0L V12 Hút khí tự nhiên nhôm nguyên khối",
    "power": "408 mã lực / 550 Nm",
    "acceleration": "6.2 giây (0-100 km/h)",
    "transmission": "Tự động 6 cấp thủy lực",
    "topSpeed": "220 km/h",
    "rangeOrFuel": "Dung tích bình 105L",
    "imageUrl": "assets/images/car-49.jpg",
    "badge": "Quốc Bảo Hoàng Gia",
    "description": "Mẫu xe đại diện nguyên thủ quốc gia. Tay nắm cửa mạ vàng khảm ngọc bích Điêu Thuyền quý hiếm, nội thất ốp gỗ gõ truyền thống và huy hiệu cờ đỏ biểu tượng.",
    "isFeatured": true
  },
  {
    "id": 50,
    "name": "Bentley Flying Spur W12 Mulliner",
    "brand": "Bentley",
    "category": "luxury",
    "price": 24500000000,
    "originalPrice": 26000000000,
    "engine": "6.0L W12 TSI Twin-Turbocharged",
    "power": "635 mã lực / 900 Nm",
    "acceleration": "3.8 giây (0-100 km/h)",
    "transmission": "DCT 8 Cấp ly hợp kép",
    "topSpeed": "333 km/h",
    "rangeOrFuel": "Xăng cao cấp RON 98",
    "imageUrl": "assets/images/car-50.jpg",
    "badge": "Kiệt Tác Mulliner",
    "description": "Đỉnh cao sedan siêu sang nước Anh kết hợp hiệu năng siêu xe. Gỗ ốp 3D Diamond Knurling chạm khắc đa chiều và biểu tượng Flying B phát sáng thụt thò điện tử.",
    "isFeatured": true
  }
];

    // 2. THÔNG TIN SHOWROOM & CHÍNH SÁCH CHÍNH HÃNG TRÊN WEB
    const SHOWROOM_INFO = {
        brand: "AUTOLUX MOTORS",
        tagline: "Showroom Xe Sang & Siêu Xe Tiêu Chuẩn 5 Sao Hàng Đầu Việt Nam",
        hotline: "1900 888 999",
        email: "contact@autolux.vn",
        workingHours: "08:00 - 21:00 (Hàng ngày, kể cả Thứ 7 & Chủ Nhật)",
        branches: [
            { city: "Hà Nội", address: "Tòa tháp Keangnam Landmark 72, Phạm Hùng, Nam Từ Liêm, Hà Nội" },
            { city: "Đà Nẵng", address: "186 Nguyễn Văn Linh, Quận Hải Châu, TP. Đà Nẵng" },
            { city: "TP. Hồ Chí Minh", address: "Khu Đô Thị Sala, Đường Nguyễn Cơ Thạch, TP. Thủ Đức, TP. HCM" }
        ],
        policies: {
            warranty: "Bảo hành chính hãng 5 năm không giới hạn số km trên toàn quốc.",
            inspection: "Kiểm định nghiêm ngặt 160 hạng mục tiêu chuẩn quốc tế trước khi bàn giao.",
            loan: "Hỗ trợ gói vay trả góp tới 85% giá trị xe, thời hạn lên đến 8 năm (96 tháng), duyệt hồ sơ giải ngân nhanh trong 2 giờ với đối tác ngân hàng VIP.",
            delivery: "Giao xe tận nhà bảo mật toàn quốc bằng xe lồng chuyên dụng 24/7.",
            testDrive: "Đăng ký lái thử miễn phí tại 3 chi nhánh Showroom hoặc yêu cầu chuyên viên đưa xe trải nghiệm trực tiếp tại nhà/cơ quan."
        },
        categories: [
            { slug: "sedan", name: "Sedan Hạng Sang", desc: "10 mẫu xe sang trọng bậc nhất dành cho doanh nhân và yếu nhân." },
            { slug: "suv", name: "SUV / Crossover", desc: "10 mẫu gầm cao quyền lực, off-road đỉnh cao và đa dụng." },
            { slug: "sport", name: "Siêu Xe Thể Thao", desc: "10 cỗ máy tốc độ với mã lực khủng và gia tốc xé gió." },
            { slug: "electric", name: "Xe Điện Flagship EV", desc: "10 mẫu xe thuần điện siêu êm, công nghệ tương lai và nạp pin siêu tốc." },
            { slug: "luxury", name: "Siêu Sang Quý Tộc", desc: "9 tuyệt tác độc bản đỉnh cao của thế giới thượng lưu." }
        ]
    };

    // Helper format VND
    function formatVND(amount) {
        if (!amount || isNaN(amount)) return "0 đ";
        return new Intl.NumberFormat('vi-VN').format(amount) + " đ";
    }

    // Trả về contextPath phù hợp (Deploy, NetBeans hoặc Spring Boot)
    function resolveImgPath(url) {
        if (!url) return "./assets/images/car-1.jpg";
        if (url.startsWith("http://") || url.startsWith("https://")) return url;
        
        // Clean relative prefix
        let clean = url.replace(/^[./]+/, "");
        if (clean.startsWith("images/")) clean = "assets/" + clean;

        // Nếu đang ở client/ (GitHub Pages deploy)
        if (window.location.pathname.includes("/client/")) {
            return "../" + clean;
        }
        // Nếu trang đang ở gốc
        return "./" + clean;
    }

    // 3. BỘ NÃO TRÍ TUỆ NHẬN DIỆN VÀ TRẢ LỜI (ZERO HALLUCINATION ENGINE)
    function getBotResponse(userMsg) {
        const raw = userMsg.trim();
        const lower = raw.toLowerCase();

        // 1. Chặn các câu hỏi ngoài phạm vi ô tô / showroom
        const outOfScopePatterns = [
            "thời tiết", "mưa không", "nắng không", "nấu ăn", "món gì", "hôm nay ăn gì",
            "chơi game", "bài hát", "ca sĩ", "toán học", "giải toán", "lập trình", "code",
            "tình yêu", "người yêu", "tâm sự", "lô đề", "xổ số", "bitcoin", "crypto"
        ];
        for (let p of outOfScopePatterns) {
            if (lower.includes(p)) {
                return {
                    text: `Dạ em là <strong>AutoLux AI Concierge</strong> - Trợ lý tư vấn chuyên trách của Showroom <strong>AutoLux Motors</strong>.<br><br>Em chỉ có thẩm quyền giải đáp các thông tin chính thức về <strong>49 mẫu xe sang, bảng giá niêm yết, chính sách trả góp 85%, đặt lịch lái thử</strong> và hệ thống 3 Showroom của AutoLux.<br><br>Quý khách vui lòng cho em biết quý khách đang quan tâm đến dòng xe hoặc chính sách nào của Showroom để em được phục vụ chu đáo nhất ạ!`
                };
            }
        }

        // 2. Chặn các dòng xe phổ thông không có trong showroom
        const excludedBrands = ["kia morning", "morning", "vios", "toyota vios", "i10", "hyundai i10", "accent", "fadil", "wigo", "innova"];
        for (let eb of excludedBrands) {
            if (lower.includes(eb)) {
                return {
                    text: `Dạ báo cáo quý khách, <strong>AutoLux Motors</strong> là hệ thống Showroom chuyên biệt phân phối độc quyền các phân khúc <strong>Xe Sang, Siêu Xe Thể Thao, Xe Siêu Sang Quý Tộc và Xe Điện Flagship</strong> (như Mercedes-Maybach, Porsche, Ferrari, Rolls-Royce, Bentley, VinFast, BMW, Audi, Lexus...).<br><br>Dòng xe <em>"${raw}"</em> hiện <strong>không thuộc danh mục phân phối</strong> của Showroom ạ.<br><br>Quý khách có muốn tham khảo các mẫu xe sang có sẵn tại Showroom không ạ? (Ví dụ: Sedan sang, SUV gầm cao, hoặc Siêu xe)?`
                };
            }
        }

        // 3. Câu hỏi về Địa chỉ, Chi nhánh Showroom
        if (lower.includes("địa chỉ") || lower.includes("chi nhánh") || lower.includes("showroom ở đâu") || lower.includes("ở đâu") || lower.includes("vị trí") || lower.includes("showroom")) {
            let branchList = SHOWROOM_INFO.branches.map((b, i) => `<strong>${i+1}. Chi nhánh ${b.city}:</strong> ${b.address}`).join("<br>");
            return {
                text: `Hệ thống <strong>${SHOWROOM_INFO.brand}</strong> hiện có 3 Showroom tiêu chuẩn 5 sao trên toàn quốc:<br><br>${branchList}<br><br>⏰ <strong>Giờ mở cửa:</strong> ${SHOWROOM_INFO.workingHours}<br>📞 <strong>Hotline 24/7:</strong> <a href="tel:1900888999" class="text-warning fw-bold">1900 888 999</a><br><br>Kính mời quý khách ghé thăm hoặc đặt lịch để chuyên viên đón tiếp chu đáo nhất!`
            };
        }

        // 4. Câu hỏi về Hotline, Liên hệ
        if (lower.includes("hotline") || lower.includes("số điện thoại") || lower.includes("sđt") || lower.includes("liên hệ") || lower.includes("tổng đài")) {
            return {
                text: `Dạ, Tổng đài chăm sóc khách hàng VIP của <strong>AutoLux Motors</strong> luôn sẵn sàng hỗ trợ 24/7:<br><br>📞 <strong>Hotline:</strong> <a href="tel:1900888999" class="text-warning fw-bold fs-6">1900 888 999</a><br>✉️ <strong>Email:</strong> contact@autolux.vn<br><br>Hoặc quý khách có thể để lại số điện thoại tại mục <strong><a href="#contact" class="text-warning">Liên Hệ</a></strong> cuối trang để chuyên viên gọi lại ngay trong 5 phút ạ.`
            };
        }

        // 5. Câu hỏi về Chính sách Trả góp / Vay ngân hàng
        if (lower.includes("trả góp") || lower.includes("vay") || lower.includes("ngân hàng") || lower.includes("lãi suất") || lower.includes("hạn mức")) {
            return {
                text: `Dạ về chính sách tài chính & trả góp, <strong>AutoLux Motors</strong> liên kết trực tiếp với các khối Ngân hàng Quốc tế & Quân Đội với các đặc quyền vượt trội:<br><br>
                💰 <strong>Hạn mức vay:</strong> Hỗ trợ đến <strong>85% giá trị xe</strong>.<br>
                ⏳ <strong>Thời hạn vay:</strong> Linh hoạt từ 12 tháng đến <strong>8 năm (96 tháng)</strong>.<br>
                ⚡ <strong>Tốc độ thẩm định:</strong> Duyệt hồ sơ nhanh chóng chỉ trong <strong>2 giờ</strong>.<br>
                📄 <strong>Thủ tục:</strong> Không cần chứng minh thu nhập phức tạp, hỗ trợ đứng tên Doanh nghiệp hoặc Cá nhân.<br><br>
                Quý khách có thể trải nghiệm công cụ <strong><a href="#calculator" class="text-warning fw-bold">Dự Toán Trả Góp</a></strong> trực tiếp trên web để xem chính xác số tiền cần trả trước và tiền góp hàng tháng ạ!`
            };
        }

        // 6. Câu hỏi về Lái thử xe / Test drive
        if (lower.includes("lái thử") || lower.includes("test drive") || lower.includes("thử xe") || lower.includes("trải nghiệm")) {
            return {
                text: `Dạ AutoLux Motors có chương trình <strong>Đặc quyền Lái thử 5 sao</strong> hoàn toàn miễn phí:<br><br>
                🏎️ <strong>Lựa chọn địa điểm:</strong><br>
                - Trải nghiệm bứt tốc và cung đường thử chuyên biệt tại 3 Showroom (Hà Nội, Đà Nẵng, TP.HCM).<br>
                - Hoặc dịch vụ <strong>Mang xe tận nhà/công ty</strong> của quý khách bằng xe lồng chuyên dụng.<br><br>
                Quý khách chỉ cần chọn mẫu xe và để lại thông tin tại mục <strong><a href="#booking" class="text-warning fw-bold">Đăng Ký Lái Thử</a></strong> ở ngay bên dưới, chuyên viên tư vấn sẽ liên hệ chốt lịch hẹn trong vòng 15 phút ạ!`
            };
        }

        // 7. Câu hỏi về Bảo hành, Kiểm định, Giao xe
        if (lower.includes("bảo hành") || lower.includes("kiểm định") || lower.includes("giao xe") || lower.includes("cam kết")) {
            return {
                text: `Dạ, mọi mẫu xe xuất xưởng từ Showroom <strong>AutoLux</strong> đều đi kèm 4 cam kết vàng vững chắc:<br><br>
                🛡️ <strong>Kiểm định 160 điểm:</strong> Kiểm tra toàn diện động cơ, khung gầm, điện tử chuẩn quốc tế.<br>
                🏆 <strong>Bảo hành 5 năm:</strong> Chính hãng không giới hạn km trên toàn quốc.<br>
                🚛 <strong>Giao xe toàn quốc:</strong> Bàn giao tận nơi bằng xe chuyên dụng kín đáo, bảo mật danh tính.<br>
                💳 <strong>Hỗ trợ vay 85%:</strong> Giải ngân nhanh trong ngày.<br><br>
                Quý khách hoàn toàn an tâm khi sở hữu xe tại AutoLux ạ!`
            };
        }

        // 8. Câu hỏi xe đắt nhất / xe rẻ nhất
        if (lower.includes("đắt nhất") || lower.includes("cao nhất") || lower.includes("vip nhất")) {
            let mostExpensive = [...AUTOLUX_CARS].sort((a,b) => b.price - a.price)[0];
            return {
                text: `Tuyệt phẩm có giá trị cao nhất tại Showroom AutoLux hiện nay là <strong>${mostExpensive.name}</strong> với mức giá niêm yết chính hãng là <strong>${formatVND(mostExpensive.price)}</strong>.<br><br>Mẫu xe mang huy hiệu <em>"${mostExpensive.badge}"</em> - được mệnh danh là đỉnh cao xa xỉ bậc nhất nhân loại với không gian tĩnh lặng như phòng hòa nhạc.`,
                car: mostExpensive
            };
        }

        if (lower.includes("rẻ nhất") || lower.includes("thấp nhất") || lower.includes("tiết kiệm nhất")) {
            let cheapest = [...AUTOLUX_CARS].sort((a,b) => a.price - b.price)[0];
            return {
                text: `Mẫu xe có mức giá khởi điểm dễ tiếp cận nhất tại Showroom là <strong>${cheapest.name}</strong> với giá niêm yết <strong>${formatVND(cheapest.price)}</strong>.<br><br>Xe thuộc phân khúc ${cheapest.category.toUpperCase()}, động cơ ${cheapest.engine}, rất phù hợp cho doanh nhân trẻ thành đạt.`,
                car: cheapest
            };
        }

        // 9. Câu hỏi về bứt tốc / xe nhanh nhất (dưới 3 giây)
        if (lower.includes("dưới 3 giây") || lower.includes("nhanh nhất") || lower.includes("tăng tốc") || lower.includes("0-100") || lower.includes("bứt tốc")) {
            let fastCars = AUTOLUX_CARS.filter(c => {
                let match = c.acceleration.match(/([0-9.]+)\s*giây/i) || c.acceleration.match(/([0-9.]+)s/i);
                return match && parseFloat(match[1]) <= 3.0;
            }).slice(0, 3);

            let carText = fastCars.map(c => `• <strong>${c.name}</strong>: 0-100 km/h chỉ <strong>${c.acceleration}</strong> (${formatVND(c.price)})`).join("<br>");
            return {
                text: `Showroom AutoLux tự hào sở hữu những quái thú tốc độ hàng đầu thế giới có khả năng bứt tốc từ 0 lên 100 km/h trong chưa đầy 3 giây:<br><br>${carText}<br><br>Dưới đây là một trong những chiến mã thể thao tiêu biểu nhất:`,
                car: fastCars[0]
            };
        }

        // 10. Câu hỏi theo phân khúc (Điện, SUV, Siêu xe, Sedan, Siêu sang)
        if (lower.includes("xe điện") || lower.includes("ev") || lower.includes("pin") || lower.includes("điện")) {
            let evCars = AUTOLUX_CARS.filter(c => c.category === "electric");
            let randomEv = evCars[Math.floor(Math.random() * evCars.length)];
            return {
                text: `Showroom AutoLux có trọn bộ sưu tập <strong>10 mẫu Flagship EV</strong> thuần điện siêu cấp (Taycan Turbo S, Lotus Eletre R, VinFast VF 9, Tesla Model S Plaid, BMW i7...).<br><br>Tất cả xe điện đều được trang bị công nghệ sạc nhanh DC và bảo hành pin độc quyền. Xin giới thiệu đến quý khách mẫu xe điện tiêu biểu:`,
                car: randomEv
            };
        }

        if (lower.includes("suv") || lower.includes("gầm cao") || lower.includes("địa hình") || lower.includes("offroad")) {
            let g63 = AUTOLUX_CARS.find(c => c.id === 25) || AUTOLUX_CARS.find(c => c.category === "suv");
            return {
                text: `Dạ, phân khúc <strong>SUV Siêu Sang & Địa Hình</strong> tại AutoLux quy tụ 10 dòng xe gầm cao quyền lực nhất (như G63 AMG, Lexus LX600, DBX707, Urus Performante, Escalade-V...).<br><br>Nổi bật nhất là <strong>Mercedes-AMG G 63 V8 Biturbo ("Ông Vua Địa Hình")</strong>:`,
                car: g63
            };
        }

        if (lower.includes("siêu xe") || lower.includes("thể thao") || lower.includes("sport")) {
            let sportCar = AUTOLUX_CARS.find(c => c.id === 3) || AUTOLUX_CARS.find(c => c.category === "sport"); // Porsche 911 GT3 RS
            return {
                text: `Showroom hiện có <strong>10 mẫu Siêu Xe Thể Thao</strong> hợp pháp lăn bánh trên phố (Porsche 911 GT3 RS, Ferrari Roma Spider, 296 GTB, McLaren 750S, Lamborghini Huracan Tecnica...).<br><br>Xin trân trọng giới thiệu đến quý khách siêu phẩm đường đua:`,
                car: sportCar
            };
        }

        if (lower.includes("siêu sang") || lower.includes("chủ tịch") || lower.includes("quý tộc") || lower.includes("maybach") || lower.includes("rolls-royce") || lower.includes("phantom")) {
            let luxCar = AUTOLUX_CARS.find(c => c.id === 11) || AUTOLUX_CARS.find(c => c.category === "luxury"); // Maybach S680
            return {
                text: `Dành riêng cho giới tinh hoa và các chủ tịch tập đoàn, AutoLux cung cấp các tuyệt tác siêu sang như Mercedes-Maybach S680, Rolls-Royce Phantom VIII, Cullinan Black Badge, Bentley Mulsanne...<br><br>Xin giới thiệu mẫu xe doanh nhân đỉnh cao:`,
                car: luxCar
            };
        }

        // 11. Tìm kiếm xe cụ thể theo tên hoặc từ khóa (G63, GT3, Roma, Taycan, Cullinan, VF9, Huracan...)
        let matchedCar = null;
        for (let car of AUTOLUX_CARS) {
            let cName = car.name.toLowerCase();
            let cBrand = car.brand.toLowerCase();
            let searchTokens = lower.split(/\s+/);
            
            // Check specific strong keywords
            if (lower.includes("g63") && (cName.includes("g 63") || cName.includes("g63"))) { matchedCar = car; break; }
            if (lower.includes("gt3") && cName.includes("gt3")) { matchedCar = car; break; }
            if (lower.includes("roma") && cName.includes("roma")) { matchedCar = car; break; }
            if (lower.includes("taycan") && cName.includes("taycan")) { matchedCar = car; break; }
            if (lower.includes("cullinan") && cName.includes("cullinan")) { matchedCar = car; break; }
            if (lower.includes("vf9") || lower.includes("vf 9")) { if (cName.includes("vf 9") || cName.includes("vf9")) { matchedCar = car; break; } }
            if (lower.includes("m8") && cName.includes("m8")) { matchedCar = car; break; }
            if (lower.includes("huracan") && cName.includes("huracan")) { matchedCar = car; break; }
            if (lower.includes("urus") && cName.includes("urus")) { matchedCar = car; break; }
            if (lower.includes("lx600") || lower.includes("lx 600")) { if (cName.includes("lx 600")) { matchedCar = car; break; } }

            // Match full brand or sub-brand
            if (lower.includes(cBrand) && cName.includes(searchTokens[searchTokens.length - 1])) {
                matchedCar = car;
                break;
            }
        }

        if (matchedCar) {
            return {
                text: `Dạ, Showroom AutoLux hiện đang có sẵn mẫu <strong>${matchedCar.name}</strong> chính hãng, sẵn sàng bàn giao ngay trong ngày.<br><br>
                💵 <strong>Giá niêm yết:</strong> <span class="text-warning fw-bold">${formatVND(matchedCar.price)}</span><br>
                ⚙️ <strong>Động cơ:</strong> ${matchedCar.engine}<br>
                🐎 <strong>Công suất:</strong> ${matchedCar.power}<br>
                ⏱️ <strong>Tăng tốc 0-100 km/h:</strong> ${matchedCar.acceleration}<br>
                ✨ <strong>Đặc quyền:</strong> ${matchedCar.badge ? matchedCar.badge + ' - ' : ''}${matchedCar.description}`,
                car: matchedCar
            };
        }

        // 12. Câu hỏi chung về showroom, xin chào
        if (lower.includes("xin chào") || lower.includes("hello") || lower.includes("hi") || lower.includes("chào") || lower.includes("tư vấn") || lower.includes("có những xe gì") || lower.includes("tổng quan")) {
            return {
                text: `Kính chào quý khách! Em là <strong>AutoLux AI Concierge</strong> - Trợ lý ảo tư vấn xe cao cấp tại Showroom <strong>AutoLux Motors</strong>.<br><br>
                Hiện Showroom chúng em đang trưng bày đúng <strong>49 mẫu xe sang, siêu xe và xe điện thông minh độc bản</strong> thuộc 5 phân khúc:<br>
                1. <strong>Sedan Hạng Sang</strong> (Maybach S680, Rolls-Royce Ghost...)<br>
                2. <strong>SUV / Crossover</strong> (G63 AMG, LX600, Urus...)<br>
                3. <strong>Siêu Xe Thể Thao</strong> (Porsche 911 GT3 RS, Ferrari Roma...)<br>
                4. <strong>Xe Điện Flagship EV</strong> (Taycan Turbo S, Lotus Eletre R, VF9...)<br>
                5. <strong>Siêu Sang Quý Tộc</strong> (Rolls-Royce Phantom VIII, Cullinan Black Badge...)<br><br>
                Quý khách đang tìm kiếm mẫu xe trong tầm giá hoặc phong cách nào ạ? Em xin phép gợi ý ngay!`
            };
        }

        // Mặc định: Trả lời có trách nhiệm, cung cấp các câu hỏi gợi ý
        return {
            text: `Dạ em đã nhận được câu hỏi của quý khách: <em>"${raw}"</em>.<br><br>Để đảm bảo độ chính xác tuyệt đối từ dữ liệu Showroom, quý khách có thể chọn nhanh các nội dung tư vấn chính hãng bên dưới, hoặc hỏi em về <strong>tên xe (G63, Taycan, GT3 RS, Maybach...), tầm giá, chính sách vay trả góp 85% hoặc đăng ký lái thử</strong> nhé ạ!`
        };
    }

    // 4. KHỞI TẠO VÀ RENDER GIAO DIỆN CHATBOT VÀO TRANG WEB
    function initChatbotUI() {
        // Kiểm tra nếu đã có widget thì không render lại
        if (document.getElementById("autoluxChatWidget")) return;

        const widgetContainer = document.createElement("div");
        widgetContainer.id = "autoluxChatWidget";
        widgetContainer.innerHTML = `
            <!-- Nút bấm nổi mở chat -->
            <button id="autoluxChatTrigger" class="autolux-chat-trigger" title="Trò chuyện cùng Trợ lý Showroom">
                <i class="fa-solid fa-headset fa-xl" id="chatTriggerIcon"></i>
                <span class="chat-badge-pulse"></span>
            </button>

            <!-- Tooltip gợi ý ban đầu -->
            <div id="autoluxChatTooltip" class="autolux-chat-tooltip">
                <i class="fa-solid fa-sparkles text-warning"></i>
                <span>Trợ lý AutoLux đang trực tuyến. Hỏi đáp ngay!</span>
            </div>

            <!-- Cửa sổ Chat chính -->
            <div id="autoluxChatWindow" class="autolux-chat-window hidden">
                <!-- Header -->
                <div class="autolux-chat-header">
                    <div class="chat-header-profile">
                        <div class="chat-avatar-wrapper">
                            <i class="fa-solid fa-robot"></i>
                            <span class="chat-online-dot"></span>
                        </div>
                        <div class="chat-header-info">
                            <h5>AutoLux AI Concierge</h5>
                            <p><i class="fa-solid fa-circle fa-2xs text-success"></i> Trực tuyến 24/7 • Dữ liệu thật 100%</p>
                        </div>
                    </div>
                    <div class="chat-header-actions">
                        <button class="chat-header-btn" id="chatClearBtn" title="Xóa hội thoại">
                            <i class="fa-solid fa-rotate-right"></i>
                        </button>
                        <button class="chat-header-btn" id="chatCloseBtn" title="Thu nhỏ">
                            <i class="fa-solid fa-chevron-down"></i>
                        </button>
                    </div>
                </div>

                <!-- Messages Container -->
                <div class="autolux-chat-messages" id="chatMessages">
                    <!-- Tin nhắn chào mặc định -->
                    <div class="chat-msg bot">
                        <div class="chat-msg-avatar"><i class="fa-solid fa-shield-halved"></i></div>
                        <div class="chat-bubble">
                            Kính chào quý khách! Em là <strong>AutoLux AI Concierge</strong>.
                            <br><br>
                            Em có thể hỗ trợ quý khách tra cứu <strong>thông số, giá bán 49 mẫu xe sang chính hãng</strong>, hướng dẫn <strong>vay trả góp 85%</strong> hoặc <strong>đặt lịch lái thử tại nhà</strong>.
                            <br><br>
                            Quý khách quan tâm mẫu xe nào hôm nay ạ?
                            <span class="chat-time">Vừa xong</span>
                        </div>
                    </div>
                </div>

                <!-- Gợi ý câu hỏi nhanh (Quick Chips) -->
                <div class="autolux-chat-chips" id="chatChips">
                    <button class="chat-chip" data-query="Tư vấn siêu xe tăng tốc dưới 3 giây">🏎️ Siêu xe bứt tốc &lt; 3s</button>
                    <button class="chat-chip" data-query="Mercedes-AMG G 63 giá bao nhiêu?">👑 G63 V8 Biturbo</button>
                    <button class="chat-chip" data-query="Có những mẫu xe điện hạng sang nào?">⚡ Xe điện Flagship EV</button>
                    <button class="chat-chip" data-query="Chính sách vay trả góp như thế nào?">💰 Vay trả góp 85%</button>
                    <button class="chat-chip" data-query="Địa chỉ 3 Showroom ở đâu?">📍 Địa chỉ Showroom</button>
                    <button class="chat-chip" data-query="Tôi muốn đặt lịch lái thử xe">🔑 Đặt lịch lái thử</button>
                </div>

                <!-- Input Bar -->
                <div class="autolux-chat-input-bar">
                    <input type="text" id="chatInput" class="autolux-chat-input" placeholder="Hỏi về mẫu xe, giá bán, trả góp..." autocomplete="off">
                    <button id="chatSendBtn" class="autolux-chat-send" title="Gửi tin nhắn">
                        <i class="fa-solid fa-paper-plane"></i>
                    </button>
                </div>
            </div>
        `;

        document.body.appendChild(widgetContainer);

        // Sự kiện UI
        const trigger = document.getElementById("autoluxChatTrigger");
        const tooltip = document.getElementById("autoluxChatTooltip");
        const windowEl = document.getElementById("autoluxChatWindow");
        const closeBtn = document.getElementById("chatCloseBtn");
        const clearBtn = document.getElementById("chatClearBtn");
        const input = document.getElementById("chatInput");
        const sendBtn = document.getElementById("chatSendBtn");
        const messagesContainer = document.getElementById("chatMessages");
        const chipsContainer = document.getElementById("chatChips");

        function toggleChat() {
            const isHidden = windowEl.classList.contains("hidden");
            if (isHidden) {
                windowEl.classList.remove("hidden");
                if (tooltip) tooltip.style.display = "none";
                document.getElementById("chatTriggerIcon").className = "fa-solid fa-xmark fa-xl";
                setTimeout(() => input.focus(), 250);
            } else {
                windowEl.classList.add("hidden");
                document.getElementById("chatTriggerIcon").className = "fa-solid fa-headset fa-xl";
            }
        }

        trigger.addEventListener("click", toggleChat);
        closeBtn.addEventListener("click", toggleChat);

        // Tự ẩn tooltip sau 8 giây nếu chưa click
        setTimeout(() => {
            if (tooltip) tooltip.style.display = "none";
        }, 8000);

        // Gửi tin nhắn
        function handleUserSend(textToSend) {
            const text = (textToSend || input.value).trim();
            if (!text) return;

            // Render tin nhắn của User
            renderUserMessage(text);
            input.value = "";

            // Hiệu ứng Bot đang soạn tin nhắn
            showTypingIndicator();

            setTimeout(() => {
                removeTypingIndicator();
                const response = getBotResponse(text);
                renderBotMessage(response.text, response.car);
            }, 650);
        }

        sendBtn.addEventListener("click", () => handleUserSend());
        input.addEventListener("keydown", (e) => {
            if (e.key === "Enter") {
                e.preventDefault();
                handleUserSend();
            }
        });

        // Click Quick Chips
        chipsContainer.addEventListener("click", (e) => {
            const chip = e.target.closest(".chat-chip");
            if (chip && chip.dataset.query) {
                handleUserSend(chip.dataset.query);
            }
        });

        // Clear chat
        clearBtn.addEventListener("click", () => {
            messagesContainer.innerHTML = `
                <div class="chat-msg bot">
                    <div class="chat-msg-avatar"><i class="fa-solid fa-shield-halved"></i></div>
                    <div class="chat-bubble">
                        Cuộc hội thoại đã được đặt lại. Quý khách cần AutoLux hỗ trợ thông tin gì về 49 mẫu xe chính hãng ạ?
                        <span class="chat-time">Vừa xong</span>
                    </div>
                </div>
            `;
        });

        function renderUserMessage(text) {
            const timeStr = new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' });
            const div = document.createElement("div");
            div.className = "chat-msg user";
            div.innerHTML = `
                <div class="chat-msg-avatar"><i class="fa-solid fa-user"></i></div>
                <div class="chat-bubble">
                    ${escapeHTML(text)}
                    <span class="chat-time">${timeStr}</span>
                </div>
            `;
            messagesContainer.appendChild(div);
            scrollToBottom();
        }

        function renderBotMessage(htmlText, carObj) {
            const timeStr = new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' });
            const div = document.createElement("div");
            div.className = "chat-msg bot";

            let carCardHTML = "";
            if (carObj) {
                const carImg = resolveImgPath(carObj.imageUrl);
                let detailHref = `./car-detail?id=${carObj.id}`;
                if (window.location.pathname.includes("/client/")) {
                    detailHref = `detail.html?id=${carObj.id}`;
                }
                carCardHTML = `
                    <div class="chat-car-card">
                        <img src="${carImg}" alt="${carObj.name}" class="chat-car-img" onerror="this.src='./assets/images/car-1.jpg'">
                        <div class="chat-car-body">
                            <div class="chat-car-name">${carObj.name}</div>
                            <div class="chat-car-price">${formatVND(carObj.price)}</div>
                            <div class="chat-car-specs">
                                <span><i class="fa-solid fa-horse-head text-warning"></i> ${carObj.power}</span>
                                <span><i class="fa-solid fa-stopwatch text-primary"></i> ${carObj.acceleration}</span>
                            </div>
                            <div class="chat-car-actions">
                                <a href="${detailHref}" class="chat-btn-action outline" target="_self">
                                    <i class="fa-solid fa-circle-info"></i> Chi Tiết
                                </a>
                                <a href="#booking" class="chat-btn-action gold" onclick="window.AutoLuxSelectBookingCar && window.AutoLuxSelectBookingCar(${carObj.id})">
                                    <i class="fa-solid fa-key"></i> Lái Thử
                                </a>
                            </div>
                        </div>
                    </div>
                `;
            }

            div.innerHTML = `
                <div class="chat-msg-avatar"><i class="fa-solid fa-shield-halved"></i></div>
                <div class="chat-bubble">
                    ${htmlText}
                    ${carCardHTML}
                    <span class="chat-time">${timeStr}</span>
                </div>
            `;
            messagesContainer.appendChild(div);
            scrollToBottom();
        }

        function showTypingIndicator() {
            const div = document.createElement("div");
            div.id = "chatTypingIndicator";
            div.className = "chat-msg bot";
            div.innerHTML = `
                <div class="chat-msg-avatar"><i class="fa-solid fa-shield-halved"></i></div>
                <div class="chat-bubble chat-typing">
                    <span></span><span></span><span></span>
                </div>
            `;
            messagesContainer.appendChild(div);
            scrollToBottom();
        }

        function removeTypingIndicator() {
            const el = document.getElementById("chatTypingIndicator");
            if (el) el.remove();
        }

        function scrollToBottom() {
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }

        function escapeHTML(str) {
            const p = document.createElement("p");
            p.appendChild(document.createTextNode(str));
            return p.innerHTML;
        }
    }

    // Tự động gài xe vào form đặt lịch lái thử khi bấm nút trong chat
    window.AutoLuxSelectBookingCar = function (carId) {
        const select = document.getElementById("bookingCarSelect");
        if (select) {
            select.value = carId;
        }
        const win = document.getElementById("autoluxChatWindow");
        if (win) win.classList.add("hidden");
        const triggerIcon = document.getElementById("chatTriggerIcon");
        if (triggerIcon) triggerIcon.className = "fa-solid fa-headset fa-xl";
    };

    // Chạy khi DOM sẵn sàng
    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", initChatbotUI);
    } else {
        initChatbotUI();
    }
})();
