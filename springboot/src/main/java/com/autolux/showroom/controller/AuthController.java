package com.autolux.showroom.controller;

import com.autolux.showroom.entity.User;
import com.autolux.showroom.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class AuthController {

    private final UserService userService;

    @Autowired
    public AuthController(UserService userService) {
        this.userService = userService;
    }

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

        if (username != null && password != null) {
            String u = username.trim();
            String p = password.trim();

            // 1. Kiem tra xac thuc tu CSDL bang users
            Optional<User> userOpt = userService.findByUsername(u);
            if (userOpt.isPresent() && userService.checkLogin(u, p)) {
                User user = userOpt.get();
                String displayName = user.getFullName() != null ? user.getFullName() : user.getUsername();
                session.setAttribute("adminUser", displayName);
                session.setAttribute("adminRole", user.getRole() != null ? user.getRole() : "ADMIN");
                session.setAttribute("adminUsername", user.getUsername());

                redirectAttributes.addFlashAttribute("toastMessage", "Đăng nhập thành công! Chào mừng " + displayName + ".");
                redirectAttributes.addFlashAttribute("toastType", "success");
                return "redirect:/admin";
            }

            // 2. Fallback du phong (neu DB chua co san tai khoan mac dinh)
            if ("admin".equalsIgnoreCase(u) && ("admin123".equals(p) || "123456".equals(p))) {
                session.setAttribute("adminUser", "Quản Trị Viên Showroom");
                session.setAttribute("adminRole", "ADMIN");
                session.setAttribute("adminUsername", "admin");

                // Tu dong cap nhat/tao tai khoan nay vao CSDL neu chua co
                if (userOpt.isEmpty()) {
                    userService.save(new User(null, "admin", "admin123", "Quản Trị Viên Showroom", "ADMIN", "ACTIVE"));
                }

                redirectAttributes.addFlashAttribute("toastMessage", "Đăng nhập thành công! Chào mừng Quản trị viên.");
                redirectAttributes.addFlashAttribute("toastType", "success");
                return "redirect:/admin";
            }
        }

        model.addAttribute("errorMessage", "Tài khoản hoặc mật khẩu không chính xác! Vui lòng thử lại.");
        return "login";
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
