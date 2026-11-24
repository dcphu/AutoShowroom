package data.dao;

import model.Car;
import java.util.List;

/**
 * Interface CarDao quản lý dữ liệu xe trong showroom
 * @author Phu
 */
public interface CarDao {

    public List<Car> findAll();

    public List<Car> findFeatured();

    public Car find(int id);

    public List<Car> filter(String category, String brand, String keyword, String priceRange);

    public List<String> getBrands();
}

