package com.autolux.showroom.controller;

import com.autolux.showroom.service.ContactService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ContactController {

    private final ContactService contactService;

    @Autowired
    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @GetMapping("/contact")
    public String contactGet() {
        return "redirect:/home#contact";
    }

    @PostMapping("/contact")
    @ResponseBody
    public Object handleContact(@RequestParam(required = false) String fullName,
                                @RequestParam(required = false) String phone,
                                @RequestParam(required = false) String email,
                                @RequestParam(required = false) String subject,
                                @RequestParam(required = false) String message,
                                @RequestParam(required = false) String ajax,
                                HttpServletRequest request,
                                RedirectAttributes redirectAttributes) {

        boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))
                || "true".equalsIgnoreCase(ajax);

        if (fullName == null || fullName.trim().isEmpty() || phone == null || phone.trim().isEmpty()) {
            String errorMsg = "Vui lòng điền họ tên và số điện thoại liên hệ!";
            if (isAjax) {
                Map<String, String> res = new HashMap<>();
                res.put("status", "error");
                res.put("message", errorMsg);
                return ResponseEntity.badRequest().body(res);
            }
            redirectAttributes.addFlashAttribute("toastMessage", errorMsg);
            redirectAttributes.addFlashAttribute("toastType", "danger");
            return "redirect:/home#contact";
        }

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
            return "redirect:/home#contact";
        }

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
            return "redirect:/home#contact";
        }

        contactService.createContact(
                fullName.trim(),
                cleanPhone,
                cleanEmail,
                subject != null && !subject.trim().isEmpty() ? subject.trim() : "Tư vấn mua xe",
                message != null ? message.trim() : ""
        );

        String successMsg = "Cảm ơn quý khách! Chúng tôi đã nhận được thông tin và sẽ phản hồi sớm nhất.";
        if (isAjax) {
            Map<String, String> res = new HashMap<>();
            res.put("status", "success");
            res.put("message", successMsg);
            return ResponseEntity.ok(res);
        }

        redirectAttributes.addFlashAttribute("toastMessage", successMsg);
        redirectAttributes.addFlashAttribute("toastType", "success");
        return "redirect:/home#contact";
    }
}
