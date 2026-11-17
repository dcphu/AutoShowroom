package data.utils;

/**
 * Lớp cấu hình hằng số kết nối Cơ sở dữ liệu và thông tin Showroom
 * 
 * @author Phu
 */
public class Constants {

    // Cấu hình kết nối MySQL: Hỗ trợ linh hoạt biến môi trường (Docker / Cloud / VPS) và mặc định Localhost
    public static final String DB_URL = System.getenv("DB_URL") != null && !System.getenv("DB_URL").trim().isEmpty()
            ? System.getenv("DB_URL").trim()
            : "jdbc:mysql://localhost:3306/autoshowroom?useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Ho_Chi_Minh";

    public static final String USER = System.getenv("DB_USER") != null && !System.getenv("DB_USER").trim().isEmpty()
            ? System.getenv("DB_USER").trim()
            : "root";

    public static final String PASS = System.getenv("DB_PASS") != null
            ? System.getenv("DB_PASS")
            : "";

    // Mật khẩu quản trị nội bộ (có thể override qua biến môi trường ADMIN_PASS trên server)
    public static final String ADMIN_USER = System.getenv("ADMIN_USER") != null ? System.getenv("ADMIN_USER").trim() : "admin";
    public static final String ADMIN_PASS = System.getenv("ADMIN_PASS") != null ? System.getenv("ADMIN_PASS").trim() : "admin123";

    // Thông tin thương hiệu Showroom
    public static final String BRAND_NAME = "AUTOLUX MOTORS";
    public static final String HOTLINE = "1900 888 999";
    public static final String EMAIL = "contact@autolux.vn";
    public static final String ADDRESS_HN = "Tòa tháp Keangnam Landmark 72, Phạm Hùng, Hà Nội";
    public static final String ADDRESS_DN = "186 Nguyễn Văn Linh, Hải Châu, Đà Nẵng";
    public static final String ADDRESS_HCM = "KĐT Sala, Nguyễn Cơ Thạch, TP. Thủ Đức, TP. Hồ Chí Minh";
}
