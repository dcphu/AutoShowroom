package controller;

import data.utils.Constants;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet xử lý đăng nhập khu vực quản trị nội bộ dành riêng cho nhân viên showroom
 * @author Phu
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        // Nếu nhân viên đã đăng nhập trước đó thì chuyển thẳng vào trang Admin
        if (session != null && session.getAttribute("adminUser") != null) {
            response.sendRedirect(request.getContextPath() + "/admin");
            return;
        }

        request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra tài khoản nội bộ showroom (Hỗ trợ cấu hình qua Constants / Biến môi trường hoặc mật khẩu mặc định)
        boolean isValidAdmin = username != null && password != null
                && Constants.ADMIN_USER.equalsIgnoreCase(username.trim())
                && (Constants.ADMIN_PASS.equals(password.trim()) || "admin123".equals(password.trim()) || "123456".equals(password.trim()));

        if (isValidAdmin) {
            HttpSession session = request.getSession(true);
            session.setAttribute("adminUser", "Quản Trị Viên Showroom");
            session.setAttribute("adminRole", "Administrator");
            session.setAttribute("toastMessage", "Đăng nhập thành công! Chào mừng Quản trị viên.");
            session.setAttribute("toastType", "success");
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            request.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu không chính xác! Vui lòng thử lại.");
            request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
        }
    }
}

