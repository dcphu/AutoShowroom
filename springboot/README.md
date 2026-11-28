# 🚗 ĐỒ ÁN: HỆ THỐNG SHOWROOM Ô TÔ CAO CẤP AUTOLUX MOTORS

Ứng dụng Web quản lý và quảng bá Showroom Ô tô hạng sang, siêu xe thể thao và xe điện thông minh, được xây dựng theo kiến trúc chuẩn **Enterprise MVC** trên nền tảng **Java Spring Boot 3** và **MySQL**.

---

## 🛠️ 1. Công Nghệ Sử Dụng (Tech Stack)

### Backend
- **Ngôn ngữ**: Java 17 (LTS)
- **Framework**: Spring Boot 3.2.5
  - **Spring Web (Spring MVC)**: Điều hướng luồng Controller và cung cấp RESTful API.
  - **Spring Data JPA & Hibernate 6**: Quản lý truy vấn dữ liệu dạng ORM, hỗ trợ JPA Specification tìm kiếm và lọc xe đa tiêu chí.
  - **HikariCP**: Connection Pool hiệu năng cao kết nối CSDL MySQL.
  - **Embedded Apache Tomcat 10.1**: Web Server nhúng, khởi động trực tiếp không cần cài đặt Tomcat ngoài.
  - **Spring Boot DevTools**: Hỗ trợ phát triển nhanh và LiveReload.

### Cơ Sở Dữ Liệu (Database)
- **Hệ quản trị CSDL**: MySQL 8.x
- **Thư viện kết nối**: MySQL Connector/J (`com.mysql:mysql-connector-j`)
- **Cấu hình kết nối**: Port `3306`, Database `autoshowroom`, bảng mã `utf8mb4_unicode_ci`.

### Frontend & Giao Diện
- **Template Engine**: Thymeleaf 3 (Render HTML5 phía Server - SSR).
- **CSS Framework**: Bootstrap 5.3 (Giao diện chuẩn Responsive, Grid System, Modal, Toast).
- **Icons**: Font Awesome 6.5.
- **JavaScript**: Vanilla JS (ES6+) & Fetch API xử lý AJAX bất đồng bộ (tính trả góp thời gian thực, submit form không tải lại trang).

### Công Cụ Quản Lý & Biên Dịch
- **Build Tool**: Apache Maven (đã tích hợp sẵn Maven Wrapper `mvnw` / `mvnw.cmd`).

---

## 🏛️ 2. Kiến Trúc Ứng Dụng (Enterprise MVC Architecture)

```
com.autolux.showroom/
├── AutoShowroomApplication.java   # Điểm khởi chạy ứng dụng & tự mở trình duyệt
├── config/
│   └── WebMvcConfig.java          # Cấu hình tài nguyên tĩnh (Static Resource Handlers)
├── controller/
│   ├── HomeController.java        # Điều hướng trang chủ và hiển thị bộ sưu tập
│   ├── SearchController.java      # Xử lý lọc và tìm kiếm xe đa tiêu chí
│   ├── CarDetailController.java   # Hiển thị thông số chi tiết xe & gợi ý xe cùng phân khúc
│   ├── BookingController.java     # Tiếp nhận và xử lý đặt lịch hẹn lái thử
│   ├── ContactController.java     # Tiếp nhận lời nhắn tư vấn từ khách hàng
│   ├── AuthController.java        # Xác thực đăng nhập & đăng xuất nhân viên quản trị
│   ├── AdminController.java       # Quản trị lịch hẹn và trả lời phản hồi tư vấn
│   └── ApiCarController.java      # RESTful API cung cấp dữ liệu cho ứng dụng mở rộng
├── entity/
│   ├── User.java                  # Thực thể Tài khoản quản trị viên Showroom
│   ├── Car.java                   # Thực thể Xe & thông số kỹ thuật
│   ├── Category.java              # Thực thể Danh mục phân khúc xe
│   ├── BookingRequest.java        # Thực thể Đơn đăng ký lái thử
│   └── ContactMessage.java        # Thực thể Lời nhắn tư vấn khách hàng
├── repository/
│   ├── UserRepository.java        # Truy vấn tài khoản quản trị viên
│   ├── CarRepository.java         # Truy vấn xe (hỗ trợ JPA Specification, Distinct Brand)
│   ├── CategoryRepository.java    # Truy vấn danh mục xe
│   ├── BookingRepository.java     # Truy vấn lịch hẹn lái thử
│   └── ContactRepository.java     # Truy vấn tin nhắn tư vấn
└── service/
    ├── UserService.java           # Nghiệp vụ xác thực & quản lý tài khoản nhân viên
    ├── CarService.java            # Nghiệp vụ lọc xe, lấy xe nổi bật, quản lý xe
    ├── CategoryService.java       # Nghiệp vụ danh mục xe
    ├── BookingService.java        # Nghiệp vụ đặt lịch và cập nhật trạng thái
    └── ContactService.java        # Nghiệp vụ lưu tin và phản hồi khách hàng
```

