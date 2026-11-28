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
public class SearchController {

    private final CarService carService;
    private final CategoryService categoryService;

    @Autowired
    public SearchController(CarService carService, CategoryService categoryService) {
        this.carService = carService;
        this.categoryService = categoryService;
    }

    @GetMapping({"/search", "/filter"})
    public String search(@RequestParam(required = false, defaultValue = "all") String category,
                         @RequestParam(required = false, defaultValue = "all") String brand,
                         @RequestParam(required = false, defaultValue = "") String keyword,
                         @RequestParam(required = false, defaultValue = "all") String priceRange,
                         Model model) {

        List<Category> categories = categoryService.findAll();
        List<Car> filteredCars = carService.filter(category, brand, keyword, priceRange);
        List<Car> allCars = carService.findAll();
        List<Car> featuredCars = carService.findFeatured();
        List<String> brands = carService.getBrands();

        model.addAttribute("categories", categories);
        model.addAttribute("lstCategory", categories);
        model.addAttribute("cars", filteredCars);
        model.addAttribute("allCars", allCars);
        model.addAttribute("featuredCars", featuredCars);
        model.addAttribute("brands", brands);
        model.addAttribute("selectedCategory", category != null ? category : "all");
        model.addAttribute("selectedBrand", brand != null ? brand : "all");
        model.addAttribute("selectedPriceRange", priceRange != null ? priceRange : "all");
        model.addAttribute("keyword", keyword != null ? keyword : "");

        return "home";
    }
}
