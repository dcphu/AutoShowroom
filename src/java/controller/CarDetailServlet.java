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
 * Servlet hiển thị trang chi tiết xe ô tô (URL: /car-detail?id=1 hoặc /detail?id=1)
 * @author Phu
 */
@WebServlet(name = "CarDetailServlet", urlPatterns = {"/car-detail", "/detail"})
public class CarDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        CarDao carDao = Database.getCarDao();
        CategoryDao categoryDao = Database.getCategoryDao();

        Car car = null;
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int carId = Integer.parseInt(idStr.trim());
                car = carDao.find(carId);
            } catch (NumberFormatException e) {
                car = null;
            }
        }

        // Nếu không truyền ID hoặc không tìm thấy, lấy xe đầu tiên mặc định
        if (car == null) {
            List<Car> allCars = carDao.findAll();
            if (!allCars.isEmpty()) {
                car = allCars.get(0);
            }
        }

        // Lấy các xe liên quan cùng danh mục hoặc cùng thương hiệu
        List<Car> relatedCars = carDao.findAll();
        List<Category> categories = categoryDao.findAll();

        request.setAttribute("car", car);
        request.setAttribute("relatedCars", relatedCars);
        request.setAttribute("categories", categories);
        request.setAttribute("allCars", relatedCars);

        request.getRequestDispatcher("/views/detail.jsp").forward(request, response);
    }
}

