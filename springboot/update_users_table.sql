-- ==============================================================
-- SCRIPT CẬP NHẬT BỔ SUNG BẢNG USERS VÀO CSDL AUTOSHOWROOM
-- (Chạy đoạn này sẽ không làm mất dữ liệu của 4 bảng cũ)
-- ==============================================================
USE autoshowroom;

-- 1. Tạo bảng users nếu chưa có
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(150) DEFAULT 'Quản Trị Viên Showroom',
    role VARCHAR(50) DEFAULT 'ADMIN',
    status VARCHAR(50) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Thêm tài khoản admin mặc định nếu chưa tồn tại
INSERT IGNORE INTO users (id, username, password, full_name, role, status)
VALUES (1, 'admin', 'admin123', 'Quản Trị Viên Showroom', 'ADMIN', 'ACTIVE');

-- 3. Kiểm tra kết quả
SELECT * FROM users;
