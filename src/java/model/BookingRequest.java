package model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BookingRequest implements Serializable {
    private int id;
    private String fullName;
    private String phone;
    private String email;
    private int carId;
    private String carName;
    private String bookingDate;
    private String bookingTime;
    private String locationType; // "showroom" | "home"
    private String notes;
    private String createdAt;
    private String status;

    public BookingRequest() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        this.createdAt = LocalDateTime.now().format(dtf);
        this.status = "Chờ xác nhận";
        this.locationType = "showroom";
    }

    public BookingRequest(int id, String fullName, String phone, String email, int carId,
                          String carName, String bookingDate, String bookingTime,
                          String locationType, String notes) {
        this();
        this.id = id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.carId = carId;
        this.carName = carName;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.locationType = locationType != null ? locationType : "showroom";
        this.notes = notes;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }
    public String getCarName() { return carName; }
    public void setCarName(String carName) { this.carName = carName; }
    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }
    public String getBookingTime() { return bookingTime; }
    public void setBookingTime(String bookingTime) { this.bookingTime = bookingTime; }
    public String getLocationType() { return locationType; }
    public void setLocationType(String locationType) { this.locationType = locationType; }
    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}

