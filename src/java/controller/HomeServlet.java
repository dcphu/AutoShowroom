package controller;

import data.dao.CarDao;
import data.dao.CategoryDao;
import data.dao.Database;
import model.Car;
import model.Category;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Controller chính xử lý luồng hiển thị Landing Page bán xe
 * @author Phu
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"", "/home", "/index"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String category = request.getParameter("category");
        String brand = request.getParameter("brand");
        String keyword = request.getParameter("keyword");
        String priceRange = request.getParameter("priceRange");

        // Nếu có tham số tìm kiếm/lọc gửi tới /home, chuyển tiếp sang SearchServlet xử lý
        if ((category != null && !category.isEmpty() && !"all".equalsIgnoreCase(category))
                || (brand != null && !brand.isEmpty() && !"all".equalsIgnoreCase(brand))
                || (keyword != null && !keyword.trim().isEmpty())
                || (priceRange != null && !priceRange.isEmpty() && !"all".equalsIgnoreCase(priceRange))) {
            request.getRequestDispatcher("/search").forward(request, response);
            return;
        }

        CategoryDao categoryDao = Database.getCategoryDao();
        CarDao carDao = Database.getCarDao();

        List<Category> lstCategory = categoryDao.findAll();
        List<Car> allCars = carDao.findAll();
        List<Car> featuredCars = carDao.findFeatured();
        List<String> brands = carDao.getBrands();

        request.setAttribute("lstCategory", lstCategory);
        request.setAttribute("categories", lstCategory);
        request.setAttribute("cars", allCars);
        request.setAttribute("allCars", allCars);
        request.setAttribute("featuredCars", featuredCars);
        request.setAttribute("brands", brands);
        request.setAttribute("selectedCategory", "all");
        request.setAttribute("selectedBrand", "all");
        request.setAttribute("selectedPriceRange", "all");
        request.setAttribute("keyword", "");

        // Flash Toast message từ Session
        HttpSession session = request.getSession();
        if (session.getAttribute("toastMessage") != null) {
            request.setAttribute("toastMessage", session.getAttribute("toastMessage"));
            request.setAttribute("toastType", session.getAttribute("toastType"));
            session.removeAttribute("toastMessage");
            session.removeAttribute("toastType");
        }

        // Chuyển hướng hiển thị ra views/home.jsp theo cấu trúc yêu cầu
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
