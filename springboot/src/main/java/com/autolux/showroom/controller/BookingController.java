package com.autolux.showroom.controller;

import com.autolux.showroom.service.BookingService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
public class BookingController {

    private final BookingService bookingService;

    @Autowired
    public BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping("/booking")
    public String bookingGet() {
        return "redirect:/home#booking";
    }

    @PostMapping("/booking")
    public Object handleBooking(@RequestParam(required = false) String fullName,
                                @RequestParam(required = false) String phone,
                                @RequestParam(required = false) String email,
                                @RequestParam(required = false) String carId,
                                @RequestParam(required = false) String bookingDate,
                                @RequestParam(required = false) String bookingTime,
                                @RequestParam(required = false) String locationType,
                                @RequestParam(required = false) String notes,
                                @RequestParam(required = false) String ajax,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes) {

        boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))
                || "true".equalsIgnoreCase(ajax);

        // Validation: Required fields
        if (fullName == null || fullName.trim().isEmpty() || phone == null || phone.trim().isEmpty()) {
            String errorMsg = "Vui lòng nhập họ tên và số điện thoại!";
            if (isAjax) {
                Map<String, String> res = new HashMap<>();
                res.put("status", "error");
                res.put("message", errorMsg);
                return ResponseEntity.badRequest().body(res);
            }
            redirectAttributes.addFlashAttribute("toastMessage", errorMsg);
            redirectAttributes.addFlashAttribute("toastType", "danger");
            return "redirect:/home#booking";
        }

        // Phone Validation (Vietnam 10 digits starting with 0)
        String cleanPhone = phone.trim().replaceAll("\\s+", "");
        if (!cleanPhone.matches("^0[0-9]{9}$")) {
            String errorMsg = "Số điện thoại không hợp lệ! Vui lòng nhập đúng 10 số bắt đầu bằng số 0 (Ví dụ: 0905123456).";
            if (isAjax) {
                Map<String, String> res = new HashMap<>();
                res.put("status", "error");
                res.put("message", errorMsg);
                return ResponseEntity.badRequest().body(res);
            }
            redirectAttributes.addFlashAttribute("toastMessage", errorMsg);
            redirectAttributes.addFlashAttribute("toastType", "danger");
            return "redirect:/home#booking";
        }

        // Email Validation
        String cleanEmail = (email != null) ? email.trim() : "";
        if (!cleanEmail.isEmpty() && !cleanEmail.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            String errorMsg = "Email không hợp lệ! Email phải chứa ký tự '@' và đuôi tên miền hợp lệ (Ví dụ: example@gmail.com).";
            if (isAjax) {
                Map<String, String> res = new HashMap<>();
                res.put("status", "error");
                res.put("message", errorMsg);
                return ResponseEntity.badRequest().body(res);
            }
            redirectAttributes.addFlashAttribute("toastMessage", errorMsg);
            redirectAttributes.addFlashAttribute("toastType", "danger");
            return "redirect:/home#booking";
        }

        Integer parsedCarId = null;
        try {
            if (carId != null && !carId.trim().isEmpty()) {
                parsedCarId = Integer.parseInt(carId.trim());
            }
        } catch (NumberFormatException ignored) {}

        bookingService.createBooking(
                fullName.trim(),
                cleanPhone,
                cleanEmail,
                parsedCarId,
                locationType != null ? locationType : "Showroom Keangnam",
                bookingDate != null ? bookingDate : "",
                bookingTime != null ? bookingTime : "",
                "B2",
                notes != null ? notes.trim() : ""
        );

        String successMsg = "Đặt lịch lái thử thành công! Chuyên viên AutoLux sẽ liên hệ xác nhận trong 15 phút.";
        if (isAjax) {
            Map<String, String> res = new HashMap<>();
            res.put("status", "success");
            res.put("message", successMsg);
            return ResponseEntity.ok(res);
        }

        redirectAttributes.addFlashAttribute("toastMessage", successMsg);
        redirectAttributes.addFlashAttribute("toastType", "success");
        return "redirect:/home#booking";
    }
}