---

## 🌟 3. Các Chức Năng Chính Trong Đồ Án

### 3.1. Dành Cho Khách Hàng (Client Portal)
1. **Khám phá bộ sưu tập xe**:
   - Phân loại theo 5 phân khúc: *Sedan Hạng Sang, SUV / Crossover, Siêu Xe Thể Thao, Xe Điện Flagship EV, Siêu Sang Quý Tộc*.
   - Hiển thị thông số kỹ thuật nhanh: Động cơ, công suất (HP), thời gian tăng tốc 0-100 km/h, hộp số, giá niêm yết.
2. **Bộ lọc & Tìm kiếm thông minh**:
   - Lọc đồng thời theo: Phân khúc + Hãng xe (Mercedes, Porsche, BMW, Audi, Ferrari, VinFast...) + Khoảng giá + Từ khóa tự do.
3. **Chi tiết xe độc bản**:
   - Trang chi tiết kỹ thuật chuyên sâu của từng mẫu xe.
   - Tự động gợi ý 3 mẫu xe liên quan cùng phân khúc.
4. **Công cụ dự toán trả góp ngân hàng (Loan Calculator)**:
   - Tự động tính toán số tiền trả trước (10% - 70%), số tiền vay, tiền gốc + lãi trả hàng tháng theo lãi suất và thời hạn vay.
5. **Đăng ký lái thử trực tuyến (Booking Form)**:
   - Đặt lịch hẹn lái thử tại showroom hoặc tại nhà qua AJAX, kiểm tra hợp lệ số điện thoại và email theo chuẩn Việt Nam.
6. **Gửi tin nhắn tư vấn (Contact Form)**:
   - Gửi yêu cầu cá nhân hóa màu sơn, nội thất và chính sách mua xe trực tiếp tới ban quản trị.

### 3.2. Dành Cho Quản Trị Viên (Staff / Admin Portal)
1. **Bảo mật & Phân quyền nội bộ**:
   - Cổng vào được bảo vệ bằng Session: Mọi truy cập trái phép vào `/admin` đều tự động chuyển về `/login`.
   - Lối vào kín đáo: Nhấp liên kết bảo mật ở Footer hoặc dùng phím tắt `Ctrl + Shift + A` (hoặc nhấp đúp vào Logo).
   - Tài khoản quản trị mặc định: `admin` / Mật khẩu: `admin123`.
2. **Thống kê tổng quan Dashboard**:
   - Thống kê thời gian thực: Tổng số xe trong kho, tổng đơn lái thử, số đơn chờ xác nhận, số tin nhắn chưa phản hồi.
3. **Quản lý đơn lái thử**:
   - Xem chi tiết danh sách khách hẹn: Họ tên, số điện thoại, ngày giờ, địa điểm showroom.
   - Thao tác chuyển đổi trạng thái: *Chờ xác nhận ➔ Đã xác nhận ➔ Hoàn tất / Đã hủy*.
4. **Hộp thư phản hồi khách hàng**:
   - Xem nội dung thắc mắc của khách và trực tiếp nhập nội dung phản hồi, lưu vết vào hệ thống.

### 3.3. Tích Hợp RESTful API
- `GET /api/cars`: Lấy danh sách xe (hỗ trợ lọc qua query params: `category`, `brand`, `keyword`, `priceRange`).
- `GET /api/cars/{id}`: Lấy thông tin chi tiết một mẫu xe theo ID.
- `GET /api/featured`: Lấy danh sách các dòng xe nổi bật / xe độc bản.
- `GET /api/categories`: Lấy danh mục các phân khúc xe.
- `GET /api/brands`: Lấy danh sách các thương hiệu xe hiện có.

