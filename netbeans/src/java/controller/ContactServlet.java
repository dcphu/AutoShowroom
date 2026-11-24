package controller;

import data.dao.BookingDao;
import data.dao.Database;
import model.ContactMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/home#contact");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))
                || "true".equalsIgnoreCase(request.getParameter("ajax"));

        if (fullName == null || fullName.trim().isEmpty() || phone == null || phone.trim().isEmpty()) {
            if (isAjax) {
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"status\":\"error\",\"message\":\"Vui lòng điền họ tên và số điện thoại liên hệ!\"}");
                out.flush();
                return;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("toastMessage", "Vui lòng điền họ tên và số điện thoại liên hệ!");
                session.setAttribute("toastType", "danger");
                response.sendRedirect(request.getContextPath() + "/home#contact");
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
                response.sendRedirect(request.getContextPath() + "/home#contact");
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
                response.sendRedirect(request.getContextPath() + "/home#contact");
                return;
            }
        }

        BookingDao bookingDao = Database.getBookingDao();
        ContactMessage msg = bookingDao.addContact(
            fullName.trim(),
            cleanPhone,
            cleanEmail,
            subject != null ? subject.trim() : "Tư vấn mua xe",
            message != null ? message.trim() : ""
        );

        if (isAjax) {
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(String.format(
                "{\"status\":\"success\",\"message\":\"Cảm ơn %s! Chúng tôi đã nhận được thông điệp và sẽ phản hồi sớm nhất.\",\"contactId\":%d}",
                msg.getFullName(), msg.getId()
            ));
            out.flush();
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("toastMessage", "Cảm ơn " + msg.getFullName() + "! Thông điệp của bạn đã được gửi thành công.");
            session.setAttribute("toastType", "success");
            response.sendRedirect(request.getContextPath() + "/home#contact");
        }
    }
}

