package data.driver;

import data.utils.Constants;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Lớp điều khiển kết nối MySQL Driver
 * @author Phu
 */
public class MySQLDriver {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(Constants.DB_URL, Constants.USER, Constants.PASS);
        } catch (Exception ex) {
            // Khi chưa bật MySQL, in log và trả về null an toàn
            System.err.println("[MySQLDriver] Thông báo: Chưa kết nối MySQL Server (" + ex.getMessage() + "). Hệ thống sẽ dùng dữ liệu bộ nhớ dự phòng.");
            return null;
        }
    }
}