---

## 🗄️ 4. Thiết Kế Cơ Sở Dữ Liệu MySQL

Dự án sử dụng cơ sở dữ liệu `autoshowroom` gồm 5 bảng chính:

1. **`users`** (Tài khoản quản trị Showroom):
   - `id` (PK, Auto Increment), `username` (Tên đăng nhập, UNIQUE), `password` (Mật khẩu), `full_name` (Họ tên nhân viên), `role` (Vai trò, ví dụ: ADMIN), `status` (Trạng thái hoạt động ACTIVE), `created_at`.
2. **`categories`** (Danh mục phân khúc):
   - `id` (PK, Auto Increment), `name` (Tên danh mục), `slug` (Mã định danh), `icon` (Class icon FontAwesome).
2. **`cars`** (Thông tin xe ô tô):
   - `id` (PK, Auto Increment), `name` (Tên xe), `brand` (Hãng sản xuất), `category` (Phân khúc), `price` (Giá bán), `original_price` (Giá niêm yết cũ), `engine` (Động cơ), `power` (Công suất), `acceleration` (Tăng tốc), `transmission` (Hộp số), `top_speed` (Tốc độ tối đa), `range_or_fuel` (Nhiên liệu/Pin), `image_url` (Ảnh xe), `badge` (Huy hiệu), `description` (Mô tả), `is_featured` (Xe nổi bật).
3. **`bookings`** (Lịch hẹn lái thử):
   - `id` (PK, Auto Increment), `customer_name`, `phone`, `email`, `car_id`, `showroom_location`, `booking_date`, `time_slot`, `driver_license`, `status`, `notes`, `created_at`.
4. **`contacts`** (Tin nhắn tư vấn):
   - `id` (PK, Auto Increment), `fullname`, `phone`, `email`, `subject`, `message`, `status`, `reply_message`, `created_at`.

---

## 🚀 5. Hướng Dẫn Khởi Chạy Ứng Dụng

### Yêu Cầu Môi Trường
- **Java**: JDK 17 trở lên.
- **Cơ sở dữ liệu**: MySQL Server (XAMPP / MySQL Service) đang chạy tại cổng `3306`.

### Cách 1: Chạy trong Apache NetBeans
1. Mở NetBeans ➔ **File** ➔ **Open Project...** ➔ Chọn thư mục `springboot`.
2. Mở file `AutoShowroomApplication.java` ➔ Nhấn tổ hợp phím **Shift + F6** (hoặc chuột phải chọn **Run File**).
3. Trình duyệt sẽ tự động bật lên trang chủ [http://localhost:8080/](http://localhost:8080/).

### Cách 2: Chạy bằng dòng lệnh (Command Line / Terminal)
Tại thư mục `springboot`:
```bash
.\mvnw.cmd spring-boot:run
```

---

## 🌐 6. Danh Sách Đường Dẫn Truy Cập (Sitemap)

| Chức năng | Đường dẫn | Ghi chú |
| :--- | :--- | :--- |
| **Trang chủ Showroom** | `http://localhost:8080/` | Xem toàn bộ xe, tính trả góp, đặt lái thử |
| **Chi tiết mẫu xe** | `http://localhost:8080/car-detail?id=1` | Xem thông số chi tiết & xe gợi ý tương tự |
| **Tìm kiếm & Lọc xe** | `http://localhost:8080/search?keyword=AMG` | Tìm theo từ khóa, giá, hãng xe |
| **Đăng nhập Quản trị** | `http://localhost:8080/login` | Tài khoản: `admin` / Mật khẩu: `admin123` |
| **Bảng điều khiển Admin** | `http://localhost:8080/admin` | Quản lý lịch lái thử & trả lời tư vấn |
| **Đăng xuất Quản trị** | `http://localhost:8080/logout` | Hủy session và quay về trang chủ |
| **REST API Xe** | `http://localhost:8080/api/cars` | Trả về dữ liệu JSON phục vụ API |
