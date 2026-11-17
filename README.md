# 🚗 AutoLux Motors - Landing Page Bán Xe Hạng Sang (Java Servlet Web Project)

Dự án Landing Page bán ô tô hạng sang, siêu xe và xe điện thông minh hoàn chỉnh, được xây dựng theo kiến trúc **DAO + MVC (Model - View - Controller)** chuẩn mực trên nền tảng **Java Servlet (Jakarta EE 10 / Tomcat 10.1)** kết hợp **JSP, JSTL, Bootstrap 5** và giao diện sang trọng hiện đại với màu sắc đồng bộ.

---

## 🔐 1. Cơ Chế Phân Quyền & Bảo Mật Nội Bộ (Staff Security)

- **Trang Showroom Khách hàng 100% Thuần Khiết**: Không còn bất kỳ nút "Admin" hay "Quản trị" lộ liễu nào trên giao diện chính của khách. Khách hàng chỉ trải nghiệm xe, đăng ký lái thử và tính trả góp.
- **Khu Vực Quản Trị Được Bảo Vệ**: Khi người lạ cố truy cập trực tiếp URL `/admin`, hệ thống sẽ chặn lại và tự động chuyển hướng về trang đăng nhập nội bộ `/login`.
- **Lối Vào Dành Riêng Cho Nhân Viên Nội Bộ**:
  - Nhấp vào liên kết nhỏ kín đáo ở chân trang: `🔒 Cổng nội bộ`.
  - Hoặc dùng phím tắt nhân viên: **`Ctrl + Shift + A`** (hoặc nhấp đúp chuột vào Logo thương hiệu).
- **Tài khoản quản trị demo**:
  - **Tên đăng nhập**: `admin`
  - **Mật khẩu**: `admin123` (hoặc `123456`)
- **Đăng xuất an toàn**: Có nút **Đăng xuất (Logout)** tại `/logout` để hủy phiên làm việc.

---

## 🏛️ 2. Cấu Trúc Dự Án (Project Structure)

```
AutoShowroom/
│
├── src/java/
│   ├── data/
│   │   ├── utils/Constants.java      # Cấu hình kết nối MySQL và thông tin Showroom
│   │   ├── driver/MySQLDriver.java   # Điều khiển kết nối CSDL MySQL
│   │   ├── dao/                      # Interface DAO (CategoryDao, CarDao, BookingDao, Database)
│   │   └── impl/                     # Thực thi DAO (CategoryImpl, CarImpl, BookingImpl)
│   ├── model/
│   │   ├── Category.java             # Lớp đối tượng Danh mục phân khúc xe
│   │   ├── Car.java                  # Lớp đối tượng Xe & thông số kỹ thuật
│   │   ├── BookingRequest.java       # Lớp đối tượng Đăng ký lái thử
│   │   └── ContactMessage.java       # Lớp đối tượng Lời nhắn liên hệ
│   └── controller/
│       ├── HomeServlet.java          # Servlet chính điều phối trang chủ & bộ lọc
│       ├── BookingServlet.java       # Servlet xử lý form lái thử (POST / AJAX JSON)
│       ├── ContactServlet.java       # Servlet xử lý tư vấn khách hàng
│       ├── LoginServlet.java         # Servlet xác thực nhân viên nội bộ
│       ├── LogoutServlet.java        # Servlet đăng xuất phiên làm việc
│       └── AdminServlet.java         # Servlet quản trị (Được bảo vệ bởi Session)
│
├── web/
│   ├── assets/
│   │   ├── css/style.css             # CSS tùy biến phong cách xe sang & đồng bộ màu
│   │   ├── js/main.js                # Xử lý tính trả góp, modal, AJAX, phím tắt nội bộ
│   │   └── vendor/bootstrap/         # Bootstrap 5 cục bộ (hoạt động offline)
│   ├── views/
│   │   ├── home.jsp                  # Giao diện Landing Page bán xe (Khách hàng)
│   │   ├── login.jsp                 # Giao diện Đăng nhập nội bộ nhân viên
│   │   └── admin.jsp                 # Giao diện Quản trị danh sách lái thử (Được bảo vệ)
│   ├── WEB-INF/
│   │   ├── lib/                      # JSTL 3.0 Jakarta jars
│   │   └── web.xml                   # Cấu hình chuẩn Welcome-file list
│   ├── META-INF/context.xml
│   └── index.jsp                     # Tự động chuyển hướng vào HomeServlet
│
├── nbproject/                        # Cấu hình dự án Apache NetBeans 29
└── build.xml                         # Apache Ant build script
```

---

## 🚀 3. Hướng Dẫn Chạy & Kiểm Thử Phân Quyền

1. Mở **NetBeans IDE** ➔ Mở project `D:\DHKH2027\AutoShowroom`.
2. Nhấn **Run (F6)**.
3. **Trải nghiệm khách hàng**: Mở `http://localhost:8080/AutoShowroom/` (Giao diện chuẩn sang trọng, không lộ nút admin).
4. **Kiểm tra bảo mật**: Thử gõ `http://localhost:8080/AutoShowroom/admin` trên trình duyệt ➔ Hệ thống sẽ tự động chặn và chuyển hướng sang trang `/login`.
5. **Đăng nhập quản trị**: Nhập tài khoản `admin` / mật khẩu `admin123` để vào quản lý danh sách khách đặt lịch lái thử!
