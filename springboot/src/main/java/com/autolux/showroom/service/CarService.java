package com.autolux.showroom.service;

import com.autolux.showroom.entity.Car;
import com.autolux.showroom.repository.CarRepository;
import jakarta.persistence.criteria.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CarService {

    private final CarRepository carRepository;

    @Autowired
    public CarService(CarRepository carRepository) {
        this.carRepository = carRepository;
    }

    public List<Car> findAll() {
        return carRepository.findAll();
    }

    public List<Car> findFeatured() {
        return carRepository.findByIsFeaturedTrueOrderByIdAsc();
    }

    public Optional<Car> findById(Integer id) {
        return carRepository.findById(id);
    }

    public List<String> getBrands() {
        return carRepository.findDistinctBrands();
    }

    public List<Car> filter(String category, String brand, String keyword, String priceRange) {
        Specification<Car> spec = (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (category != null && !category.trim().isEmpty() && !"all".equalsIgnoreCase(category)) {
                String catLower = category.trim().toLowerCase();
                Predicate exactCategory = cb.equal(cb.lower(root.get("category")), catLower);
                Predicate likeCategory = cb.like(cb.lower(root.get("category")), "%" + catLower + "%");
                predicates.add(cb.or(exactCategory, likeCategory));
            }

            if (brand != null && !brand.trim().isEmpty() && !"all".equalsIgnoreCase(brand)) {
                String brandLower = brand.trim().toLowerCase();
                Predicate exactBrand = cb.equal(cb.lower(root.get("brand")), brandLower);
                Predicate likeBrand = cb.like(cb.lower(root.get("brand")), "%" + brandLower + "%");
                predicates.add(cb.or(exactBrand, likeBrand));
            }

            if (keyword != null && !keyword.trim().isEmpty()) {
                String kw = "%" + keyword.trim().toLowerCase() + "%";
                Predicate nameMatch = cb.like(cb.lower(root.get("name")), kw);
                Predicate brandMatch = cb.like(cb.lower(root.get("brand")), kw);
                Predicate descMatch = cb.like(cb.lower(root.get("description")), kw);
                predicates.add(cb.or(nameMatch, brandMatch, descMatch));
            }

            if (priceRange != null && !priceRange.trim().isEmpty() && !"all".equalsIgnoreCase(priceRange)) {
                switch (priceRange.toLowerCase()) {
                    case "under5":
                        predicates.add(cb.lessThan(root.get("price"), 5_000_000_000L));
                        break;
                    case "5to10":
                        predicates.add(cb.between(root.get("price"), 5_000_000_000L, 10_000_000_000L));
                        break;
                    case "10to20":
                        predicates.add(cb.between(root.get("price"), 10_000_000_000L, 20_000_000_000L));
                        break;
                    case "above20":
                        predicates.add(cb.greaterThan(root.get("price"), 20_000_000_000L));
                        break;
                }
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };

        return carRepository.findAll(spec);
    }

    public Car save(Car car) {
        return carRepository.save(car);
    }

    public void delete(Integer id) {
        carRepository.deleteById(id);
    }

    public long count() {
        return carRepository.count();
    }
}
