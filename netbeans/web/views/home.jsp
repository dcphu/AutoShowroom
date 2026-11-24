<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUTOLUX MOTORS | Showroom Xe Sang & Siêu Xe Hàng Đầu Việt Nam</title>
    
    <!-- Font Awesome 6 Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Bootstrap 5 CSS -->
    <link rel="stylesheet" href="./assets/vendor/bootstrap/css/bootstrap.min.css">
    
    <!-- Custom Clean Professional Automotive Styling -->
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>

    <!-- Toast Notification Container -->
    <div id="toastContainer" class="toast-container-custom">
        <c:if test="${not empty toastMessage}">
            <div class="toast-custom d-flex align-items-center justify-content-between border-${toastType == 'success' ? 'warning' : 'danger'}">
                <div class="d-flex align-items-center gap-3">
                    <i class="fa-solid ${toastType == 'success' ? 'fa-circle-check text-warning' : 'fa-circle-exclamation text-danger'} fa-lg"></i>
                    <div>
                        <strong class="d-block text-dark">${toastType == 'success' ? 'Thành công' : 'Thông báo'}</strong>
                        <span class="text-secondary" style="font-size:0.88rem;">${toastMessage}</span>
                    </div>
                </div>
                <button type="button" class="btn-close ms-3" aria-label="Close" onclick="this.parentElement.remove()"></button>
            </div>
        </c:if>
    </div>

    <!-- Top Announcement Bar & Navigation Bar Included from header.jsp -->
    <jsp:include page="header.jsp" />

    <!-- Hero Section Sáng Bắt Mắt -->
    <header class="hero-section">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <div class="hero-badge">
                        <i class="fa-solid fa-crown text-warning"></i> SHOWROOM XE SANG TIÊU CHUẨN 5 SAO
                    </div>
                    <h1 class="hero-title">
                        Khẳng Định <span class="gradient-text">Đẳng Cấp</span><br>
                        Chinh Phục Mọi Cung Đường
                    </h1>
                    <p class="hero-subtitle">
                        AutoLux tự hào là điểm đến tin cậy của hơn 5.000 chủ nhân tinh hoa. Cung cấp các dòng xe sang, siêu xe, và xe điện cao cấp nhập khẩu chính hãng với bảo hành 5 năm không giới hạn km.
                    </p>
                    
                    <div class="d-flex flex-wrap gap-3">
                        <a href="#booking" class="btn-gold">
                            <i class="fa-solid fa-car-side"></i> Đăng Ký Lái Thử Miễn Phí
                        </a>
                        <a href="#collection" class="btn-outline-gold">
                            <i class="fa-solid fa-compass"></i> Khám Phá Showroom
                        </a>
                    </div>
                    
                    <div class="hero-metrics">
                        <div class="metric-item">
                            <div class="metric-val text-warning">100%</div>
                            <div class="metric-label">Nhập Khẩu Chính Hãng</div>
                        </div>
                        <div class="metric-item">
                            <div class="metric-val" style="color: #0284c7;">160+</div>
                            <div class="metric-label">Hạng Mục Kiểm Định</div>
                        </div>
                        <div class="metric-item">
                            <div class="metric-val text-dark">2 Giờ</div>
                            <div class="metric-label">Duyệt Vay Trả Góp</div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="hero-visual">
                        <div class="hero-car-wrapper">
                            <img src="./assets/images/car-1.jpg" 
                                 alt="Mercedes-AMG GT 63 S" class="hero-car-img">
                        </div>
                        
                        <div class="hero-floating-card">
                            <div class="d-flex align-items-center gap-3">
                                <div class="rounded-circle bg-warning bg-opacity-25 p-3 text-warning">
                                    <i class="fa-solid fa-bolt-lightning fa-xl"></i>
                                </div>
                                <div>
                                    <div class="text-muted small text-uppercase fw-bold">Xe Nổi Bật Tuần Này</div>
                                    <div class="fw-bold text-dark fs-6">Mercedes-AMG GT 63 S E-Performance</div>
                                    <div class="text-warning fw-bold small">0-100 km/h: 2.9s • 843 Mã Lực</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Filter & Search Section -->
    <section class="container" id="collection" style="margin-top: -20px;">
        <div class="filter-card">
            <form action="./search#collection" method="GET" class="row g-3 align-items-center">
                <!-- Search Box -->
                <div class="col-lg-4 col-md-6">
                    <div class="input-group">
                        <span class="input-group-text bg-warning-subtle border-warning-subtle text-warning-emphasis">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </span>
                        <input type="text" name="keyword" value="${keyword}" class="form-control filter-input" 
                               placeholder="Tìm xe: AMG, Taycan, VinFast, V8...">
                    </div>
                </div>

                <!-- Brand Filter -->
                <div class="col-lg-3 col-md-6">
                    <select name="brand" class="form-select filter-input">
                        <option value="all">Tất cả thương hiệu</option>
                        <c:forEach items="${brands}" var="b">
                            <option value="${b}" ${selectedBrand == b ? 'selected' : ''}>${b}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Price Range Filter -->
                <div class="col-lg-3 col-md-6">
                    <select name="priceRange" class="form-select filter-input">
                        <option value="all" ${selectedPriceRange == 'all' ? 'selected' : ''}>Mọi khoảng giá</option>
                        <option value="under3b" ${selectedPriceRange == 'under3b' ? 'selected' : ''}>Dưới 3 Tỷ VNĐ</option>
                        <option value="3b-7b" ${selectedPriceRange == '3b-7b' ? 'selected' : ''}>Từ 3 Tỷ - 7 Tỷ VNĐ</option>
                        <option value="7b-11b" ${selectedPriceRange == '7b-11b' ? 'selected' : ''}>Từ 7 Tỷ - 11 Tỷ VNĐ</option>
                        <option value="above11b" ${selectedPriceRange == 'above11b' ? 'selected' : ''}>Trên 11 Tỷ VNĐ</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <div class="col-lg-2 col-md-6 d-grid">
                    <button type="submit" class="btn-gold justify-content-center">
                        <i class="fa-solid fa-filter"></i> Lọc Xe
                    </button>
                </div>

                <!-- Hidden Category Input preserves state -->
                <input type="hidden" name="category" id="filterCategoryInput" value="${selectedCategory}">
            </form>

            <!-- Category Pills Đọc Từ CategoryDao -->
            <div class="d-flex flex-wrap gap-2 mt-4 pt-3 border-top border-secondary border-opacity-25">
                <a href="./search?category=all&brand=${selectedBrand}&priceRange=${selectedPriceRange}&keyword=${keyword}#collection" 
                   class="category-pill ${selectedCategory == 'all' || empty selectedCategory ? 'active' : ''}">
                    <i class="fa-solid fa-border-all"></i> Tất cả các dòng
                </a>
                <c:forEach items="${lstCategory}" var="cat">
                    <a href="./search?category=${cat.slug}&brand=${selectedBrand}&priceRange=${selectedPriceRange}&keyword=${keyword}#collection" 
                       class="category-pill ${selectedCategory == cat.slug ? 'active' : ''}">
                        <i class="${cat.icon != null ? cat.icon : 'fa-solid fa-car'} text-warning"></i> ${cat.name}
                    </a>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- Car Showcase Gallery -->
    <section class="py-5 mt-4">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <span class="text-warning text-uppercase fw-bold small tracking-wider">
                        <i class="fa-solid fa-sparkles me-1"></i> BỘ SƯU TẬP XE ĐANG CÓ MẶT TẠI SHOWROOM
                    </span>
                    <h2 class="text-dark fw-bold mt-1 mb-0">Các Dòng Xe Tuyển Chọn</h2>
                </div>
                <div class="text-dark small fw-bold">
                    Hiển thị <span class="badge bg-warning text-dark fs-6 px-3 py-1 shadow-sm">${cars.size()}</span> mẫu xe cao cấp
                </div>
            </div>

            <!-- Empty State -->
            <c:if test="${empty cars}">
                <div class="text-center py-5 my-5">
                    <div class="display-1 text-warning mb-3"><i class="fa-solid fa-car-tunnel"></i></div>
                    <h4 class="text-dark fw-bold">Không tìm thấy mẫu xe nào phù hợp với bộ lọc</h4>
                    <p class="text-secondary">Vui lòng thử lại với từ khóa khác hoặc xóa bộ lọc để xem toàn bộ xe.</p>
                    <a href="./home#collection" class="btn-gold mt-3">
                        <i class="fa-solid fa-arrow-rotate-left"></i> Xem Tất Cả Xe
                    </a>
                </div>
            </c:if>

            <!-- Car Cards Grid -->
            <div class="row g-4">
                <c:forEach items="${cars}" var="car">
                    <div class="col-lg-4 col-md-6">
                        <div class="car-card">
                            <div class="car-thumb-wrap">
                                <img src="${car.imageUrl.startsWith('http') ? car.imageUrl : pageContext.request.contextPath.concat('/').concat(car.imageUrl)}" alt="${car.name}" class="car-thumb">
                                <c:if test="${not empty car.badge}">
                                    <span class="car-badge">
                                        <i class="fa-solid fa-fire text-warning me-1"></i> ${car.badge}
                                    </span>
                                </c:if>
                                <span class="car-category-tag text-uppercase">${car.category}</span>
                            </div>

                            <div class="car-body">
                                <div class="car-brand">${car.brand}</div>
                                <h3 class="car-title">${car.name}</h3>

                                <div class="car-specs-grid">
                                    <div class="spec-cell" title="Động cơ: ${car.engine}">
                                        <i class="fa-solid fa-gears"></i>
                                        <span>${car.engine}</span>
                                    </div>
                                    <div class="spec-cell" title="Công suất: ${car.power}">
                                        <i class="fa-solid fa-horse-head"></i>
                                        <span>${car.power}</span>
                                    </div>
                                    <div class="spec-cell" title="Tăng tốc: ${car.acceleration}">
                                        <i class="fa-solid fa-stopwatch"></i>
                                        <span>${car.acceleration}</span>
                                    </div>
                                    <div class="spec-cell" title="Hộp số: ${car.transmission}">
                                        <i class="fa-solid fa-sliders"></i>
                                        <span>${car.transmission}</span>
                                    </div>
                                </div>

                                <div class="car-price-row">
                                    <div>
                                        <span class="text-secondary small d-block fw-bold">Giá niêm yết:</span>
                                        <div class="car-price">${car.formattedPrice}</div>
                                    </div>
                                    <c:if test="${not empty car.formattedOriginalPrice}">
                                        <div class="car-price-old">${car.formattedOriginalPrice}</div>
                                    </c:if>
                                </div>

                                <div class="d-flex gap-2 mt-2">
                                    <a href="./car-detail?id=${car.id}" class="btn btn-outline-gold btn-sm w-50 text-center">
                                        <i class="fa-solid fa-circle-info me-1"></i> Chi tiết
                                    </a>
                                    <a href="#booking" class="btn btn-gold btn-sm w-50 justify-content-center btn-quick-book"
                                       data-car-id="${car.id}">
                                        <i class="fa-solid fa-key me-1"></i> Lái thử
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- Modal Chi Tiết Xe Sáng Rõ -->
    <div class="modal fade modal-luxury" id="carDetailModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <div>
                        <span id="modalCarBrand" class="text-warning text-uppercase fw-bold small">BRAND</span>
                        <h4 class="modal-title text-white fw-bold" id="modalCarTitle">Tên Mẫu Xe</h4>
                    </div>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="rounded-3 overflow-hidden shadow-lg border border-warning border-opacity-50">
                                <img src="" id="modalCarImg" alt="Car Detail" class="w-100" style="height: 260px; object-fit: cover;">
                            </div>
                            <div class="mt-3 p-3 rounded-3 bg-dark border border-warning border-opacity-25">
                                <div class="text-white-50 small mb-1 fw-bold">Giá bán công bố chính thức:</div>
                                <div class="fs-4 fw-bold text-warning" id="modalCarPrice">0 VNĐ</div>
                                <div class="text-success small mt-1 fw-bold">
                                    <i class="fa-solid fa-circle-check"></i> Đã bao gồm thuế VAT & Bảo hành 5 năm
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h6 class="text-white fw-bold mb-3 border-bottom border-white border-opacity-25 pb-2">
                                <i class="fa-solid fa-microchip text-warning me-2"></i> Bảng Thông Số Kỹ Thuật
                            </h6>
                            <ul class="list-unstyled small text-white mb-4">
                                <li class="d-flex justify-content-between py-2 border-bottom border-secondary border-opacity-50">
                                    <span class="text-white-50">Động cơ:</span> <strong class="text-white" id="modalCarEngine"></strong>
                                </li>
                                <li class="d-flex justify-content-between py-2 border-bottom border-secondary border-opacity-50">
                                    <span class="text-white-50">Công suất:</span> <strong class="text-warning" id="modalCarPower"></strong>
                                </li>
                                <li class="d-flex justify-content-between py-2 border-bottom border-secondary border-opacity-50">
                                    <span class="text-white-50">Tăng tốc (0-100 km/h):</span> <strong class="text-info" id="modalCarAccel"></strong>
                                </li>
                                <li class="d-flex justify-content-between py-2 border-bottom border-secondary border-opacity-50">
                                    <span class="text-white-50">Hộp số:</span> <strong class="text-white" id="modalCarTrans"></strong>
                                </li>
                                <li class="d-flex justify-content-between py-2 border-bottom border-secondary border-opacity-50">
                                    <span class="text-white-50">Vận tốc tối đa:</span> <strong class="text-white" id="modalCarSpeed"></strong>
                                </li>
                                <li class="d-flex justify-content-between py-2 border-bottom border-secondary border-opacity-50">
                                    <span class="text-white-50">Nhiên liệu / Pin:</span> <strong class="text-white" id="modalCarRange"></strong>
                                </li>
                            </ul>
                            
                            <h6 class="text-white fw-bold mb-2">Mô tả đặc quyền:</h6>
                            <p class="text-white-50 small mb-0" id="modalCarDesc"></p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-gold" id="modalBookTestDriveBtn">
                        <i class="fa-solid fa-key me-2"></i> Đăng Ký Lái Thử Xe Này
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Exclusive Benefits Section (Đặc Quyền Khách Hàng - Sáng & Sang) -->
    <section class="py-5" id="features" style="background: #ffffff; border-top: 1px solid #e2e8f0; border-bottom: 1px solid #e2e8f0;">
        <div class="container py-4">
            <div class="text-center max-w-xl mx-auto mb-5">
                <span class="text-warning text-uppercase fw-bold small tracking-wider">
                    <i class="fa-solid fa-shield-halved me-1"></i> ĐẶC QUYỀN KHÁCH HÀNG AUTOLUX
                </span>
                <h2 class="text-dark fw-bold mt-2">Chuẩn Mực Dịch Vụ 5 Sao</h2>
                <p class="text-secondary">Mỗi chiếc xe xuất xưởng từ AutoLux đều là lời cam kết trọn vẹn về chất lượng và sự an tâm tuyệt đối.</p>
            </div>

            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="feature-box">
                        <div class="feature-icon-wrap">
                            <i class="fa-solid fa-list-check"></i>
                        </div>
                        <h4 class="text-dark fw-bold fs-5 mb-2">Kiểm Định 160 Điểm</h4>
                        <p class="text-secondary small mb-0">Tất cả xe được kiểm tra nghiêm ngặt bằng máy chẩn đoán chuyên hãng. Cam kết không đâm đụng, không ngập nước, pháp lý rõ ràng.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="feature-box">
                        <div class="feature-icon-wrap">
                            <i class="fa-solid fa-percent"></i>
                        </div>
                        <h4 class="text-dark fw-bold fs-5 mb-2">Trả Góp Ưu Đãi 85%</h4>
                        <p class="text-secondary small mb-0">Hợp tác cùng 12 ngân hàng lớn nhất Việt Nam. Lãi suất ưu đãi cố định từ 7.5%/năm, xét duyệt hồ sơ nhanh chóng chỉ trong 2 giờ.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="feature-box">
                        <div class="feature-icon-wrap">
                            <i class="fa-solid fa-truck-ramp-box"></i>
                        </div>
                        <h4 class="text-dark fw-bold fs-5 mb-2">Giao Xe Tận Nhà 24/7</h4>
                        <p class="text-secondary small mb-0">Dịch vụ xe lồng chuyên dụng bàn giao xe kín đáo, trang trọng tận cửa nhà quý khách trên toàn bộ 63 tỉnh thành.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="feature-box">
                        <div class="feature-icon-wrap">
                            <i class="fa-solid fa-wrench"></i>
                        </div>
                        <h4 class="text-dark fw-bold fs-5 mb-2">Bảo Hành 5 Năm VIP</h4>
                        <p class="text-secondary small mb-0">Tặng gói chăm sóc phủ Ceramic 9H cao cấp, bảo hiểm thân vỏ và chế độ cứu hộ giao thông khẩn cấp 24/7 trên cả nước.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Financial Loan Calculator Section Chuẩn Form Sáng Sủa -->
    <section class="py-5" id="calculator" style="background: #f8fafc;">
        <div class="container py-4">
            <div class="row align-items-center g-5">
                <div class="col-lg-5">
                    <span class="text-warning text-uppercase fw-bold small">
                        <i class="fa-solid fa-calculator me-1"></i> CÔNG CỤ DỰ TOÁN TÀI CHÍNH
                    </span>
                    <h2 class="text-dark fw-bold mt-2 mb-3">Tính Phí Trả Góp Xe Thông Minh</h2>
                    <p class="text-secondary mb-4">
                        Tự do lựa chọn phương án tài chính tối ưu cho doanh nghiệp và gia đình bạn. Bảng tính dựa trên phương thức dư nợ giảm dần chuẩn mực ngân hàng.
                    </p>

                    <div class="d-flex flex-column gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <i class="fa-solid fa-circle-check text-warning fa-lg"></i>
                            <span class="text-dark fw-bold">Không cần chứng minh tài chính rườm rà</span>
                        </div>
                        <div class="d-flex align-items-center gap-3">
                            <i class="fa-solid fa-circle-check text-warning fa-lg"></i>
                            <span class="text-dark fw-bold">Hỗ trợ trả nợ trước hạn linh hoạt</span>
                        </div>
                        <div class="d-flex align-items-center gap-3">
                            <i class="fa-solid fa-circle-check text-warning fa-lg"></i>
                            <span class="text-dark fw-bold">Nhận xe ngay chỉ từ 20% giá trị hợp đồng</span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-7">
                    <div class="calc-card">
                        <div class="row g-4">
                            <!-- Select Car -->
                            <div class="col-12">
                                <label class="form-label text-dark small fw-bold">Chọn Mẫu Xe Muốn Mua:</label>
                                <select id="calcCarSelect" class="form-select filter-input">
                                    <c:forEach items="${allCars}" var="car">
                                        <option value="${car.price}">
                                            ${car.name} (${car.formattedPrice})
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Down payment range -->
                            <div class="col-md-6">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <label class="form-label text-dark small fw-bold mb-0">Tỷ Lệ Trả Trước:</label>
                                    <span id="calcDownPaymentText" class="text-warning fw-bold fs-6">20%</span>
                                </div>
                                <input type="range" class="form-range" id="calcDownPaymentRange" min="10" max="70" step="5" value="20">
                                <div class="d-flex justify-content-between text-muted small fw-bold">
                                    <span>10%</span>
                                    <span>40%</span>
                                    <span>70%</span>
                                </div>
                            </div>

                            <!-- Loan Term -->
                            <div class="col-md-6">
                                <label class="form-label text-dark small fw-bold">Thời Gian Vay:</label>
                                <select id="calcLoanTerm" class="form-select filter-input">
                                    <option value="12">1 Năm (12 tháng)</option>
                                    <option value="24">2 Năm (24 tháng)</option>
                                    <option value="36">3 Năm (36 tháng)</option>
                                    <option value="48">4 Năm (48 tháng)</option>
                                    <option value="60" selected>5 Năm (60 tháng)</option>
                                    <option value="72">6 Năm (72 tháng)</option>
                                    <option value="84">7 Năm (84 tháng)</option>
                                </select>
                            </div>

                            <!-- Interest Rate -->
                            <div class="col-12">
                                <label class="form-label text-dark small fw-bold">Lãi Suất Ưu Đãi (%/Năm):</label>
                                <input type="number" id="calcInterestRate" class="form-control filter-input" value="8.5" step="0.1" min="1" max="20">
                            </div>

                            <!-- Calculation Result Box -->
                            <div class="col-12">
                                <div class="calc-result-box">
                                    <div class="calc-label-top">Ước Tính Gốc + Lãi Trả Hàng Tháng:</div>
                                    <div id="outMonthlyPay" class="calc-result-amount my-2">0 ₫</div>
                                    
                                    <div class="row pt-3 mt-2 border-top border-white border-opacity-25 small">
                                        <div class="col-4">
                                            <span class="calc-sub-label">Số tiền trả trước:</span>
                                            <strong class="d-block calc-sub-val fs-6" id="outDownPayment">0 ₫</strong>
                                        </div>
                                        <div class="col-4">
                                            <span class="calc-sub-label">Số tiền vay:</span>
                                            <strong class="d-block calc-sub-val fs-6" id="outLoanAmount">0 ₫</strong>
                                        </div>
                                        <div class="col-4">
                                            <span class="calc-sub-label">Tổng lãi ước tính:</span>
                                            <strong class="d-block calc-sub-val fs-6" id="outTotalInterest">0 ₫</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         PHẦN ĐĂNG KÝ LÁI THỬ: GIAO DIỆN SÁNG (LIGHT LUXURY SUITE - KHÔNG CÒN TỐI)
         ===================================================================== -->
    <section class="booking-section-bright" id="booking">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="booking-card-bright">
                        <div class="text-center mb-5">
                            <span class="badge bg-warning text-dark px-3 py-2 fw-bold text-uppercase mb-2">
                                <i class="fa-solid fa-id-card-clip me-1"></i> Trải Nghiệm Thực Tế Miễn Phí
                            </span>
                            <h2 class="display-6 fw-bold mt-2">Đăng Ký Lái Thử & Nhận Báo Giá</h2>
                            <p class="section-desc mx-auto fs-6" style="max-width: 620px;">
                                Trải nghiệm thực tế cảm giác sau vô lăng của những cỗ máy hàng đầu thế giới ngay hôm nay. Đội ngũ chuyên gia của chúng tôi sẵn sàng phục vụ quý khách.
                            </p>
                        </div>

                        <!-- Form gửi về Java Servlet BookingServlet -->
                        <form id="bookingForm" action="./booking" method="POST">
                            <div class="row g-4">
                                <!-- Họ và tên -->
                                <div class="col-md-6">
                                    <label class="form-label">Họ và Tên Quý Khách <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <span class="input-group-text input-group-text-bright">
                                            <i class="fa-solid fa-user"></i>
                                        </span>
                                        <input type="text" name="fullName" class="form-control input-bright" placeholder="Ví dụ: Nguyễn Văn An" required>
                                    </div>
                                </div>

                                <!-- Số điện thoại -->
                                <div class="col-md-6">
                                    <label class="form-label">Số Điện Thoại <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <span class="input-group-text input-group-text-bright">
                                            <i class="fa-solid fa-phone"></i>
                                        </span>
                                        <input type="tel" name="phone" class="form-control input-bright"
                                            placeholder="Ví dụ: 0905123456" pattern="0[0-9]{9}" maxlength="10"
                                            title="Số điện thoại phải gồm đúng 10 số và bắt đầu bằng số 0" required>
                                    </div>
                                    <div class="form-text text-muted small">Phải gồm đúng 10 chữ số bắt đầu bằng số 0</div>
                                </div>

                                <!-- Email -->
                                <div class="col-md-6">
                                    <label class="form-label">Email Nhận Báo Giá</label>
                                    <div class="input-group">
                                        <span class="input-group-text input-group-text-bright">
                                            <i class="fa-solid fa-envelope"></i>
                                        </span>
                                        <input type="email" name="email" class="form-control input-bright"
                                            placeholder="Ví dụ: an.nguyen@gmail.com"
                                            pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
                                            title="Email phải có ký tự @ và đuôi tên miền (Ví dụ: an.nguyen@gmail.com)">
                                    </div>
                                    <div class="form-text text-muted small">Định dạng email hợp lệ có @ và đuôi tên miền</div>
                                </div>

                                <!-- Xe Lái Thử -->
                                <div class="col-md-6">
                                    <label class="form-label">Dòng Xe Muốn Lái Thử</label>
                                    <select name="carId" id="bookingCarSelect" class="form-select input-bright">
                                        <option value="0">-- Chưa chọn mẫu xe (Tư vấn dòng phù hợp) --</option>
                                        <c:forEach items="${allCars}" var="car">
                                            <option value="${car.id}">
                                                ${car.name} - ${car.formattedPrice}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- Ngày lái thử mong muốn -->
                                <div class="col-md-4">
                                    <label class="form-label">Ngày Lái Thử Dự Kiến</label>
                                    <input type="date" name="bookingDate" class="form-control input-bright">
                                </div>

                                <!-- Khung giờ -->
                                <div class="col-md-4">
                                    <label class="form-label">Khung Giờ Thuận Tiện</label>
                                    <select name="bookingTime" class="form-select input-bright">
                                        <option value="Sáng (08:30 - 11:30)">Buổi Sáng (08:30 - 11:30)</option>
                                        <option value="Chiều (14:00 - 17:30)" selected>Buổi Chiều (14:00 - 17:30)</option>
                                        <option value="Tối (18:00 - 20:30)">Buổi Tối (18:00 - 20:30)</option>
                                    </select>
                                </div>

                                <!-- Địa điểm lái thử -->
                                <div class="col-md-4">
                                    <label class="form-label">Địa Điểm Lái Thử</label>
                                    <select name="locationType" class="form-select input-bright">
                                        <option value="showroom" selected>Tại Showroom AutoLux</option>
                                        <option value="home">Giao xe tận nhà quý khách</option>
                                    </select>
                                </div>

                                <!-- Ghi chú -->
                                <div class="col-12">
                                    <label class="form-label">Ghi Chú Hoặc Yêu Cầu Riêng</label>
                                    <textarea name="notes" rows="3" class="form-control input-bright" 
                                              placeholder="Ví dụ: Cần chuẩn bị xe màu trắng, tư vấn thêm gói bảo hiểm hoặc chạy thử cao tốc..."></textarea>
                                </div>

                                <!-- Submit Button -->
                                <div class="col-12 text-center pt-3">
                                    <button type="submit" class="btn-gold px-5 py-3 fs-6">
                                        <i class="fa-solid fa-paper-plane me-2"></i> Gửi Yêu Cầu Lái Thử Ngay
                                    </button>
                                    <div class="text-muted small mt-2">
                                        <i class="fa-solid fa-lock text-success me-1"></i> Thông tin được mã hóa và bảo mật tuyệt đối 100%.
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials / Đánh Giá Từ Chủ Xe (Sáng & Tinh Tế) -->
    <section class="py-5" style="background: #f8fafc; border-top: 1px solid #e2e8f0;">
        <div class="container py-4">
            <div class="text-center mb-5">
                <span class="text-warning text-uppercase fw-bold small">
                    <i class="fa-solid fa-comments me-1"></i> ĐÁNH GIÁ TỪ CHỦ XE
                </span>
                <h2 class="text-dark fw-bold mt-2">Khách Hàng Nói Về AutoLux</h2>
            </div>

            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="testimonial-card">
                        <div class="d-flex text-warning mb-3">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <p class="text-secondary small mb-4">
                            "Tôi nhận chiếc Porsche Taycan Turbo S chỉ sau 3 ngày hoàn tất hợp đồng. Dịch vụ xe lồng giao tận biệt thự ở Flamingo rất chuyên nghiệp và trang trọng."
                        </p>
                        <div class="d-flex align-items-center gap-3">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=200&auto=format&fit=crop" 
                                 alt="Khách hàng" class="user-avatar">
                            <div>
                                <h6 class="text-dark fw-bold mb-0">Ông Hoàng Nam</h6>
                                <span class="text-secondary small">Tổng giám đốc Nam Phát Group</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="testimonial-card">
                        <div class="d-flex text-warning mb-3">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <p class="text-secondary small mb-4">
                            "Gói hỗ trợ tài chính ở AutoLux xử lý siêu tốc. Hồ sơ duyệt chưa đầy 2 tiếng, lãi suất cố định thấp hơn mặt bằng chung. Đội ngũ tư vấn am hiểu kỹ thuật sâu sắc."
                        </p>
                        <div class="d-flex align-items-center gap-3">
                            <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=200&auto=format&fit=crop" 
                                 alt="Khách hàng" class="user-avatar">
                            <div>
                                <h6 class="text-dark fw-bold mb-0">Bà Lê Thúy Hằng</h6>
                                <span class="text-secondary small">Nhà đầu tư Tài chính - Sở hữu Maybach S680</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="testimonial-card">
                        <div class="d-flex text-warning mb-3">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <p class="text-secondary small mb-4">
                            "Mẫu VF 9 Plus màu xanh Deep Ocean nhận xe rất ưng ý. Showroom hỗ trợ đăng ký biển số và lắp trạm sạc wallbox tại nhà hoàn toàn miễn phí. Rất đáng tin cậy!"
                        </p>
                        <div class="d-flex align-items-center gap-3">
                            <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=200&auto=format&fit=crop" 
                                 alt="Khách hàng" class="user-avatar">
                            <div>
                                <h6 class="text-dark fw-bold mb-0">Anh Đặng Tuấn Minh</h6>
                                <span class="text-secondary small">Kiến trúc sư Trưởng - Hà Nội</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         PHẦN LIÊN HỆ & SHOWROOM: GIAO DIỆN SÁNG (LIGHT LUXURY SUITE - SÁNG RÕ)
         ===================================================================== -->
    <section class="contact-section-bright" id="contact">
        <div class="container">
            <div class="row g-5 align-items-start">
                <!-- Hệ thống chi nhánh Showroom -->
                <div class="col-lg-6">
                    <span class="badge bg-warning text-dark px-3 py-2 fw-bold text-uppercase mb-2">
                        <i class="fa-solid fa-building me-1"></i> Hệ Thống Phân Phối
                    </span>
                    <h2 class="display-6 fw-bold mt-2 mb-4" style="color: #0f172a;">Ghé Thăm Showroom AutoLux</h2>

                    <div class="d-flex flex-column gap-3">
                        <div class="branch-card-bright d-flex gap-3 align-items-start">
                            <div class="branch-icon-wrap flex-shrink-0">
                                <i class="fa-solid fa-location-dot"></i>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-1" style="color: #0f172a;">Showroom 1 - Hà Nội (Flagship)</h5>
                                <p class="mb-1 small" style="color: #475569;">Tòa tháp Keangnam Landmark 72, Đường Phạm Hùng, Mễ Trì, Nam Từ Liêm, Hà Nội.</p>
                                <span class="fw-bold small" style="color: #b45309;"><i class="fa-solid fa-phone me-1"></i> Hotline: 024.7777.8888</span>
                            </div>
                        </div>

                        <div class="branch-card-bright d-flex gap-3 align-items-start">
                            <div class="branch-icon-wrap flex-shrink-0">
                                <i class="fa-solid fa-location-dot"></i>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-1" style="color: #0f172a;">Showroom 2 - Đà Nẵng</h5>
                                <p class="mb-1 small" style="color: #475569;">Số 186 Đường Nguyễn Văn Linh, Quận Hải Châu, TP. Đà Nẵng.</p>
                                <span class="fw-bold small" style="color: #b45309;"><i class="fa-solid fa-phone me-1"></i> Hotline: 0236.8888.999</span>
                            </div>
                        </div>

                        <div class="branch-card-bright d-flex gap-3 align-items-start">
                            <div class="branch-icon-wrap flex-shrink-0">
                                <i class="fa-solid fa-location-dot"></i>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-1" style="color: #0f172a;">Showroom 3 - TP. Hồ Chí Minh</h5>
                                <p class="mb-1 small" style="color: #475569;">Khu Đô Thị Sala, Đường Nguyễn Cơ Thạch, TP. Thủ Đức, TP. Hồ Chí Minh.</p>
                                <span class="fw-bold small" style="color: #b45309;"><i class="fa-solid fa-phone me-1"></i> Hotline: 028.9999.6666</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Form Gửi Tin Nhắn Tư Vấn Cho Ban Quản Trị (Sáng Sủa) -->
                <div class="col-lg-6">
                    <div class="contact-card-bright">
                        <h4 class="mb-2">Gửi Lời Nhắn Đến Ban Quản Trị</h4>
                        <p class="small mb-4">Quý khách có nhu cầu đặt hàng cấu hình cá nhân hóa riêng hoặc trao đổi mua bán, xin để lại lời nhắn:</p>

                        <form id="contactForm" action="./contact" method="POST">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold" style="color: #1e293b;">Họ và tên *</label>
                                    <input type="text" name="fullName" class="form-control input-bright" placeholder="Ví dụ: Trần Văn Nam" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold" style="color: #1e293b;">Số điện thoại *</label>
                                    <input type="tel" name="phone" class="form-control input-bright"
                                        placeholder="Ví dụ: 0908123456" pattern="0[0-9]{9}" maxlength="10"
                                        title="Số điện thoại phải gồm đúng 10 số và bắt đầu bằng số 0" required>
                                    <div class="form-text text-muted small">Đúng 10 số bắt đầu bằng 0</div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label small fw-bold" style="color: #1e293b;">Email liên hệ</label>
                                    <input type="email" name="email" class="form-control input-bright"
                                        placeholder="Ví dụ: nam.tran@gmail.com"
                                        pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
                                        title="Email phải có ký tự @ và đuôi tên miền (Ví dụ: nam.tran@gmail.com)">
                                    <div class="form-text text-muted small">Email phải có @ và đuôi tên miền</div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label small fw-bold" style="color: #1e293b;">Tiêu đề yêu cầu</label>
                                    <input type="text" name="subject" class="form-control input-bright" placeholder="VD: Đặt xe độc bản Manufaktur, Tư vấn gói vay...">
                                </div>
                                <div class="col-12">
                                    <label class="form-label small fw-bold" style="color: #1e293b;">Nội dung cần trao đổi</label>
                                    <textarea name="message" rows="3" class="form-control input-bright" placeholder="Chi tiết nội dung cần chuyên viên hỗ trợ..."></textarea>
                                </div>
                                <div class="col-12 pt-2">
                                    <button type="submit" class="btn-gold w-100 justify-content-center py-3">
                                        <i class="fa-solid fa-paper-plane me-2"></i> Gửi Tin Nhắn Tư Vấn
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer Included from footer.jsp -->
    <jsp:include page="footer.jsp" />

    <!-- Bootstrap 5 JS Bundle -->
    <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        if (typeof bootstrap === 'undefined') {
            document.write('<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"><\/script>');
        }
    </script>
    
    <!-- Main Interaction Logic -->
    <script src="./assets/js/main.js"></script>
</body>
</html>
