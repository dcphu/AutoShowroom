# 🚗 AutoLux Motors - Spring Boot Web Application

Dự án Hệ thống Showroom Ô Tô Cao Cấp **AutoLux Motors** được chuyển đổi và nâng cấp hoàn toàn sang kiến trúc **Java Spring Boot 3 + Spring Data JPA + Thymeleaf + Bootstrap 5 + MySQL/H2**.

---

## 🌟 1. Điểm Nổi Bật Của Phiên Bản Spring Boot
- **Kiến trúc chuẩn Enterprise MVC**:
  - `entity/`: Các thực thể JPA (`Car`, `Category`, `BookingRequest`, `ContactMessage`).
  - `repository/`: Spring Data JPA Repositories truy vấn dữ liệu nhanh và hỗ trợ JPA Specification lọc đa tiêu chí.
  - `service/`: Tầng nghiệp vụ độc lập, xử lý luồng logic và tính toán.
  - `controller/`: Spring MVC Controllers điều hướng (`HomeController`, `CarDetailController`, `SearchController`, `BookingController`, `ContactController`, `AdminController`, `AuthController`).
  - `ApiCarController`: Tích hợp sẵn RESTful API (`/api/cars`, `/api/featured`, `/api/categories`, `/api/brands`) phục vụ mở rộng Frontend/Mobile App.
- **Thymeleaf Template Engine**: Giao diện HTML5 hiện đại, không phụ thuộc Servlet Container, render cực nhanh.
- **Hỗ trợ song song MySQL & H2**:
  - Chạy mặc định với MySQL Server (XAMPP).
  - Có sẵn profile `h2` chạy in-memory lập tức không cần cấu hình hay mở MySQL.
- **DataInitializer tự động**: Tự động nạp sẵn 49 mẫu xe, 5 danh mục và mẫu dữ liệu lịch hẹn khi ứng dụng khởi động lần đầu.

---

## 🛠️ 2. Yêu Cầu Môi Trường
- **Java**: JDK 17+ (Đã tương thích 100% với JDK 17 đang có trên máy bạn).
- **Cơ sở dữ liệu**: MySQL 8.x (XAMPP / MySQL Server) hoặc H2 In-Memory Database.
- **Maven**: Đã tích hợp sẵn Maven Wrapper (`mvnw` / `mvnw.cmd`), không cần cài đặt thêm Maven ngoài.

---

## 🚀 3. Hướng Dẫn Chạy Ứng Dụng

### Cách 1: Chạy bằng Terminal / Command Prompt / PowerShell
Mở terminal tại thư mục `springboot`:
```bash
# Chạy với MySQL mặc định (cần bật MySQL trong XAMPP):
.\mvnw.cmd spring-boot:run

# Hoặc chạy thử nghiệm ngay với H2 Database (Không cần bật MySQL):
.\mvnw.cmd spring-boot:run -Dspring-boot.run.profiles=h2
```

### Cách 2: Mở và chạy trong Apache NetBeans
1. Mở **NetBeans IDE**.
2. Chọn **File** -> **Open Project...** -> Điều hướng tới thư mục `d:\DHKH2027\AutoShowroom\springboot`.
3. NetBeans sẽ tự động nhận diện dự án Maven.
4. Chuột phải vào project `AutoShowroom` -> Chọn **Run** (hoặc nhấn `F6`).

### Cách 3: Mở trong VS Code / IntelliJ IDEA / Eclipse
1. Mở thư mục `springboot/`.
2. Mở file `src/main/java/com/autolux/showroom/AutoShowroomApplication.java`.
3. Nhấn nút **Run** / **Debug** (hoặc `Shift + F10` trong IntelliJ).

---

## 🌐 4. Các Đường Dẫn Truy Cập Chính
Sau khi ứng dụng khởi động thành công tại cổng `8080`:
- **Trang chủ Showroom**: [http://localhost:8080/](http://localhost:8080/) hoặc [http://localhost:8080/home](http://localhost:8080/home)
- **Chi tiết xe**: [http://localhost:8080/car-detail?id=1](http://localhost:8080/car-detail?id=1)
- **Đăng nhập Quản trị**: [http://localhost:8080/login](http://localhost:8080/login)
  - *Tài khoản:* `admin`
  - *Mật khẩu:* `admin123`
- **Bảng điều khiển Quản trị**: [http://localhost:8080/admin](http://localhost:8080/admin)
- **REST API Danh sách xe**: [http://localhost:8080/api/cars](http://localhost:8080/api/cars)
- **Console H2 Database (Khi chạy profile h2)**: [http://localhost:8080/h2-console](http://localhost:8080/h2-console)
