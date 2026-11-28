package com.autolux.showroom.service;

import com.autolux.showroom.entity.BookingRequest;
import com.autolux.showroom.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;
    private final CarService carService;

    @Autowired
    public BookingService(BookingRepository bookingRepository, CarService carService) {
        this.bookingRepository = bookingRepository;
        this.carService = carService;
    }

    public List<BookingRequest> findAll() {
        List<BookingRequest> list = bookingRepository.findAllByOrderByCreatedAtDesc();
        // Populate carName for convenience
        list.forEach(this::populateCarName);
        return list;
    }

    public Optional<BookingRequest> findById(Integer id) {
        Optional<BookingRequest> b = bookingRepository.findById(id);
        b.ifPresent(this::populateCarName);
        return b;
    }

    private void populateCarName(BookingRequest b) {
        if (b.getCarId() != null && b.getCarId() > 0) {
            carService.findById(b.getCarId()).ifPresent(car -> b.setCarName(car.getName()));
        }
    }

    public BookingRequest createBooking(String customerName, String phone, String email, Integer carId,
                                        String showroomLocation, String bookingDate, String timeSlot,
                                        String driverLicense, String notes) {
        BookingRequest booking = new BookingRequest(
                null, customerName, phone, email, carId,
                showroomLocation, bookingDate, timeSlot, driverLicense, notes
        );
        booking.setCreatedAt(LocalDateTime.now());
        booking.setStatus("Chờ xác nhận");
        return bookingRepository.save(booking);
    }

    public BookingRequest updateStatus(Integer id, String newStatus) {
        Optional<BookingRequest> opt = bookingRepository.findById(id);
        if (opt.isPresent()) {
            BookingRequest b = opt.get();
            b.setStatus(newStatus);
            return bookingRepository.save(b);
        }
        return null;
    }

    public long count() {
        return bookingRepository.count();
    }

    public long countPending() {
        return bookingRepository.findByStatus("Chờ xác nhận").size();
    }

    public long countConfirmed() {
        return bookingRepository.findByStatus("Đã xác nhận").size();
    }

    public BookingRequest save(BookingRequest b) {
        return bookingRepository.save(b);
    }
}
