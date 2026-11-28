package com.autolux.showroom.repository;

import com.autolux.showroom.entity.BookingRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<BookingRequest, Integer> {
    List<BookingRequest> findAllByOrderByCreatedAtDesc();
    List<BookingRequest> findByStatus(String status);
    long countByStatus(String status);
}
