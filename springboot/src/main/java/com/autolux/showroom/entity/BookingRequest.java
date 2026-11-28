package com.autolux.showroom.entity;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "bookings")
public class BookingRequest implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "customer_name", nullable = false)
    private String customerName;

    @Column(nullable = false, length = 50)
    private String phone;

    @Column(length = 150)
    private String email;

    @Column(name = "car_id")
    private Integer carId;

    @Transient
    private String carName;

    @Column(name = "showroom_location", nullable = false, length = 150)
    private String showroomLocation;

    @Column(name = "booking_date")
    private String bookingDate;

    @Column(name = "time_slot", length = 50)
    private String timeSlot;

    @Column(name = "driver_license", length = 100)
    private String driverLicense;

    @Column(length = 50)
    private String status = "Chờ xác nhận";

    @Column(columnDefinition = "TEXT")
    private String notes;

    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    public BookingRequest() {
    }

    public BookingRequest(Integer id, String customerName, String phone, String email, Integer carId,
                          String showroomLocation, String bookingDate, String timeSlot,
                          String driverLicense, String notes) {
        this.id = id;
        this.customerName = customerName;
        this.phone = phone;
        this.email = email;
        this.carId = carId;
        this.showroomLocation = showroomLocation;
        this.bookingDate = bookingDate;
        this.timeSlot = timeSlot;
        this.driverLicense = driverLicense;
        this.notes = notes;
        this.status = "Chờ xác nhận";
        this.createdAt = LocalDateTime.now();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getShowroomLocation() {
        return showroomLocation;
    }

    public void setShowroomLocation(String showroomLocation) {
        this.showroomLocation = showroomLocation;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public String getDriverLicense() {
        return driverLicense;
    }

    public void setDriverLicense(String driverLicense) {
        this.driverLicense = driverLicense;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
