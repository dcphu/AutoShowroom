<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Top Announcement Bar (Sáng & Tinh tế) -->
<div class="top-bar-light py-2">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center small">
            <div class="d-flex align-items-center gap-3">
                <span><i class="fa-solid fa-location-dot text-warning me-1"></i> Hệ thống Showroom: Hà Nội • Đà Nẵng • TP. HCM</span>
                <span class="d-none d-md-inline text-muted">• Giờ mở cửa: 08:00 - 21:00 hàng ngày</span>
            </div>
            <div class="d-flex align-items-center gap-3">
                <a href="tel:1900888999" class="text-decoration-none text-dark fw-bold">
                    <i class="fa-solid fa-phone text-warning me-1"></i> Hotline CSKH: 1900 888 999
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Glassmorphism Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-luxury sticky-top">
    <div class="container">
        <a class="brand-logo" href="${pageContext.request.contextPath}/home" id="brandLogo" title="AutoLux Motors">
            <div class="brand-icon">
                <i class="fa-solid fa-shield-cat"></i>
            </div>
            <div>AUTOLUX <span class="highlight">MOTORS</span></div>
        </a>
        
        <button class="navbar-toggler border-secondary text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">
            <i class="fa-solid fa-bars"></i>
        </button>
        
        <div class="collapse navbar-collapse" id="navContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link nav-link-luxury active" href="${pageContext.request.contextPath}/home">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-luxury" href="${pageContext.request.contextPath}/home#collection">Bộ Sưu Tập Xe</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-luxury" href="${pageContext.request.contextPath}/home#features">Đặc Quyền</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-luxury" href="${pageContext.request.contextPath}/home#calculator">Tính Trả Góp</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-luxury" href="${pageContext.request.contextPath}/home#booking">Đăng Ký Lái Thử</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-luxury" href="${pageContext.request.contextPath}/home#contact">Liên Hệ</a>
                </li>
            </ul>
            
            <div class="d-flex align-items-center gap-3">
                <a href="${pageContext.request.contextPath}/home#booking" class="btn-gold">
                    <i class="fa-solid fa-key"></i> Đặt Lịch Lái Thử
                </a>
            </div>
        </div>
    </div>
</nav>

