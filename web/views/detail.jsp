<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${car != null ? car.name : 'Chi Tiết Xe'} | AUTOLUX MOTORS</title>
    
    <!-- Font Awesome 6 Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Bootstrap 5 CSS -->
    <link rel="stylesheet" href="$./assets/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Custom Clean Professional Automotive Styling -->
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body class="bg-light">

    <!-- Header Included -->
    <jsp:include page="header.jsp" />

    <!-- Breadcrumb điều hướng -->
    <div class="bg-white border-bottom py-3">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 small">
                    <li class="breadcrumb-item">
                        <a href="./home" class="text-decoration-none text-muted">
                            <i class="fa-solid fa-house me-1"></i> Trang Chủ
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="./home#collection" class="text-decoration-none text-muted">Bộ Sưu Tập Xe</a>
                    </li>
                    <li class="breadcrumb-item active text-dark fw-bold" aria-current="page">${car.name}</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Main Detail Section -->
    <main class="py-5" style="background: radial-gradient(circle at 10% 20%, rgba(217, 119, 6, 0.05) 0%, transparent 40%), #f8fafc;">
        <div class="container">
            <div class="row g-5">
                <!-- Cột hình ảnh xe -->
                <div class="col-lg-7">
                    <div class="position-sticky" style="top: 100px;">
                        <div class="bg-white p-3 rounded-4 border shadow-sm mb-3">
                            <div class="position-relative rounded-3 overflow-hidden" style="height: 440px;">
                                <img src="${car.imageUrl.startsWith('http') ? car.imageUrl : pageContext.request.contextPath.concat('/').concat(car.imageUrl)}" alt="${car.name}" class="w-100 h-100 object-fit-cover" id="mainCarDetailImg">
                                <c:if test="${not empty car.badge}">
                                    <span class="position-absolute top-0 start-0 m-3 badge bg-warning text-dark fs-6 px-3 py-2 fw-bold shadow-sm">
                                        <i class="fa-solid fa-crown me-1"></i> ${car.badge}
                                    </span>
                                </c:if>
                                <span class="position-absolute top-0 end-0 m-3 badge bg-dark bg-opacity-75 text-white fs-6 px-3 py-2 fw-semibold">
                                    ${car.brand}
                                </span>
                            </div>
                        </div>

                        <!-- Cam kết chất lượng 4 ô -->
                        <div class="row g-3">
                            <div class="col-6 col-md-3">
                                <div class="p-3 bg-white border rounded-3 text-center shadow-sm">
                                    <i class="fa-solid fa-shield-check text-warning fs-4 mb-2"></i>
                                    <div class="small fw-bold text-dark">Kiểm định 160 điểm</div>
                                </div>
                            </div>
                            <div class="col-6 col-md-3">
                                <div class="p-3 bg-white border rounded-3 text-center shadow-sm">
                                    <i class="fa-solid fa-truck-fast text-primary fs-4 mb-2"></i>
                                    <div class="small fw-bold text-dark">Giao xe toàn quốc</div>
                                </div>
                            </div>
                            <div class="col-6 col-md-3">
                                <div class="p-3 bg-white border rounded-3 text-center shadow-sm">
                                    <i class="fa-solid fa-award text-success fs-4 mb-2"></i>
                                    <div class="small fw-bold text-dark">Bảo hành 5 năm</div>
                                </div>
                            </div>
                            <div class="col-6 col-md-3">
                                <div class="p-3 bg-white border rounded-3 text-center shadow-sm">
                                    <i class="fa-solid fa-hand-holding-dollar text-danger fs-4 mb-2"></i>
                                    <div class="small fw-bold text-dark">Vay 85% giá trị</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Cột thông tin chi tiết, giá & bảng thông số -->
                <div class="col-lg-5">
                    <div class="bg-white p-4 p-md-5 rounded-4 border shadow-sm">
                        <span class="badge bg-warning-subtle text-warning-emphasis border border-warning-subtle px-3 py-1 rounded-pill fw-bold mb-2">
                            ${car.category.toUpperCase()} • ${car.brand.toUpperCase()}
                        </span>
                        <!-- Tên mẫu xe -->
                        <h2 class="fw-bold text-dark mb-3 text-break" style="word-break: break-word; line-height: 1.25;">${car.name}</h2>
                        
                        <!-- Giá xe sang trọng, không bị rớt dòng chữ đ -->
                        <div class="p-3 p-md-4 rounded-3 my-3" style="background: #fffbeb; border: 1.5px solid #fde68a;">
                            <span class="text-muted small d-block mb-1">Giá niêm yết chính hãng (đã gồm VAT):</span>
                            <div class="d-flex flex-wrap align-items-baseline gap-2 gap-md-3">
                                <span class="fw-bold text-warning-emphasis text-nowrap" style="font-size: clamp(1.6rem, 2.5vw, 2.2rem); letter-spacing: -0.5px;">
                                    ${car.formattedPrice}
                                </span>
                                <c:if test="${not empty car.formattedOriginalPrice}">
                                    <span class="text-muted text-decoration-line-through text-nowrap small">
                                        ${car.formattedOriginalPrice}
                                    </span>
                                </c:if>
                            </div>
                            <div class="text-success small fw-semibold mt-2 d-flex align-items-center gap-1">
                                <i class="fa-solid fa-circle-check"></i> Sẵn sàng bàn giao ngay trong ngày tại Showroom
                            </div>
                        </div>

                        <!-- Mô tả xe -->
                        <div class="mb-4">
                            <h6 class="fw-bold text-dark mb-2">Đặc Quyền Dòng Xe:</h6>
                            <p class="text-secondary small leading-relaxed">${car.description}</p>
                        </div>

                        <!-- Bảng thông số kỹ thuật -->
                        <div class="mb-4">
                            <h6 class="fw-bold text-dark mb-3 border-bottom pb-2">
                                <i class="fa-solid fa-microchip text-primary me-2"></i> Bảng Thông Số Kỹ Thuật Chi Tiết
                            </h6>
                            <ul class="list-group list-group-flush small">
                                <li class="list-group-item d-flex justify-content-between px-0 py-2">
                                    <span class="text-muted">Động cơ:</span>
                                    <strong class="text-dark">${car.engine}</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between px-0 py-2">
                                    <span class="text-muted">Công suất tối đa:</span>
                                    <strong class="text-warning-emphasis">${car.power}</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between px-0 py-2">
                                    <span class="text-muted">Tăng tốc 0-100 km/h:</span>
                                    <strong class="text-primary">${car.acceleration}</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between px-0 py-2">
                                    <span class="text-muted">Hộp số:</span>
                                    <strong class="text-dark">${car.transmission}</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between px-0 py-2">
                                    <span class="text-muted">Tốc độ tối đa:</span>
                                    <strong class="text-dark">${car.topSpeed}</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between px-0 py-2">
                                    <span class="text-muted">Nhiên liệu / Pin:</span>
                                    <strong class="text-dark">${car.rangeOrFuel}</strong>
                                </li>
                            </ul>
                        </div>

                        <!-- Nút hành động -->
                        <div class="d-grid gap-2">
                            <a href="./home#booking" class="btn btn-gold py-3 fw-bold text-center shadow-sm">
                                <i class="fa-solid fa-key me-2"></i> Đăng Ký Lái Thử Mẫu Xe Này
                            </a>
                            <a href="tel:1900888999" class="btn btn-outline-dark py-2 fw-semibold text-center">
                                <i class="fa-solid fa-phone me-2 text-warning"></i> Gọi Hotline Tư Vấn: 1900 888 999
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Các mẫu xe cùng phân khúc -->
            <div class="mt-5 pt-4 border-top">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <span class="text-warning text-uppercase fw-bold small">GỢI Ý TƯƠNG TỰ</span>
                        <h3 class="fw-bold text-dark mt-1 mb-0">Các Dòng Xe Khác Cùng Showroom</h3>
                    </div>
                    <a href="./home#collection" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                        Xem tất cả xe <i class="fa-solid fa-arrow-right ms-1"></i>
                    </a>
                </div>

                <div class="row g-4">
                    <c:forEach items="${relatedCars}" var="rel" begin="0" end="2">
                        <c:if test="${rel.id != car.id}">
                            <div class="col-md-4">
                                <div class="car-card shadow-sm h-100">
                                    <div class="car-thumb-wrap">
                                        <img src="${rel.imageUrl.startsWith('http') ? rel.imageUrl : pageContext.request.contextPath.concat('/').concat(rel.imageUrl)}" alt="${rel.name}" class="car-thumb">
                                        <c:if test="${not empty rel.badge}">
                                            <span class="car-badge">${rel.badge}</span>
                                        </c:if>
                                    </div>
                                    <div class="car-body">
                                        <div class="car-brand">${rel.brand}</div>
                                        <h5 class="car-title">${rel.name}</h5>
                                        <div class="car-price-row mt-auto">
                                            <div class="car-price">${rel.formattedPrice}</div>
                                        </div>
                                        <div class="d-flex gap-2 mt-2">
                                            <a href="./car-detail?id=${rel.id}" class="btn btn-outline-gold btn-sm w-50 text-center">
                                                <i class="fa-solid fa-circle-info me-1"></i> Chi tiết
                                            </a>
                                            <a href="./home#booking" class="btn btn-gold btn-sm w-50 justify-content-center text-center">
                                                <i class="fa-solid fa-key me-1"></i> Lái thử
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer Included -->
    <jsp:include page="footer.jsp" />

    <!-- Bootstrap 5 JS -->
    <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

