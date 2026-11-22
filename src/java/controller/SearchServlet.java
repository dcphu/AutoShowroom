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

/**
 * Controller chuyên biệt xử lý tìm kiếm và lọc danh mục xe hơi
 * Nhận request từ /search hoặc /filter và hiển thị kết quả về views/home.jsp
 * @author Phu
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/search", "/filter"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        CategoryDao categoryDao = Database.getCategoryDao();
        CarDao carDao = Database.getCarDao();

        String category = request.getParameter("category");
        String brand = request.getParameter("brand");
        String keyword = request.getParameter("keyword");
        String priceRange = request.getParameter("priceRange");

        List<Category> lstCategory = categoryDao.findAll();
        List<Car> filteredCars = carDao.filter(category, brand, keyword, priceRange);
        List<Car> allCars = carDao.findAll();
        List<Car> featuredCars = carDao.findFeatured();
        List<String> brands = carDao.getBrands();

        request.setAttribute("lstCategory", lstCategory);
        request.setAttribute("categories", lstCategory);
        request.setAttribute("cars", filteredCars);
        request.setAttribute("allCars", allCars);
        request.setAttribute("featuredCars", featuredCars);
        request.setAttribute("brands", brands);
        request.setAttribute("selectedCategory", category != null ? category : "all");
        request.setAttribute("selectedBrand", brand != null ? brand : "all");
        request.setAttribute("selectedPriceRange", priceRange != null ? priceRange : "all");
        request.setAttribute("keyword", keyword != null ? keyword : "");

        // Hiển thị kết quả tìm kiếm ra giao diện home.jsp
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
