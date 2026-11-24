package controller;

import data.dao.BookingDao;
import data.dao.CarDao;
import data.dao.Database;
import model.BookingRequest;
import model.Car;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/home#booking");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String carIdStr = request.getParameter("carId");
        String bookingDate = request.getParameter("bookingDate");
        String bookingTime = request.getParameter("bookingTime");
        String locationType = request.getParameter("locationType");
        String notes = request.getParameter("notes");
        boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))
                || "true".equalsIgnoreCase(request.getParameter("ajax"));

        if (fullName == null || fullName.trim().isEmpty() || phone == null || phone.trim().isEmpty()) {
            if (isAjax) {
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"status\":\"error\",\"message\":\"Vui lòng nhập họ tên và số điện thoại!\"}");
                out.flush();
                return;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("toastMessage", "Vui lòng nhập họ tên và số điện thoại!");
                session.setAttribute("toastType", "danger");
                response.sendRedirect(request.getContextPath() + "/home#booking");
                return;
            }
        }

        // Kiểm tra số điện thoại: Phải đủ 10 số và bắt đầu bằng số 0
        String cleanPhone = phone.trim().replaceAll("\\s+", "");
        if (!cleanPhone.matches("^0[0-9]{9}$")) {
            String errorMsg = "Số điện thoại không hợp lệ! Vui lòng nhập đúng 10 số bắt đầu bằng số 0 (Ví dụ: 0905123456).";
            if (isAjax) {
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"status\":\"error\",\"message\":\"" + errorMsg + "\"}");
                out.flush();
                return;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("toastMessage", errorMsg);
                session.setAttribute("toastType", "danger");
                response.sendRedirect(request.getContextPath() + "/home#booking");
                return;
            }
        }

        // Kiểm tra email: Phải có @ và đuôi tên miền hợp lệ
        String cleanEmail = (email != null) ? email.trim() : "";
        if (!cleanEmail.isEmpty() && !cleanEmail.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            String errorMsg = "Email không hợp lệ! Email phải chứa ký tự '@' và đuôi tên miền hợp lệ (Ví dụ: example@gmail.com).";
            if (isAjax) {
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"status\":\"error\",\"message\":\"" + errorMsg + "\"}");
                out.flush();
                return;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("toastMessage", errorMsg);
                session.setAttribute("toastType", "danger");
                response.sendRedirect(request.getContextPath() + "/home#booking");
                return;
            }
        }

        int carId = 0;
        try {
            if (carIdStr != null && !carIdStr.trim().isEmpty()) {
                carId = Integer.parseInt(carIdStr.trim());
            }
        } catch (NumberFormatException e) {
            carId = 0;
        }

        CarDao carDao = Database.getCarDao();
        Car car = carDao.find(carId);
        String carName = (car != null) ? car.getName() : "Tư vấn chọn xe";

        BookingDao bookingDao = Database.getBookingDao();
        BookingRequest booking = bookingDao.addBooking(
            fullName.trim(),
            phone.trim(),
            email != null ? email.trim() : "",
            carId,
            carName,
            bookingDate != null ? bookingDate.trim() : "Hôm nay",
            bookingTime != null ? bookingTime.trim() : "Giờ hành chính",
            locationType != null ? locationType.trim() : "showroom",
            notes != null ? notes.trim() : ""
        );

        if (isAjax) {
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(String.format(
                "{\"status\":\"success\",\"message\":\"Đăng ký lái thử thành công! Chuyên viên AutoLux sẽ liên hệ anh/chị %s trong vòng 15 phút.\",\"bookingId\":%d}",
                booking.getFullName(), booking.getId()
            ));
            out.flush();
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("toastMessage", "Chúc mừng " + booking.getFullName() + "! Đã nhận lịch lái thử xe " + booking.getCarName() + ".");
            session.setAttribute("toastType", "success");
            response.sendRedirect(request.getContextPath() + "/home#booking");
        }
    }
}

