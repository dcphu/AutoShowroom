/**
 * AUTOLUX MOTOR SHOWROOM - MAIN INTERACTION SCRIPT
 */

document.addEventListener('DOMContentLoaded', function () {
    initNavbarScroll();
    initLoanCalculator();
    initCarModal();
    initQuickBookingAction();
    initBookingFormAjax();
    initContactFormAjax();
    initCategoryPills();
    initStaffSecretShortcut();
});

// 1. Navbar Scrolled State
function initNavbarScroll() {
    const navbar = document.querySelector('.navbar-luxury');
    if (!navbar) return;

    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
}

// 2. Financial / Loan Installment Calculator
function initLoanCalculator() {
    const carSelect = document.getElementById('calcCarSelect');
    const downPaymentRange = document.getElementById('calcDownPaymentRange');
    const downPaymentText = document.getElementById('calcDownPaymentText');
    const loanTermSelect = document.getElementById('calcLoanTerm');
    const interestRateInput = document.getElementById('calcInterestRate');

    const outDownPayment = document.getElementById('outDownPayment');
    const outLoanAmount = document.getElementById('outLoanAmount');
    const outMonthlyPay = document.getElementById('outMonthlyPay');
    const outTotalInterest = document.getElementById('outTotalInterest');

    if (!carSelect || !downPaymentRange) return;

    function calculate() {
        const carPrice = parseFloat(carSelect.value) || 0;
        const downPercent = parseFloat(downPaymentRange.value) || 20;
        const loanMonths = parseInt(loanTermSelect.value) || 60;
        const annualRate = parseFloat(interestRateInput.value) || 8.5;

        downPaymentText.innerText = downPercent + '%';

        const downPaymentAmount = carPrice * (downPercent / 100);
        const loanAmount = carPrice - downPaymentAmount;

        const monthlyRate = (annualRate / 100) / 12;

        let monthlyPayment = 0;
        let totalInterest = 0;

        if (loanAmount > 0 && monthlyRate > 0) {
            monthlyPayment = loanAmount * (monthlyRate * Math.pow(1 + monthlyRate, loanMonths)) / (Math.pow(1 + monthlyRate, loanMonths) - 1);
            totalInterest = (monthlyPayment * loanMonths) - loanAmount;
        } else if (loanAmount > 0 && monthlyRate === 0) {
            monthlyPayment = loanAmount / loanMonths;
        }

        if (outDownPayment) outDownPayment.innerText = formatVND(downPaymentAmount);
        if (outLoanAmount) outLoanAmount.innerText = formatVND(loanAmount);
        if (outMonthlyPay) outMonthlyPay.innerText = formatVND(monthlyPayment);
        if (outTotalInterest) outTotalInterest.innerText = formatVND(totalInterest);
    }

    carSelect.addEventListener('change', calculate);
    downPaymentRange.addEventListener('input', calculate);
    loanTermSelect.addEventListener('change', calculate);
    interestRateInput.addEventListener('input', calculate);

    calculate();
}

function formatVND(amount) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
        maximumFractionDigits: 0
    }).format(Math.round(amount));
}

