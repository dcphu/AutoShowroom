package com.autolux.showroom.controller;

import com.autolux.showroom.entity.Car;
import com.autolux.showroom.entity.Category;
import com.autolux.showroom.service.CarService;
import com.autolux.showroom.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class ApiCarController {

    private final CarService carService;
    private final CategoryService categoryService;

    @Autowired
    public ApiCarController(CarService carService, CategoryService categoryService) {
        this.carService = carService;
        this.categoryService = categoryService;
    }

    @GetMapping("/cars")
    public List<Car> getAllCars(@RequestParam(required = false) String category,
                                @RequestParam(required = false) String brand,
                                @RequestParam(required = false) String keyword,
                                @RequestParam(required = false) String priceRange) {
        if (category != null || brand != null || keyword != null || priceRange != null) {
            return carService.filter(category, brand, keyword, priceRange);
        }
        return carService.findAll();
    }

    @GetMapping("/cars/{id}")
    public ResponseEntity<Car> getCarById(@PathVariable Integer id) {
        return carService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/featured")
    public List<Car> getFeaturedCars() {
        return carService.findFeatured();
    }

    @GetMapping("/categories")
    public List<Category> getCategories() {
        return categoryService.findAll();
    }

    @GetMapping("/brands")
    public List<String> getBrands() {
        return carService.getBrands();
    }
}
