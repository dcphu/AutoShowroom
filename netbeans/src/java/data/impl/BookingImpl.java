package data.impl;

import data.dao.BookingDao;
import data.driver.MySQLDriver;
import model.BookingRequest;
import model.ContactMessage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Lớp BookingImpl quản lý lịch đặt lái thử và tin nhắn tư vấn khách hàng,
 * kết nối đồng bộ cơ sở dữ liệu MySQL autoshowroom và dự phòng in-memory an toàn.
 * @author Phu
 */
public class BookingImpl implements BookingDao {

    private final List<BookingRequest> memBookings = new CopyOnWriteArrayList<>();
    private final List<ContactMessage> memContacts = new CopyOnWriteArrayList<>();
    private final AtomicInteger bookingIdGen = new AtomicInteger(100);
    private final AtomicInteger contactIdGen = new AtomicInteger(100);

    public BookingImpl() {
        initSampleData();
    }

    private void initSampleData() {
        BookingRequest b1 = new BookingRequest(
            bookingIdGen.incrementAndGet(),
            "Nguyễn Văn An", "0905123456", "an.nguyen@gmail.com",
            1, "Mercedes-AMG GT 63 S E-Performance", "20/11/2026", "09:00", "showroom",
            "Muốn thử tăng tốc trên đường thử và tư vấn gói cá nhân hóa màu sơn Designo."
        );
        b1.setStatus("Đã xác nhận");
        memBookings.add(b1);

        BookingRequest b2 = new BookingRequest(
            bookingIdGen.incrementAndGet(),
            "Trần Thị Mai Phương", "0988776655", "phuong.tran@vietgroup.vn",
            2, "Porsche Taycan Turbo S Cross Turismo", "22/11/2026", "14:30", "home",
            "Yêu cầu mang xe đến khu đô thị Sala để trải nghiệm thực tế cùng gia đình."
        );
        b2.setStatus("Chờ xác nhận");
        memBookings.add(b2);

        ContactMessage c1 = new ContactMessage(
            contactIdGen.incrementAndGet(),
            "Lê Hoàng Long", "0912345678", "long.le@hoanglongcorp.com",
            "Tư vấn mua xe trả góp Maybach S680",
            "Tôi muốn biết hạn mức vay tối đa của ngân hàng đối với dòng xe Maybach S680 và thời gian giải ngân bao lâu?"
        );
        c1.setStatus("Đã phản hồi");
        c1.setReplyMessage("Chào anh Long, dòng xe Maybach S680 hiện được ngân hàng đối tác hỗ trợ vay đến 85% trong 8 năm, thủ tục giải ngân chỉ trong 24 giờ.");
        c1.setRepliedBy("Trần Quang Huy (Trưởng phòng KD)");
        c1.setRepliedAt("13/11/2026 10:45");
        memContacts.add(c1);

        ContactMessage c2 = new ContactMessage(
            contactIdGen.incrementAndGet(),
            "Vũ Đình Tuấn", "0933221100", "tuan.vu@architect.vn",
            "Hỏi thời gian bàn giao xe Porsche 911 GT3 RS",
            "Mẫu xe GT3 RS màu xám xi-măng Arctic Grey hiện có sẵn giao ngay tại showroom Hà Nội không?"
        );
        c2.setStatus("Chưa phản hồi");
        memContacts.add(c2);
    }