// 3. Interactive Car Detail Modal
function initCarModal() {
    const modalEl = document.getElementById('carDetailModal');
    if (!modalEl) return;

    modalEl.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        if (!button) return;

        const name = button.getAttribute('data-name');
        const brand = button.getAttribute('data-brand');
        const price = button.getAttribute('data-price');
        const engine = button.getAttribute('data-engine');
        const power = button.getAttribute('data-power');
        const accel = button.getAttribute('data-accel');
        const trans = button.getAttribute('data-trans');
        const speed = button.getAttribute('data-speed');
        const range = button.getAttribute('data-range');
        const img = button.getAttribute('data-img');
        const desc = button.getAttribute('data-desc');
        const id = button.getAttribute('data-id');

        document.getElementById('modalCarTitle').innerText = name;
        document.getElementById('modalCarBrand').innerText = brand;
        document.getElementById('modalCarPrice').innerText = price;
        document.getElementById('modalCarEngine').innerText = engine;
        document.getElementById('modalCarPower').innerText = power;
        document.getElementById('modalCarAccel').innerText = accel;
        document.getElementById('modalCarTrans').innerText = trans;
        document.getElementById('modalCarSpeed').innerText = speed;
        document.getElementById('modalCarRange').innerText = range;
        document.getElementById('modalCarDesc').innerText = desc;
        document.getElementById('modalCarImg').src = img;

        const bookBtn = document.getElementById('modalBookTestDriveBtn');
        if (bookBtn) {
            bookBtn.setAttribute('data-car-id', id);
        }
    });

    const modalBookBtn = document.getElementById('modalBookTestDriveBtn');
    if (modalBookBtn) {
        modalBookBtn.addEventListener('click', function () {
            const carId = this.getAttribute('data-car-id');
            const carSelect = document.getElementById('bookingCarSelect');
            if (carSelect && carId) {
                carSelect.value = carId;
            }
            const bsModal = bootstrap.Modal.getInstance(modalEl);
            if (bsModal) bsModal.hide();

            const bookingSec = document.getElementById('booking');
            if (bookingSec) {
                bookingSec.scrollIntoView({ behavior: 'smooth' });
            }
        });
    }
}

// 4. Quick Booking Button on Car Card
function initQuickBookingAction() {
    const quickBookBtns = document.querySelectorAll('.btn-quick-book');
    quickBookBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const carId = this.getAttribute('data-car-id');
            const carSelect = document.getElementById('bookingCarSelect');
            if (carSelect && carId) {
                carSelect.value = carId;
            }
            const bookingSec = document.getElementById('booking');
            if (bookingSec) {
                bookingSec.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });
}

// 5. Booking Form Ajax Handling
function initBookingFormAjax() {
    const form = document.getElementById('bookingForm');
    if (!form) return;

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        const phoneInput = form.querySelector('input[name="phone"]');
        const emailInput = form.querySelector('input[name="email"]');
        const phone = phoneInput ? phoneInput.value.trim().replace(/\s+/g, '') : '';
        const email = emailInput ? emailInput.value.trim() : '';

        // Validate SĐT: đúng 10 số bắt đầu bằng 0
        if (!/^0\d{9}$/.test(phone)) {
            showToast('Số điện thoại không hợp lệ! Vui lòng nhập đúng 10 số bắt đầu bằng số 0 (Ví dụ: 0905123456).', 'danger');
            if (phoneInput) phoneInput.focus();
            return;
        }

        // Validate Email: có @ và đuôi tên miền
        if (email && !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
            showToast('Email không hợp lệ! Email phải chứa ký tự "@" và đuôi tên miền hợp lệ (Ví dụ: example@gmail.com).', 'danger');
            if (emailInput) emailInput.focus();
            return;
        }

        const submitBtn = form.querySelector('button[type="submit"]');
        const originalBtnText = submitBtn.innerHTML;
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Đang xử lý...';

        const formData = new FormData(form);
        const params = new URLSearchParams(formData);
        params.append('ajax', 'true');

        fetch(form.action, {
            method: 'POST',
            body: params,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
            }
        })
        .then(res => res.json())
        .then(data => {
            submitBtn.disabled = false;
            submitBtn.innerHTML = originalBtnText;

            if (data.status === 'success') {
                showToast(data.message, 'success');
                form.reset();
            } else {
                showToast(data.message || 'Có lỗi xảy ra, vui lòng thử lại!', 'danger');
            }
        })
        .catch(err => {
            form.submit();
        });
    });
}

