<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập Quản Trị | AutoLux Motors Staff Portal</title>
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Custom Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <!-- Include Header từ Showroom -->
    <jsp:include page="header.jsp" />

    <main class="flex-grow-1 d-flex align-items-center justify-content-center py-5" style="background: radial-gradient(circle at 50% 30%, rgba(217, 119, 6, 0.06) 0%, transparent 60%), #f8fafc;">
        <div class="admin-login-card shadow-sm border" style="background: #ffffff; border-radius: 18px; max-width: 440px; width: 100%; padding: 40px;">
            <!-- Logo & Header -->
            <div class="text-center mb-4">
                <div class="brand-icon mx-auto mb-3" style="width: 50px; height: 50px; font-size: 1.35rem;">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>
                <span class="admin-login-badge mb-2">
                    <i class="fa-solid fa-lock me-1"></i> Cổng Nội Bộ Showroom
                </span>
                <h3 class="text-dark fw-bold mt-2 mb-1">Đăng Nhập Quản Trị</h3>
                <p class="text-muted small mb-0">Hệ thống xử lý khách hàng AutoLux Motors</p>
            </div>

            <!-- Thông báo nếu bị chặn khi chưa đăng nhập -->
            <c:if test="${not empty sessionScope.loginNotice}">
                <div class="alert alert-warning py-2 px-3 small d-flex align-items-center gap-2 mb-3 border-0">
                    <i class="fa-solid fa-triangle-exclamation text-warning"></i>
                    <span class="text-dark fw-bold">${sessionScope.loginNotice}</span>
                </div>
                <c:remove var="loginNotice" scope="session"/>
            </c:if>

            <!-- Thông báo lỗi khi sai mật khẩu -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger py-2 px-3 small d-flex align-items-center gap-2 mb-3 border-0">
                    <i class="fa-solid fa-circle-exclamation text-danger"></i>
                    <span class="fw-bold">${errorMessage}</span>
                </div>
            </c:if>

            <!-- Form Đăng Nhập Chỉn Chu -->
            <form action="${pageContext.request.contextPath}/login" method="POST" autocomplete="off">
                <div class="mb-3">
                    <label class="form-label text-dark small fw-bold mb-1">Tài khoản nhân viên</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border text-primary">
                            <i class="fa-solid fa-user-tie"></i>
                        </span>
                        <input type="text" name="username" class="form-control input-bright" 
                               placeholder="Nhập tên đăng nhập (admin)" required autofocus>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label text-dark small fw-bold mb-1">Mật khẩu truy cập</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border text-primary">
                            <i class="fa-solid fa-key"></i>
                        </span>
                        <input type="password" id="adminPassword" name="password" class="form-control input-bright" 
                               placeholder="Nhập mật khẩu" required>
                        <button class="btn btn-outline-secondary border" type="button" id="togglePassBtn" title="Ẩn/Hiện mật khẩu">
                            <i class="fa-solid fa-eye" id="togglePassIcon"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" class="btn-gold w-100 justify-content-center py-2 fs-6 fw-bold mb-3 shadow-sm">
                    <i class="fa-solid fa-arrow-right-to-bracket me-1"></i> Đăng Nhập Hệ Thống
                </button>
            </form>
            <!-- Trở về trang showroom -->
            <div class="text-center pt-2 border-top">
                <a href="${pageContext.request.contextPath}/home" class="text-decoration-none text-muted small fw-semibold">
                    <i class="fa-solid fa-arrow-left me-1"></i> Quay về giao diện Showroom bán xe
                </a>
            </div>
        </div>
    </main>

    <!-- Include Footer từ Showroom -->
    <jsp:include page="footer.jsp" />

    <!-- Bootstrap 5 JS -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
