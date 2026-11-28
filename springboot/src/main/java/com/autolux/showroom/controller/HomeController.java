package com.autolux.showroom.controller;

import com.autolux.showroom.entity.Car;
import com.autolux.showroom.entity.Category;
import com.autolux.showroom.service.CarService;
import com.autolux.showroom.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {

    private final CarService carService;
    private final CategoryService categoryService;

    @Autowired
    public HomeController(CarService carService, CategoryService categoryService) {
        this.carService = carService;
        this.categoryService = categoryService;
    }

    @GetMapping({"", "/", "/home", "/index"})
    public String home(@RequestParam(required = false) String category,
                       @RequestParam(required = false) String brand,
                       @RequestParam(required = false) String keyword,
                       @RequestParam(required = false) String priceRange,
                       Model model) {

        // Forward to search if filtering parameters exist
        if ((category != null && !category.isEmpty() && !"all".equalsIgnoreCase(category))
                || (brand != null && !brand.isEmpty() && !"all".equalsIgnoreCase(brand))
                || (keyword != null && !keyword.trim().isEmpty())
                || (priceRange != null && !priceRange.isEmpty() && !"all".equalsIgnoreCase(priceRange))) {
            return "forward:/search";
        }

        List<Category> categories = categoryService.findAll();
        List<Car> allCars = carService.findAll();
        List<Car> featuredCars = carService.findFeatured();
        List<String> brands = carService.getBrands();

        model.addAttribute("categories", categories);
        model.addAttribute("lstCategory", categories);
        model.addAttribute("cars", allCars);
        model.addAttribute("allCars", allCars);
        model.addAttribute("featuredCars", featuredCars);
        model.addAttribute("brands", brands);
        model.addAttribute("selectedCategory", "all");
        model.addAttribute("selectedBrand", "all");
        model.addAttribute("selectedPriceRange", "all");
        model.addAttribute("keyword", "");

        return "home";
    }
}