// 6. Contact Form Ajax Handling
function initContactFormAjax() {
    const form = document.getElementById('contactForm');
    if (!form) return;

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        const phoneInput = form.querySelector('input[name="phone"]');
        const emailInput = form.querySelector('input[name="email"]');
        const phone = phoneInput ? phoneInput.value.trim().replace(/\s+/g, '') : '';
        const email = emailInput ? emailInput.value.trim() : '';

        // Validate SĐT: đúng 10 số bắt đầu bằng 0
        if (!/^0\d{9}$/.test(phone)) {
            showToast('Số điện thoại không hợp lệ! Vui lòng nhập đúng 10 số bắt đầu bằng số 0 (Ví dụ: 0905123456).', 'danger');
            if (phoneInput) phoneInput.focus();
            return;
        }

        // Validate Email: có @ và đuôi tên miền
        if (email && !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email)) {
            showToast('Email không hợp lệ! Email phải chứa ký tự "@" và đuôi tên miền hợp lệ (Ví dụ: example@gmail.com).', 'danger');
            if (emailInput) emailInput.focus();
            return;
        }

        const submitBtn = form.querySelector('button[type="submit"]');
        const originalBtnText = submitBtn.innerHTML;
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Đang gửi tin...';

        const formData = new FormData(form);
        const params = new URLSearchParams(formData);
        params.append('ajax', 'true');

        fetch(form.action, {
            method: 'POST',
            body: params,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
            }
        })
        .then(res => res.json())
        .then(data => {
            submitBtn.disabled = false;
            submitBtn.innerHTML = originalBtnText;

            if (data.status === 'success') {
                showToast(data.message, 'success');
                form.reset();
            } else {
                showToast(data.message || 'Có lỗi xảy ra, vui lòng thử lại!', 'danger');
            }
        })
        .catch(err => {
            form.submit();
        });
    });
}

// 7. Category Pills Interactive Click
function initCategoryPills() {
    const pills = document.querySelectorAll('.category-pill');
    pills.forEach(pill => {
        pill.addEventListener('click', function () {
            pills.forEach(p => p.classList.remove('active'));
            this.classList.add('active');
        });
    });
}

// 8. Lối Vào Kín Đáo Cho Nhân Viên Nội Bộ (Double click Logo hoặc Ctrl + Shift + A)
function initStaffSecretShortcut() {
    function getLoginUrl() {
        const path = window.location.pathname;
        const slashIdx = path.indexOf('/', 1);
        const ctx = (slashIdx > 0) ? path.substring(0, slashIdx) : path;
        return (ctx === '/' || !ctx) ? '/login' : ctx + '/login';
    }

    // 1. Phím tắt bí mật: Ctrl + Shift + A
    document.addEventListener('keydown', function (e) {
        if (e.ctrlKey && e.shiftKey && (e.key === 'A' || e.key === 'a')) {
            e.preventDefault();
            window.location.href = getLoginUrl();
        }
    });

    // 2. Nhấp đúp chuột vào Logo thương hiệu ở góc trái
    const logo = document.getElementById('brandLogo');
    if (logo) {
        logo.addEventListener('dblclick', function (e) {
            e.preventDefault();
            window.location.href = getLoginUrl();
        });
    }
}

// Toast helper
function showToast(message, type = 'success') {
    const container = document.getElementById('toastContainer');
    if (!container) return;

    const toast = document.createElement('div');
    toast.className = `toast-custom d-flex align-items-center justify-content-between border-${type === 'success' ? 'warning' : 'danger'}`;
    toast.innerHTML = `
        <div class="d-flex align-items-center gap-3">
            <i class="fa-solid ${type === 'success' ? 'fa-circle-check text-warning' : 'fa-circle-exclamation text-danger'} fa-lg"></i>
            <div>
                <strong class="d-block text-dark">${type === 'success' ? 'Thành công' : 'Thông báo'}</strong>
                <span class="text-secondary" style="font-size:0.88rem;">${message}</span>
            </div>
        </div>
        <button type="button" class="btn-close ms-3" aria-label="Close" onclick="this.parentElement.remove()"></button>
    `;

    container.appendChild(toast);

    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transition = 'opacity 0.5s ease';
        setTimeout(() => toast.remove(), 500);
    }, 6000);
}

        // Toggle ẩn/hiện mật khẩu
        const toggleBtn = document.getElementById('togglePassBtn');
        const passInput = document.getElementById('adminPassword');
        const passIcon = document.getElementById('togglePassIcon');
        if (toggleBtn && passInput) {
            toggleBtn.addEventListener('click', function () {
                if (passInput.type === 'password') {
                    passInput.type = 'text';
                    passIcon.classList.remove('fa-eye');
                    passIcon.classList.add('fa-eye-slash');
                } else {
                    passInput.type = 'password';
                    passIcon.classList.remove('fa-eye-slash');
                    passIcon.classList.add('fa-eye');
                }
            });
        }
