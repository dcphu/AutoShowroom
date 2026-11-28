package com.autolux.showroom.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    private static final String DEFAULT_ADMIN_USER = "admin";
    private static final String DEFAULT_ADMIN_PASS = "admin123";

    @GetMapping("/login")
    public String loginPage(HttpSession session) {
        if (session != null && session.getAttribute("adminUser") != null) {
            return "redirect:/admin";
        }
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              HttpSession session,
                              Model model,
                              RedirectAttributes redirectAttributes) {

        boolean isValid = username != null && password != null
                && (DEFAULT_ADMIN_USER.equalsIgnoreCase(username.trim()))
                && (DEFAULT_ADMIN_PASS.equals(password.trim()) || "123456".equals(password.trim()));

        if (isValid) {
            session.setAttribute("adminUser", "Quản Trị Viên Showroom");
            session.setAttribute("adminRole", "Administrator");
            redirectAttributes.addFlashAttribute("toastMessage", "Đăng nhập thành công! Chào mừng Quản trị viên.");
            redirectAttributes.addFlashAttribute("toastType", "success");
            return "redirect:/admin";
        } else {
            model.addAttribute("errorMessage", "Tài khoản hoặc mật khẩu không chính xác! Vui lòng thử lại.");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        if (session != null) {
            session.invalidate();
        }
        redirectAttributes.addFlashAttribute("toastMessage", "Đã đăng xuất khỏi hệ thống quản trị.");
        redirectAttributes.addFlashAttribute("toastType", "warning");
        return "redirect:/home";
    }
}
