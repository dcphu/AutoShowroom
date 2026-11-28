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

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class CarDetailController {

    private final CarService carService;
    private final CategoryService categoryService;

    @Autowired
    public CarDetailController(CarService carService, CategoryService categoryService) {
        this.carService = carService;
        this.categoryService = categoryService;
    }

    @GetMapping({"/car-detail", "/detail"})
    public String detailParam(@RequestParam(required = false) Integer id, Model model) {
        return loadDetail(id, model);
    }

    @GetMapping("/detail/{id}")
    public String detailPath(@PathVariable("id") Integer id, Model model) {
        return loadDetail(id, model);
    }

    private String loadDetail(Integer id, Model model) {
        Car car = null;

        if (id != null) {
            Optional<Car> opt = carService.findById(id);
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

        List<Car> relatedCars = new ArrayList<>();
        if (car != null) {
            final Integer currentId = car.getId();
            List<Car> categoryCars = carService.filter(car.getCategory(), null, null, null);
            for (Car c : categoryCars) {
                if (!c.getId().equals(currentId) && relatedCars.size() < 3) {
                    relatedCars.add(c);
                }
            }
            if (relatedCars.size() < 3) {
                for (Car c : carService.findAll()) {
                    if (!c.getId().equals(currentId) && !relatedCars.contains(c) && relatedCars.size() < 3) {
                        relatedCars.add(c);
                    }
                }
            }
        }

        List<Category> categories = categoryService.findAll();

        model.addAttribute("car", car);
        model.addAttribute("relatedCars", relatedCars);
        model.addAttribute("categories", categories);
        model.addAttribute("allCars", carService.findAll());

        return "detail";
    }
}