    @Override
    public BookingRequest addBooking(String fullName, String phone, String email,
                                     int carId, String carName, String bookingDate,
                                     String bookingTime, String locationType, String notes) {
        String sql = "INSERT INTO bookings (full_name, phone, email, car_id, car_name, booking_date, booking_time, location_type, notes, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'Chờ xác nhận')";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setString(1, fullName);
                    ps.setString(2, phone);
                    ps.setString(3, email);
                    ps.setInt(4, carId);
                    ps.setString(5, carName);
                    ps.setString(6, bookingDate);
                    ps.setString(7, bookingTime);
                    ps.setString(8, locationType);
                    ps.setString(9, notes);
                    ps.executeUpdate();
                    try (ResultSet rs = ps.getGeneratedKeys()) {
                        if (rs.next()) {
                            int newId = rs.getInt(1);
                            BookingRequest req = new BookingRequest(newId, fullName, phone, email, carId, carName, bookingDate, bookingTime, locationType, notes);
                            req.setStatus("Chờ xác nhận");
                            memBookings.add(0, req);
                            return req;
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi addBooking MySQL: " + e.getMessage());
        }

        // Dự phòng memory
        BookingRequest req = new BookingRequest(bookingIdGen.incrementAndGet(), fullName, phone, email, carId, carName, bookingDate, bookingTime, locationType, notes);
        req.setStatus("Chờ xác nhận");
        memBookings.add(0, req);
        return req;
    }

    @Override
    public List<BookingRequest> findAllBookings() {
        List<BookingRequest> list = new ArrayList<>();
        String sql = "SELECT * FROM bookings ORDER BY id DESC";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        BookingRequest b = new BookingRequest(
                            rs.getInt("id"),
                            rs.getString("full_name"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getInt("car_id"),
                            rs.getString("car_name"),
                            rs.getString("booking_date"),
                            rs.getString("booking_time"),
                            rs.getString("location_type"),
                            rs.getString("notes")
                        );
                        b.setStatus(rs.getString("status"));
                        list.add(b);
                    }
                    if (!list.isEmpty()) {
                        memBookings.clear();
                        memBookings.addAll(list);
                        return list;
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi findAllBookings MySQL: " + e.getMessage());
        }
        return memBookings;
    }

    @Override
    public BookingRequest findBooking(int id) {
        String sql = "SELECT * FROM bookings WHERE id = ?";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, id);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            BookingRequest b = new BookingRequest(
                                rs.getInt("id"),
                                rs.getString("full_name"),
                                rs.getString("phone"),
                                rs.getString("email"),
                                rs.getInt("car_id"),
                                rs.getString("car_name"),
                                rs.getString("booking_date"),
                                rs.getString("booking_time"),
                                rs.getString("location_type"),
                                rs.getString("notes")
                            );
                            b.setStatus(rs.getString("status"));
                            return b;
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi findBooking id=" + id + ": " + e.getMessage());
        }
        for (BookingRequest b : memBookings) {
            if (b.getId() == id) return b;
        }
        return null;
    }

    @Override
    public boolean updateBookingStatus(int id, String newStatus) {
        String sql = "UPDATE bookings SET status = ? WHERE id = ?";
        boolean dbSuccess = false;
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, newStatus);
                    ps.setInt(2, id);
                    int rows = ps.executeUpdate();
                    dbSuccess = (rows > 0);
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi updateBookingStatus MySQL: " + e.getMessage());
        }

        // Luôn cập nhật đồng bộ trong danh sách bộ nhớ memBookings
        boolean memSuccess = false;
        for (BookingRequest b : memBookings) {
            if (b.getId() == id) {
                b.setStatus(newStatus);
                memSuccess = true;
                break;
            }
        }
        return dbSuccess || memSuccess;
    }

    @Override
    public ContactMessage addContact(String fullName, String phone, String email,
                                     String subject, String message) {
        String sql = "INSERT INTO contacts (full_name, phone, email, subject, message, status) VALUES (?, ?, ?, ?, ?, 'Chưa phản hồi')";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setString(1, fullName);
                    ps.setString(2, phone);
                    ps.setString(3, email);
                    ps.setString(4, subject);
                    ps.setString(5, message);
                    ps.executeUpdate();
                    try (ResultSet rs = ps.getGeneratedKeys()) {
                        if (rs.next()) {
                            int newId = rs.getInt(1);
                            ContactMessage msg = new ContactMessage(newId, fullName, phone, email, subject, message);
                            memContacts.add(0, msg);
                            return msg;
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi addContact MySQL: " + e.getMessage());
        }

        ContactMessage msg = new ContactMessage(contactIdGen.incrementAndGet(), fullName, phone, email, subject, message);
        memContacts.add(0, msg);
        return msg;
    }

    @Override
    public List<ContactMessage> findAllContacts() {
        List<ContactMessage> list = new ArrayList<>();
        String sql = "SELECT * FROM contacts ORDER BY id DESC";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        ContactMessage c = new ContactMessage(
                            rs.getInt("id"),
                            rs.getString("full_name"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getString("subject"),
                            rs.getString("message")
                        );
                        c.setStatus(rs.getString("status"));
                        c.setReplyMessage(rs.getString("reply_message"));
                        c.setRepliedBy(rs.getString("replied_by"));
                        c.setRepliedAt(rs.getString("replied_at"));
                        list.add(c);
                    }
                    if (!list.isEmpty()) {
                        memContacts.clear();
                        memContacts.addAll(list);
                        return list;
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi findAllContacts MySQL: " + e.getMessage());
        }
        return memContacts;
    }

    @Override
    public ContactMessage findContact(int id) {
        String sql = "SELECT * FROM contacts WHERE id = ?";
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, id);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            ContactMessage c = new ContactMessage(
                                rs.getInt("id"),
                                rs.getString("full_name"),
                                rs.getString("phone"),
                                rs.getString("email"),
                                rs.getString("subject"),
                                rs.getString("message")
                            );
                            c.setStatus(rs.getString("status"));
                            c.setReplyMessage(rs.getString("reply_message"));
                            c.setRepliedBy(rs.getString("replied_by"));
                            c.setRepliedAt(rs.getString("replied_at"));
                            return c;
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi findContact id=" + id + ": " + e.getMessage());
        }
        for (ContactMessage c : memContacts) {
            if (c.getId() == id) return c;
        }
        return null;
    }

    @Override
    public boolean replyContact(int id, String replyMessage, String repliedBy) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        String repliedAt = LocalDateTime.now().format(dtf);

        String sql = "UPDATE contacts SET reply_message = ?, replied_by = ?, replied_at = ?, status = 'Đã phản hồi' WHERE id = ?";
        boolean dbSuccess = false;
        try (Connection con = MySQLDriver.getConnection()) {
            if (con != null) {
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, replyMessage);
                    ps.setString(2, repliedBy);
                    ps.setString(3, repliedAt);
                    ps.setInt(4, id);
                    int rows = ps.executeUpdate();
                    dbSuccess = (rows > 0);
                }
            }
        } catch (Exception e) {
            System.err.println("[BookingImpl] Lỗi replyContact MySQL: " + e.getMessage());
        }

        // Luôn cập nhật đồng bộ trong danh sách bộ nhớ memContacts
        boolean memSuccess = false;
        for (ContactMessage c : memContacts) {
            if (c.getId() == id) {
                c.setReplyMessage(replyMessage);
                c.setRepliedBy(repliedBy);
                c.setRepliedAt(repliedAt);
                c.setStatus("Đã phản hồi");
                memSuccess = true;
                break;
            }
        }
        return dbSuccess || memSuccess;
    }
}
