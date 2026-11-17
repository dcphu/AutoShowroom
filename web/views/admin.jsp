<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoLux Admin | Quản Lý Lịch Hẹn & Phản Hồi Tư Vấn</title>
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Bootstrap 5 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Custom Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="admin-light-body">

    <!-- Toast Notification Container -->
    <div id="toastContainer" class="toast-container-custom">
        <c:if test="${not empty toastMessage}">
            <div class="toast-custom d-flex align-items-center justify-content-between border-${toastType == 'success' ? 'warning' : (toastType == 'warning' ? 'warning' : 'danger')}">
                <div class="d-flex align-items-center gap-3">
                    <i class="fa-solid ${toastType == 'success' ? 'fa-circle-check text-success' : (toastType == 'warning' ? 'fa-triangle-exclamation text-warning' : 'fa-circle-exclamation text-danger')} fa-lg"></i>
                    <div>
                        <strong class="d-block text-dark">${toastType == 'success' ? 'Thành công' : (toastType == 'warning' ? 'Cảnh báo' : 'Lỗi hệ thống')}</strong>
                        <span class="text-secondary" style="font-size:0.9rem;">${toastMessage}</span>
                    </div>
                </div>
                <button type="button" class="btn-close ms-3" aria-label="Close" onclick="this.parentElement.remove()"></button>
            </div>
        </c:if>
    </div>

    <!-- Navbar Quản Trị Sáng Sủa Chuyên Nghiệp -->
    <nav class="navbar navbar-expand-lg admin-light-navbar sticky-top">
        <div class="container-fluid px-4">
            <a class="brand-logo text-decoration-none" href="${pageContext.request.contextPath}/admin">
                <div class="brand-icon"><i class="fa-solid fa-shield-halved"></i></div>
                <div class="brand-text">AUTOLUX <span class="highlight">BẢNG QUẢN TRỊ</span></div>
            </a>
            
            <div class="d-flex align-items-center gap-3 ms-auto">
                <div class="d-none d-md-flex align-items-center gap-2 pe-3 border-end border-slate-300">
                    <div class="staff-avatar">
                        <i class="fa-solid fa-user-tie"></i>
                    </div>
                    <div>
                        <span class="staff-name d-block">${sessionScope.adminUser != null ? sessionScope.adminUser : 'Quản Trị Viên'}</span>
                        <span class="staff-status"><i class="fa-solid fa-circle fa-2xs text-success me-1"></i> Đang trực ca</span>
                    </div>
                </div>

                <a href="${pageContext.request.contextPath}/home" target="_blank" class="btn btn-outline-dark btn-sm rounded-pill px-3">
                    <i class="fa-solid fa-arrow-up-right-from-square me-1"></i> Xem Showroom
                </a>

                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm rounded-pill px-3">
                    <i class="fa-solid fa-power-off me-1"></i> Đăng Xuất
                </a>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <div class="container-fluid px-4 py-4">
        <!-- Header Banner Sáng Sủa -->
        <div class="admin-welcome-card mb-4 p-4 rounded-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-3">
                <div>
                    <span class="badge bg-primary bg-opacity-10 text-primary fw-bold mb-2 px-3 py-1 rounded-pill">
                        <i class="fa-solid fa-shield-check me-1"></i> CỔNG ĐIỀU HÀNH NỘI BỘ
                    </span>
                    <h3 class="fw-bold text-dark mb-1">
                        Hệ Thống Quản Lý Lái Thử & Tư Vấn Khách Hàng
                    </h3>
                    <p class="text-secondary mb-0">Theo dõi lịch hẹn, chuyển đổi trạng thái tiếp nhận và phản hồi giải đáp thắc mắc của khách.</p>
                </div>
                <div class="d-flex gap-2">
                    <a href="#bookingsSection" class="btn btn-gold btn-sm px-3 shadow-sm">
                        <i class="fa-solid fa-calendar-check me-1"></i> Lịch Lái Thử
                    </a>
                    <a href="#contactsTable" class="btn btn-primary btn-sm px-3 shadow-sm">
                        <i class="fa-solid fa-comments me-1"></i> Trả Lời Tư Vấn (${pendingContacts})
                    </a>
                </div>
            </div>
        </div>

        <!-- Thống Kê 4 Chỉ Số Nhanh (Giao diện Sáng) -->
        <div class="row g-3 mb-4">
            <div class="col-xl-3 col-md-6">
                <div class="admin-stat-card">
                    <div class="stat-icon bg-blue-subtle text-primary">
                        <i class="fa-solid fa-car-side"></i>
                    </div>
                    <div>
                        <span class="stat-label">Tổng Đơn Lái Thử</span>
                        <h3 class="stat-value text-dark">${totalBookings}</h3>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="admin-stat-card border-warning-start">
                    <div class="stat-icon bg-warning-subtle text-warning">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                    </div>
                    <div>
                        <span class="stat-label text-warning-emphasis">Chờ Xác Nhận</span>
                        <h3 class="stat-value text-warning-emphasis">${pendingBookings}</h3>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="admin-stat-card border-success-start">
                    <div class="stat-icon bg-success-subtle text-success">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                    <div>
                        <span class="stat-label text-success-emphasis">Đã Xác Nhận</span>
                        <h3 class="stat-value text-success-emphasis">${confirmedBookings}</h3>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="admin-stat-card border-danger-start">
                    <div class="stat-icon bg-danger-subtle text-danger">
                        <i class="fa-solid fa-envelope-open-text"></i>
                    </div>
                    <div>
                        <span class="stat-label text-danger-emphasis">Khách Chờ Trả Lời</span>
                        <h3 class="stat-value text-danger-emphasis">${pendingContacts}</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- PHẦN 1: QUẢN LÝ LỊCH LÁI THỬ & CHẾ ĐỘ XÁC NHẬN -->
        <div class="admin-card p-4 mb-4 shadow-sm" id="bookingsSection">
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-3">
                <div>
                    <h4 class="fw-bold text-dark mb-1">
                        <i class="fa-solid fa-list-check text-warning me-2"></i> Danh Sách Lịch Lái Thử & Chế Độ Xác Nhận
                    </h4>
                    <span class="text-secondary small">Chuyển trạng thái trực tiếp: <strong>Chờ xác nhận &rarr; Đã xác nhận &rarr; Hoàn tất &rarr; Đã hủy</strong></span>
                </div>
                <div>
                    <span class="badge bg-light text-dark border px-3 py-2">
                        Tổng cộng: <strong>${bookings.size()}</strong> đơn đăng ký
                    </span>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0 admin-table">
                    <thead>
                        <tr>
                            <th style="width: 80px;">Mã ĐK</th>
                            <th>Họ và Tên Khách</th>
                            <th>Số Điện Thoại</th>
                            <th>Xe Lái Thử</th>
                            <th>Thời Gian Hẹn</th>
                            <th>Địa Điểm</th>
                            <th style="width: 150px;">Trạng Thái</th>
                            <th style="width: 230px;" class="text-center">Thao Tác Chuyển Chế Độ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty bookings}">
                            <tr>
                                <td colspan="8" class="text-center text-muted py-4">Chưa có dữ liệu đặt lái thử.</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${bookings}" var="b">
                            <tr>
                                <td class="fw-bold text-primary">#${b.id}</td>
                                <td>
                                    <strong class="text-dark d-block">${b.fullName}</strong>
                                    <small class="text-secondary">${b.email}</small>
                                </td>
                                <td>
                                    <a href="tel:${b.phone}" class="text-decoration-none fw-bold text-primary">
                                        <i class="fa-solid fa-phone me-1 small"></i> ${b.phone}
                                    </a>
                                </td>
                                <td class="fw-bold text-dark">${b.carName}</td>
                                <td>
                                    <span class="badge bg-light text-dark border">${b.bookingDate}</span>
                                    <small class="d-block text-warning-emphasis fw-bold mt-1">${b.bookingTime}</small>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${b.locationType == 'home'}">
                                            <span class="badge bg-info-subtle text-info-emphasis border border-info-subtle"><i class="fa-solid fa-house me-1"></i> Tận nhà</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-light text-secondary border"><i class="fa-solid fa-building me-1"></i> Showroom</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <!-- Trạng thái hiện tại -->
                                <td>
                                    <c:choose>
                                        <c:when test="${b.status == 'Đã xác nhận'}">
                                            <span class="badge-status-confirmed"><i class="fa-solid fa-circle-check me-1"></i> Đã xác nhận</span>
                                        </c:when>
                                        <c:when test="${b.status == 'Hoàn tất'}">
                                            <span class="badge-status-completed"><i class="fa-solid fa-flag-checkered me-1"></i> Hoàn tất</span>
                                        </c:when>
                                        <c:when test="${b.status == 'Đã hủy'}">
                                            <span class="badge-status-cancelled"><i class="fa-solid fa-ban me-1"></i> Đã hủy</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge-status-pending"><i class="fa-solid fa-clock me-1"></i> Chờ xác nhận</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <!-- Form chuyển trạng thái trực tiếp (Nếu đã hoàn tất thì khóa thao tác) -->
                                <td>
                                    <c:choose>
                                        <c:when test="${b.status == 'Hoàn tất'}">
                                            <div class="text-center">
                                                <span class="badge bg-success bg-opacity-10 text-success border border-success-subtle px-3 py-2 fw-semibold">
                                                    <i class="fa-solid fa-lock me-1"></i> Đã đóng hồ sơ
                                                </span>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <form action="${pageContext.request.contextPath}/admin" method="POST" class="d-flex align-items-center gap-1 justify-content-center">
                                                <input type="hidden" name="action" value="updateStatus">
                                                <input type="hidden" name="bookingId" value="${b.id}">
                                                
                                                <select name="newStatus" class="form-select form-select-sm bg-white border-secondary-subtle" style="width: 145px; font-weight: 500;">
                                                    <option value="Chờ xác nhận" ${b.status != null && b.status.trim() == 'Chờ xác nhận' ? 'selected' : ''}>Chờ xác nhận</option>
                                                    <option value="Đã xác nhận" ${b.status != null && b.status.trim() == 'Đã xác nhận' ? 'selected' : ''}>Đã xác nhận</option>
                                                    <option value="Hoàn tất" ${b.status != null && b.status.trim() == 'Hoàn tất' ? 'selected' : ''}>Hoàn tất</option>
                                                    <option value="Đã hủy" ${b.status != null && b.status.trim() == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
                                                </select>
                                                <button type="submit" class="btn btn-warning btn-sm text-dark fw-bold px-2" title="Lưu cập nhật">
                                                    <i class="fa-solid fa-floppy-disk me-1"></i> Lưu
                                                </button>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- PHẦN 2: TRẢ LỜI TƯ VẤN KHI KHÁCH HỎI -->
        <div class="admin-card p-4 shadow-sm" id="contactsTable">
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-3">
                <div>
                    <h4 class="fw-bold text-dark mb-1">
                        <i class="fa-solid fa-comments text-primary me-2"></i> Hộp Thư Tư Vấn Khách Hàng & Chức Năng Trả Lời
                    </h4>
                    <span class="text-secondary small">Nhân viên trực tiếp phản hồi thắc mắc về giá lăn bánh, chính sách trả góp và thông số xe</span>
                </div>
                <div>
                    <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-3 py-2 fw-bold">
                        Đang chờ phản hồi: <strong>${pendingContacts}</strong>
                    </span>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0 admin-table">
                    <thead>
                        <tr>
                            <th style="width: 80px;">Mã TN</th>
                            <th style="width: 200px;">Khách Hàng</th>
                            <th style="width: 270px;">Nội Dung Khách Hỏi</th>
                            <th style="width: 140px;">Trạng Thái</th>
                            <th>Nội Dung Tư Vấn Viên Đã Phản Hồi</th>
                            <th style="width: 140px;" class="text-center">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty contacts}">
                            <tr>
                                <td colspan="6" class="text-center text-muted py-4">Chưa có tin nhắn tư vấn nào.</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${contacts}" var="c">
                            <tr>
                                <td class="text-primary fw-bold">#${c.id}</td>
                                <td>
                                    <strong class="text-dark d-block">${c.fullName}</strong>
                                    <a href="tel:${c.phone}" class="text-decoration-none text-primary small fw-bold">
                                        <i class="fa-solid fa-phone me-1"></i> ${c.phone}
                                    </a>
                                    <div class="text-secondary small">${c.email}</div>
                                </td>
                                <td>
                                    <strong class="text-dark d-block small mb-1">${c.subject}</strong>
                                    <span class="text-secondary small">${c.message}</span>
                                    <small class="d-block text-muted mt-1"><i class="fa-regular fa-clock me-1"></i> Gửi lúc: ${c.createdAt}</small>
                                </td>
                                <!-- Trạng thái phản hồi -->
                                <td>
                                    <c:choose>
                                        <c:when test="${c.status == 'Đã phản hồi'}">
                                            <span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1 fw-bold">
                                                <i class="fa-solid fa-check-double me-1"></i> Đã phản hồi
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1 fw-bold">
                                                <i class="fa-solid fa-hourglass-half me-1"></i> Chưa phản hồi
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <!-- Nội dung đã trả lời -->
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty c.replyMessage}">
                                            <div class="admin-reply-box-bright">
                                                <div class="d-flex align-items-center gap-2 small mb-1">
                                                    <strong class="text-primary">
                                                        <i class="fa-solid fa-user-tie me-1"></i> ${c.repliedBy}
                                                    </strong>
                                                    <span class="text-muted small">(${c.repliedAt})</span>
                                                </div>
                                                <div class="text-dark" style="white-space: pre-line;">${c.replyMessage}</div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted fst-italic small">Chưa có câu trả lời. Hãy bấm nút "Trả lời ngay" bên phải.</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <!-- Nút mở Modal trả lời -->
                                <td class="text-center">
                                    <button type="button" class="btn btn-sm ${empty c.replyMessage ? 'btn-primary fw-bold' : 'btn-outline-primary'}" 
                                            data-bs-toggle="modal" data-bs-target="#replyModal${c.id}">
                                        <i class="fa-solid fa-reply me-1"></i> ${empty c.replyMessage ? 'Trả lời ngay' : 'Sửa trả lời'}
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- CÁC MODAL TRẢ LỜI TƯ VẤN (ĐƯỢC ĐẶT Ở NGOÀI BẢNG ĐỂ TRÁNH LỖI HTML & HIỂN THỊ CHUẨN) -->
    <c:forEach items="${contacts}" var="c">
        <div class="modal fade" id="replyModal${c.id}" tabindex="-1" aria-labelledby="modalLabel${c.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content admin-modal-light border-0 shadow">
                    <form action="${pageContext.request.contextPath}/admin" method="POST">
                        <input type="hidden" name="action" value="replyContact">
                        <input type="hidden" name="contactId" value="${c.id}">

                        <div class="modal-header bg-light border-bottom">
                            <h5 class="modal-title fw-bold text-dark" id="modalLabel${c.id}">
                                <i class="fa-solid fa-reply text-primary me-2"></i> Trả Lời Tư Vấn Khách Hàng #${c.id}
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="modal-body p-4">
                            <!-- Khung thông tin khách hỏi -->
                            <div class="p-3 rounded-3 bg-light border mb-3">
                                <div class="row g-2">
                                    <div class="col-sm-6">
                                        <span class="text-muted small d-block">Khách hàng:</span>
                                        <strong class="text-dark">${c.fullName}</strong>
                                    </div>
                                    <div class="col-sm-6">
                                        <span class="text-muted small d-block">Liên hệ:</span>
                                        <span class="text-dark fw-bold">${c.phone}</span> | <span class="text-muted">${c.email}</span>
                                    </div>
                                </div>
                                <hr class="my-2 border-secondary-subtle">
                                <div>
                                    <span class="text-muted small d-block">Chủ đề & Câu hỏi:</span>
                                    <div class="fw-bold text-primary mb-1">${c.subject}</div>
                                    <div class="p-2 bg-white rounded border text-dark fst-italic">"${c.message}"</div>
                                </div>
                            </div>

                            <!-- Nhập câu trả lời -->
                            <div class="mb-3">
                                <label for="replyMessageTextarea${c.id}" class="form-label fw-bold text-dark">
                                    Nội Dung Phản Hồi Tư Vấn Của Nhân Viên: <span class="text-danger">*</span>
                                </label>
                                <textarea id="replyMessageTextarea${c.id}" name="replyMessage" rows="5" class="form-control" 
                                          placeholder="Ví dụ: Chào anh/chị, về chính sách trả góp mẫu xe này, hiện ngân hàng đối tác hỗ trợ vay đến 85% giá trị xe trong 8 năm..." required>${c.replyMessage}</textarea>
                            </div>
                            
                            <div class="alert alert-info py-2 px-3 small d-flex align-items-center gap-2 mb-0 border-0">
                                <i class="fa-solid fa-circle-info text-info"></i>
                                <span>Phản hồi này sẽ được lưu trữ vào hệ thống và hiển thị xác nhận cho khách hàng.</span>
                            </div>
                        </div>

                        <div class="modal-footer bg-light border-top">
                            <button type="button" class="btn btn-secondary btn-sm px-3" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary btn-sm px-4 fw-bold">
                                <i class="fa-solid fa-paper-plane me-1"></i> Lưu & Gửi Phản Hồi
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>

    <!-- Bootstrap 5 JS -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
