package com.autolux.showroom.controller;

import com.autolux.showroom.entity.BookingRequest;
import com.autolux.showroom.entity.ContactMessage;
import com.autolux.showroom.service.BookingService;
import com.autolux.showroom.service.CarService;
import com.autolux.showroom.service.ContactService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class AdminController {

    private final CarService carService;
    private final BookingService bookingService;
    private final ContactService contactService;

    @Autowired
    public AdminController(CarService carService, BookingService bookingService, ContactService contactService) {
        this.carService = carService;
        this.bookingService = bookingService;
        this.contactService = contactService;
    }

    @GetMapping({"/admin", "/admin/bookings"})
    public String adminDashboard(HttpSession session, Model model) {
        if (session == null || session.getAttribute("adminUser") == null) {
            return "redirect:/login";
        }

        List<BookingRequest> bookings = bookingService.findAll();
        List<ContactMessage> contacts = contactService.findAll();

        model.addAttribute("bookings", bookings);
        model.addAttribute("contacts", contacts);
        model.addAttribute("totalCars", carService.count());
        model.addAttribute("totalBookings", bookings.size());
        model.addAttribute("pendingBookings", bookingService.countPending());
        model.addAttribute("confirmedBookings", bookingService.countConfirmed());
        model.addAttribute("totalContacts", contacts.size());
        model.addAttribute("pendingContacts", contactService.countPending());

        return "admin";
    }

    @PostMapping("/admin/update-status")
    public String updateBookingStatus(@RequestParam Integer bookingId,
                                      @RequestParam String newStatus,
                                      HttpSession session,
                                      RedirectAttributes redirectAttributes) {
        if (session == null || session.getAttribute("adminUser") == null) {
            return "redirect:/login";
        }

        try {
            bookingService.updateStatus(bookingId, newStatus);
            redirectAttributes.addFlashAttribute("toastMessage", "Đã cập nhật đơn lái thử #" + bookingId + " sang: " + newStatus);
            redirectAttributes.addFlashAttribute("toastType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("toastMessage", "Lỗi cập nhật trạng thái!");
            redirectAttributes.addFlashAttribute("toastType", "danger");
        }

        return "redirect:/admin";
    }

    @PostMapping("/admin/reply-contact")
    public String replyContact(@RequestParam Integer contactId,
                               @RequestParam String replyMessage,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        if (session == null || session.getAttribute("adminUser") == null) {
            return "redirect:/login";
        }

        try {
            contactService.reply(contactId, replyMessage);
            redirectAttributes.addFlashAttribute("toastMessage", "Đã gửi phản hồi thành công tới khách hàng #" + contactId);
            redirectAttributes.addFlashAttribute("toastType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("toastMessage", "Lỗi gửi phản hồi tư vấn!");
            redirectAttributes.addFlashAttribute("toastType", "danger");
        }

        return "redirect:/admin";
    }
}
