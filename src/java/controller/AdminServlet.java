package controller;

import data.dao.BookingDao;
import data.dao.CarDao;
import data.dao.Database;
import model.BookingRequest;
import model.ContactMessage;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet quản trị showroom - Quản lý trạng thái xác nhận và trả lời tư vấn khách hàng
 * @author Phu
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/admin", "/admin/bookings"})
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Kiểm tra quyền nội bộ: Ngăn chặn gõ trực tiếp link admin, đẩy về trang chủ showroom nếu chưa đăng nhập
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        CarDao carDao = Database.getCarDao();
        BookingDao bookingDao = Database.getBookingDao();

        List<BookingRequest> bookings = bookingDao.findAllBookings();
        List<ContactMessage> contacts = bookingDao.findAllContacts();

        // Thống kê trạng thái
        long pendingBookings = bookings.stream().filter(b -> "Chờ xác nhận".equalsIgnoreCase(b.getStatus())).count();
        long confirmedBookings = bookings.stream().filter(b -> "Đã xác nhận".equalsIgnoreCase(b.getStatus())).count();
        long pendingContacts = contacts.stream().filter(c -> "Chưa phản hồi".equalsIgnoreCase(c.getStatus())).count();

        request.setAttribute("bookings", bookings);
        request.setAttribute("contacts", contacts);
        request.setAttribute("totalCars", carDao.findAll().size());
        request.setAttribute("totalBookings", bookings.size());
        request.setAttribute("pendingBookings", pendingBookings);
        request.setAttribute("confirmedBookings", confirmedBookings);
        request.setAttribute("totalContacts", contacts.size());
        request.setAttribute("pendingContacts", pendingContacts);

        // Flash Toast message
        if (session.getAttribute("toastMessage") != null) {
            request.setAttribute("toastMessage", session.getAttribute("toastMessage"));
            request.setAttribute("toastType", session.getAttribute("toastType"));
            session.removeAttribute("toastMessage");
            session.removeAttribute("toastType");
        }

        request.getRequestDispatcher("/views/admin/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        BookingDao bookingDao = Database.getBookingDao();

        if ("updateStatus".equalsIgnoreCase(action)) {
            // Xử lý đổi trạng thái lái thử: Chờ xác nhận -> Đã xác nhận -> Hoàn tất -> Đã hủy
            String bookingIdStr = request.getParameter("bookingId");
            String newStatus = request.getParameter("newStatus");
            try {
                int bookingId = Integer.parseInt(bookingIdStr);
                bookingDao.updateBookingStatus(bookingId, newStatus);
                session.setAttribute("toastMessage", "Đã cập nhật đơn lái thử #" + bookingId + " sang trạng thái: " + newStatus);
                session.setAttribute("toastType", "success");
            } catch (Exception e) {
                session.setAttribute("toastMessage", "Lỗi cập nhật trạng thái!");
                session.setAttribute("toastType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/admin");
            return;
        } else if ("replyContact".equalsIgnoreCase(action)) {
            // Xử lý gửi câu trả lời tư vấn cho khách hàng
            String contactIdStr = request.getParameter("contactId");
            String replyMessage = request.getParameter("replyMessage");
            String staffName = (String) session.getAttribute("adminUser");
            if (staffName == null || staffName.trim().isEmpty()) {
                staffName = "Chuyên viên tư vấn AutoLux";
            }

            try {
                if (contactIdStr != null && !contactIdStr.trim().isEmpty()) {
                    int contactId = Integer.parseInt(contactIdStr.trim());
                    String trimmedMsg = (replyMessage != null) ? replyMessage.trim() : "";
                    if (!trimmedMsg.isEmpty()) {
                        bookingDao.replyContact(contactId, trimmedMsg, staffName);
                        session.setAttribute("toastMessage", "Đã lưu và gửi phản hồi tư vấn cho yêu cầu #" + contactId + "!");
                        session.setAttribute("toastType", "success");
                    } else {
                        session.setAttribute("toastMessage", "Vui lòng nhập nội dung tư vấn trước khi gửi!");
                        session.setAttribute("toastType", "warning");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("toastMessage", "Lỗi gửi phản hồi tư vấn: " + e.getMessage());
                session.setAttribute("toastType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/admin#contactsTable");
            return;
        }

        doGet(request, response);
    }
}
