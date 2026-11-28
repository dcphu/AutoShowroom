package com.autolux.showroom.repository;

import com.autolux.showroom.entity.ContactMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactRepository extends JpaRepository<ContactMessage, Integer> {
    List<ContactMessage> findAllByOrderByCreatedAtDesc();
    List<ContactMessage> findByStatus(String status);
    long countByStatus(String status);
}
