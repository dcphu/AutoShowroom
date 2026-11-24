package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Filter bảo vệ phân hệ Quản trị (Admin)
 * Chặn đứng mọi truy cập trực tiếp bằng URL tới /admin hoặc /admin/* ở tầng máy chủ khi chưa đăng nhập.
 * Chuyển hướng ngay lập tức về trang chủ Showroom mà không để lộ bất kỳ thông tin nội bộ nào.
 * @author Phu
 */
@WebFilter(filterName = "AdminAuthFilter", urlPatterns = {"/admin", "/admin/*"})
public class AdminAuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter bảo mật phân hệ quản trị
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Thiết lập encoding UTF-8
        httpRequest.setCharacterEncoding("UTF-8");
        httpResponse.setCharacterEncoding("UTF-8");

        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("adminUser") != null);

        if (isLoggedIn) {
            // Quản trị viên đã đăng nhập hợp lệ -> Cho phép đi tiếp vào Servlet/JSP
            chain.doFilter(request, response);
        } else {
            // Chưa đăng nhập: Server chặn đứng ngay lập tức tại Filter, redirect về trang chủ /home
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên
    }
}
