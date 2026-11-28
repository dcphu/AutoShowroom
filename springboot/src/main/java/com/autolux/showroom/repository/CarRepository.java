package com.autolux.showroom.repository;

import com.autolux.showroom.entity.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarRepository extends JpaRepository<Car, Integer>, JpaSpecificationExecutor<Car> {

    List<Car> findByIsFeaturedTrueOrderByIdAsc();

    List<Car> findByCategoryIgnoreCase(String category);

    @Query("SELECT DISTINCT c.brand FROM Car c WHERE c.brand IS NOT NULL AND TRIM(c.brand) != '' ORDER BY c.brand ASC")
    List<String> findDistinctBrands();
}
