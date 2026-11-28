package com.autolux.showroom.controller;

import com.autolux.showroom.entity.Car;
import com.autolux.showroom.entity.Category;
import com.autolux.showroom.service.CarService;
import com.autolux.showroom.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class CarDetailController {

    private final CarService carService;
    private final CategoryService categoryService;

    @Autowired
    public CarDetailController(CarService carService, CategoryService categoryService) {
        this.carService = carService;
        this.categoryService = categoryService;
    }

    @GetMapping({"/car-detail", "/detail", "/detail/{id}"})
    public String detail(@RequestParam(required = false) Integer id,
                         @PathVariable(required = false) Integer pathId,
                         Model model) {

        Integer carId = id != null ? id : pathId;
        Car car = null;

        if (carId != null) {
            Optional<Car> opt = carService.findById(carId);
            if (opt.isPresent()) {
                car = opt.get();
            }
        }

        // Fallback to first car if not found
        if (car == null) {
            List<Car> all = carService.findAll();
            if (!all.isEmpty()) {
                car = all.get(0);
            }
        }

        List<Car> relatedCars = carService.findAll();
        List<Category> categories = categoryService.findAll();

        model.addAttribute("car", car);
        model.addAttribute("relatedCars", relatedCars);
        model.addAttribute("categories", categories);
        model.addAttribute("allCars", relatedCars);

        return "detail";
    }
}
