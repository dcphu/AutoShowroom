# 🚀 Hướng Dẫn Deploy Dự Án AutoLux Showroom Lên Web

Dự án **AutoLux Motors** đã được tinh chỉnh hoàn thiện, hỗ trợ cấu hình qua biến môi trường (**Environment Variables**), chuẩn hóa toàn bộ URL Servlet và đóng gói sẵn file WAR.

---

## 📦 1. File Đã Đóng Gói Sẵn Sàng
- **File WAR**: `dist/AutoShowroom.war` (hoặc đổi tên thành `ROOT.war` để chạy tại trang chủ domain).
- **File Database mẫu**: `src/java/data/utils/autoshowroom.sql`.

---

## 🌐 2. Các Biến Môi Trường (Environment Variables) Được Hỗ Trợ
Bạn có thể cấu hình linh hoạt trên Server/Cloud mà **không cần sửa lại mã nguồn Java**:

| Biến môi trường | Giá trị mẫu | Ý nghĩa |
| :--- | :--- | :--- |
| `DB_URL` | `jdbc:mysql://db-host:3306/autoshowroom?useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Ho_Chi_Minh` | Chuỗi kết nối MySQL |
| `DB_USER` | `root` / `admin` | Tên đăng nhập CSDL |
| `DB_PASS` | `mypassword123` | Mật khẩu CSDL |
| `ADMIN_USER` | `admin` | Tên đăng nhập trang quản trị nội bộ |
| `ADMIN_PASS` | `AutoLux@Secure2026!` | Mật khẩu trang quản trị nội bộ |

> *Ghi chú*: Nếu không truyền biến môi trường, hệ thống sẽ tự động dùng thông số mặc định (Localhost MySQL, pass trống, admin/admin123). Nếu database chưa bật, cơ chế **In-Memory Fallback** vẫn giữ website hoạt động ổn định.

---

## 🚢 3. Cách Triển Khai (3 Phương Án Phổ Biến)

### Phương Án A: Deploy Lên Railway.app / Render.com (Khuyên dùng - Cực dễ)
1. Đẩy code lên GitHub repository của bạn.
2. Đăng nhập [Railway.app](https://railway.app/) hoặc [Render.com](https://render.com/).
3. Tạo 1 dịch vụ **MySQL Database** -> Lấy thông tin URL, User, Password.
4. Import file `src/java/data/utils/autoshowroom.sql` vào database vừa tạo.
5. Tạo dịch vụ **Web Service** trỏ vào GitHub repo:
   - Nền tảng sẽ tự động nhận diện file `Dockerfile` đã tạo sẵn.
   - Điền các biến môi trường `DB_URL`, `DB_USER`, `DB_PASS`, `ADMIN_PASS`.
6. Bấm Deploy -> Hệ thống cấp miễn phí tên miền HTTPS (VD: `https://autolux-motors.up.railway.app`).

---

### Phương Án B: Deploy Bằng Docker Trên VPS (Ubuntu Linux)
Nếu bạn có VPS riêng:
```bash
# 1. Clone source code về VPS
git clone <your-repo-url>
cd AutoShowroom

# 2. Khởi chạy toàn bộ Web + MySQL bằng Docker Compose
docker compose up -d
```
Website sẽ chạy ngay tại cổng `8080` của VPS!

---

### Phương Án C: Deploy Lên Server Apache Tomcat Có Sẵn (cPanel / VPS Tomcat)
1. Tải file `dist/AutoShowroom.war`.
2. Đổi tên file thành `ROOT.war` (nếu muốn vào thẳng `https://tenmien.com/`) hoặc giữ nguyên `AutoShowroom.war` (nếu muốn vào `https://tenmien.com/AutoShowroom/`).
3. Đăng nhập cPanel hoặc copy file vào thư mục `/webapps/` của Apache Tomcat.
4. Tomcat sẽ tự động giải nén và kích hoạt ứng dụng.
5. Import file `src/java/data/utils/autoshowroom.sql` vào MySQL của hosting.

---

## 🔒 4. Kiểm Tra Sau Khi Deploy
1. **Trang chủ khách hàng**: Truy cập domain xem danh sách xe, bộ lọc thương hiệu/phân khúc và công cụ tính trả góp.
2. **Thử đặt lịch lái thử**: Điền form Lái thử xem có nhận được thông báo Toast thành công hay không.
3. **Khu vực quản trị nội bộ**:
   - Truy cập: `https://tenmien.com/login` (hoặc bấm `Ctrl + Shift + A` tại trang chủ).
   - Đăng nhập với tài khoản `admin` và mật khẩu đã cấu hình.
   - Kiểm tra xem danh sách lịch hẹn và phản hồi tư vấn khách hàng.
