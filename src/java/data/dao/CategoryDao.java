package data.dao;

import model.Category;
import java.util.List;

/**
 * Interface CategoryDao định nghĩa các thao tác dữ liệu với bảng danh mục xe
 * @author Phu
 */
public interface CategoryDao {

    public List<Category> finAll();

    public List<Category> findAll();

    public void insert(String name);

    public void delete(int id);

    public void update(int id, String newName);

    public Category find(int id);

    public Category findBySlug(String slug);
}

