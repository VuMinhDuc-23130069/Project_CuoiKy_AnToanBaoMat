<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý mã đơn hàng - chỉnh sửa</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <script src="https://kit.fontawesome.com/a2e0f9a8b5.js" crossorigin="anonymous"></script>

</head>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Tahoma", sans-serif;
    }

    body {
        background-color: #f4f7fb;
    }

    .container {
        display: flex;
        height: 100vh;
    }

    /* Sidebar tổng thể */
    .sidebar {
        width: 250px;
        background-color: #2f3640;
        color: #fff;
        display: flex;
        flex-direction: column;
    }

    .sidebar-header {
        background-color: #0288d1;
        text-align: center;
        font-size: 18px;
    }

    .admin-info {
        display: flex;
        text-align: center;
        padding: 35px;
        font-size: 25px;
    }

    .admin-info span {
        margin-left: 5px;
    }

    .menu {
        list-style: none;
    }

    .menu li {
        padding: 12px 20px;
        display: flex;
        align-items: center;
        gap: 10px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .menu li:hover {
        background-color: #414b57;
    }

    .menu a {
        color: #fff;
        text-decoration: none;
    }

    /* Submenu */
    .has-submenu {
        flex-direction: column;
        align-items: flex-start;
        position: relative;
    }

    .submenu-toggle {
        width: 100%;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .arrow {
        margin-left: auto;
        transition: 0.3s;
    }

    .has-submenu.open .arrow {
        transform: rotate(180deg);
    }

    .submenu {
        display: none;
        flex-direction: column;
        background-color: #383f49;
        width: 100%;
        margin-top: 5px;
        border-left: 3px solid #00aaff;
    }

    .has-submenu.open .submenu {
        display: flex;
    }

    .submenu li {
        padding: 10px 40px;
        display: flex;
        align-items: center;
        color:#fff;
        gap: 8px;
    }

    /* Main content */
    .main {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    .topbar {
        background-color: #03a9f4;
        color: white;
        padding: 10px 20px;
        display: flex;
        align-items: center;
    }

    .topbar h1 {
        font-size: 26px;
        font-weight: bold;
    }

    .topbar-right img {
        width: 35px;
        border-radius: 50%;
    }

    /* Breadcumb */
    .breadcrumb {
        font-size: 16px;
        color: #007bff;
        margin-top: 20px;
        margin-left: 20px;
    }

    .breadcrumb a {
        text-decoration: none;
        color: #007bff;
        transition: color 0.2s;
    }

    .breadcrumb span {
        margin: 0 5px;
        color: #007bff;
    }

    .breadcrumb .current{
        color: #777;
    }

    /* ACCOUNT (avatar + tên ở góc phải header)============================================= */
    .account {
        margin-left: auto;
        display: flex;
        align-items: center;
        position: relative;
        z-index: 60;
    }

    .account-btn {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        background: transparent;
        border: none;
        cursor: pointer;
        padding: 6px 10px;
        border-radius: 8px;
        color: #fff;
        transition: background .12s;
    }

    .account-btn:hover {
        background: rgba(255, 255, 255, 0.06);
    }

    .account-avatar-sm {
        width: 34px;
        height: 34px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid rgba(255, 255, 255, 0.12);
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
    }

    /* tên hiển thị bên phải avatar */
    .account-name {
        color: #fff;
        font-weight: 600;
        font-size: 14px;
        white-space: nowrap;
    }


    /* PROFILE POPUP */
    .profile-popup {
        position: absolute;
        top: 58px; /* vị trí popup cách top của header */
        right: 18px; /* căn vào cạnh phải header */
        width: 260px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 12px 34px rgba(11, 20, 35, 0.14);
        overflow: hidden;
        display: none;
        transform-origin: top right;
        z-index: 70;
    }

    .profile-popup.show {
        display: block;
        animation: pop .12s ease;
    }

    .profile-popup .top {
        background: #0aa0e6;
        color: #fff;
        text-align: center;
        padding: 18px 14px;
    }

    .profile-popup .avatar-large {
        width: 78px;
        height: 78px;
        border-radius: 50%;
        margin: 0 auto 10px;
        overflow: hidden;
        border: 4px solid rgba(255, 255, 255, 0.15);
        background: #fff;
    }

    .profile-popup .avatar-large img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
    }

    .profile-popup .uname {
        font-size: 18px;
        font-weight: 700;
        margin-bottom: 4px;
    }

    .profile-popup .uemail, .profile-popup .uphone {
        font-size: 13px;
        opacity: 0.95;
    }

    /* footer */
    .profile-popup .footer {
        padding: 12px;
        border-top: 1px solid #eef3f6;
        display: flex;
        justify-content: flex-end;
        background: #fff;
    }

    .profile-popup .btn-logout {
        display: block;
        width: 100%;
        padding: 10px 0;

        text-align: center;
        font-weight: 600;

        border-radius: 6px;
        border: 1px solid #d1d9df;
        background: #fff;

        color: #333;
        text-decoration: none;
        cursor: pointer;
    }

    .profile-popup .btn-logout:visited {
        color: #333;
    }

    .profile-popup .btn-logout:hover {
        background: #f4f6f8;
        color: #000;
    }


    /* caret */
    .profile-popup:before {
        content: '';
        position: absolute;
        top: -8px;
        right: 26px;
        width: 0;
        height: 0;
        border-left: 8px solid transparent;
        border-right: 8px solid transparent;
        border-bottom: 8px solid #fff;
    }

    /* animation */
    @keyframes pop {
        from {
            transform: scale(.98);
            opacity: 0
        }
        to {
            transform: scale(1);
            opacity: 1
        }
    }

    /* Dashboard */
    .dashboard {
        padding: 20px;
    }

    .dashboard h2 {
        margin-bottom: 15px;
        font-size: 20px;
        color: #333;
    }

    .dashboard h3 {
        margin-bottom: 15px;
        margin-top: -10px;
        font-size: 20px;
        color: #333;
    }

    .border-dashboard {
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    }

    /* Khung 2 cột chính*/
    .post-editor {
        display: flex;
        gap: 25px;
        margin-top: 20px;
    }

    /* CỘT TRÁI */
    .post-left {
        flex: 1;
        background: #fff;
        padding: 25px; /* PADDING CHỐNG DÍNH LỀ */
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
    }

    /* FORM INPUT CHUNG */
    .post-left input,
    .post-left select,
    .post-left textarea {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .compulsory{
        display: inline;
        color: red;
    }
    .fa-floppy-disk{
        margin-right: 5px;
    }
    .fa-rotate-left{
        margin-right: 5px;
    }

    /* CỘT PHẢI */
    .post-right {
        width: 300px;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
    }

    /* Title mỗi box */
    .post-right h3 {
        margin-bottom: 10px;
        font-size: 18px;
    }

    /* Nút */
    .btn-box {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }

    .btn-save {
        flex: 1;
        padding: 10px;
        background: #03a9f4;
        border: none;
        color: #fff;
        font-weight: bold;
        border-radius: 3px;
        cursor: pointer;
    }

    .btn-reset {
        flex: 1;
        padding: 10px;
        background: #e53935;
        border: none;
        color: #fff;
        font-weight: bold;
        border-radius: 3px;
        cursor: pointer;
    }
    .order-grid-container {
        display: grid;
        grid-template-columns: 7fr 3fr; /* Cột trái 7 phần, phải 3 phần */
        gap: 30px; /* Khoảng cách giữa 2 cột */
        align-items: start;
        font-family: Arial, sans-serif;
    }

    .info-card {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .action-card {
        background-color: #ffffff;
        padding: 25px;
        border-radius: 8px;
        border: 1px solid #e0e0e0;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        position: sticky; /* Giữ khung này trôi theo khi cuộn chuột */
        top: 20px;
    }

    .info-group {
        margin-bottom: 25px; /* Giãn cách giữa các dòng */
        border-bottom: 1px dashed #eee; /* Đường kẻ mờ ngăn cách */
        padding-bottom: 10px;
    }

    .info-group:last-child {
        border-bottom: none;
    }

    .info-label {
        display: block;
        color: #888;
        font-size: 0.9rem;
        margin-bottom: 8px;
    }

    .info-value {
        display: block;
        color: #333;
        font-size: 1.1rem;
        font-weight: 600;
        margin: 0;
        line-height: 1.4;
    }

    .total-money-section {
        background-color: #fdf2f2; /* Nền đỏ nhạt */
        padding: 20px;
        border-radius: 8px;
        border: 1px solid #fadbd8;
        text-align: center;
        margin-top: 20px;
    }
    .total-money-value {
        color: #d32f2f;
        font-size: 24px;
        font-weight: bold;
        margin-top: 5px;
    }

    .status-select {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: 2px solid #3498db;
        border-radius: 6px;
        margin-bottom: 20px;
        background-color: #fff;
        cursor: pointer;
    }

    .btn-stack {
        display: flex;
        flex-direction: column; /* Xếp dọc */
        gap: 15px; /* Khoảng cách giữa 2 nút */
    }

    .btn-submit {
        background-color: #28a745;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
        transition: background 0.3s;
    }
    .btn-submit:hover { background-color: #218838; }

    .btn-back {
        display: block;
        text-align: center;
        background-color: #6c757d;
        color: white;
        padding: 12px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
        width: 100%;
        box-sizing: border-box;
        transition: background 0.3s;
    }
    .btn-back:hover { background-color: #5a6268; }

    .section-title {
        color: #2c3e50;
        border-bottom: 2px solid #3498db;
        padding-bottom: 10px;
        margin-bottom: 25px;
        font-size: 1.3rem;
        text-transform: uppercase;
    }

</style>
<body>
<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="admin-info">
                <i class="fa fa-user"></i>
                <span>Admin</span>
            </div>
        </div>

        <ul class="menu">
            <li style="opacity: 0.6"><i class="fa-solid fa-home"></i><a href="${pageContext.request.contextPath}/AdminDashboard">Bảng điều khiển</a></li>
            <hr>

            <li style="opacity: 0.6" class="has-submenu">
                <div class="submenu-toggle">
                    <i class="fa-solid fa-box"></i>
                    <span>Sản phẩm</span>
                    <i class="fa-solid fa-chevron-down arrow"></i>
                </div>
                <ul class="submenu">
                    <li style="opacity: 0.6"><i class="fa-solid fa-list"></i> <a href="${pageContext.request.contextPath}/AdminCategory">Danh mục</a></li>
                    <li style="opacity: 0.6" ><i class="fa-solid fa-boxes-stacked"></i> <a href="${pageContext.request.contextPath}/AdminProduct">Sản phẩm</a></li>
                </ul>
            </li>
            <hr>

            <li style="opacity: 0.6"><i class="fa-solid fa-file-lines" ></i> <a href="${pageContext.request.contextPath}/AdminNews">Bài viết</a></li>
            <hr>
            <li style="opacity: 0.6"> <i class="fa-solid fa-user"></i><a href="${pageContext.request.contextPath}/AdminUser">Người dùng</a></li>
            <hr>
            <li> <i class="fa-solid fa-shopping-cart"></i><a href="${pageContext.request.contextPath}/AdminOrder">Đơn hàng</a></li>
            <hr>
            <li style="opacity: 0.6"> <i class="fa-solid fa-tag"></i><a href="${pageContext.request.contextPath}/AdminDiscount">Mã giảm giá</a></li>
            <hr>
        </ul>
    </aside>

    <!-- Main content -->
    <main class="main">
        <header class="topbar">
            <h1>Quản lý bán ngũ cốc</h1>

            <!-- Đưa account vào đây để căn chỉnh ngang -->
            <div class="account" id="accountArea" aria-haspopup="true">
                <button id="accountBtn" class="account-btn" aria-expanded="false" aria-controls="profilePopup"
                        title="Tài khoản">
                    <img class="account-avatar-sm" src="image/admin/images.jpg" alt="avatar">
                    <span class="account-name">Admin</span>
                    <img class="fa fa-caret-down" style="margin-left:8px; color: rgba(255,255,255,0.9);"><img>
                </button>
            </div>
        </header>

        <!-- Profile popup (đặt ngay sau header trong DOM) -->
        <c:if test="${not empty sessionScope.user && sessionScope.user.userRole == 'admin'}">
            <div id="profilePopup" class="profile-popup" role="dialog"
                 aria-label="Thông tin tài khoản" aria-hidden="true">

                <div class="top">
                    <div class="avatar-large">
                        <img src="<c:url value='/image/admin/images.jpg'/>" alt="avatar">
                    </div>

                    <div class="uname">${sessionScope.user.fullName}
                    </div>

                    <div class="uemail">${sessionScope.user.email}
                    </div>

                    <div class="uphone">${sessionScope.user.phoneNumber}
                    </div>
                </div>

                <div class="footer">
                    <a href="<c:url value='/DangXuat'/>" class="btn-logout">
                        Đăng xuất
                    </a>
                </div>
            </div>
        </c:if>

        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <span>Trang chủ</span> /
            <span>Đơn hàng</span> /
            <span class="current">Chi tiết & chỉnh sửa trạng thái</span>
        </div>

        <section style="padding: 20px; background-color: #f4f6f9;">

            <form action="${pageContext.request.contextPath}/AdminOrderEdit" method="post" class="order-grid-container">

                <input type="hidden" name="id" value="${order.id}">

                <div class="info-card">
                    <h3 class="section-title">Chi tiết đơn hàng #${order.id}</h3>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="info-group">
                            <span class="info-label">Mã tài khoản (User ID)</span>
                            <h4 class="info-value">${order.userID}</h4>
                        </div>
                        <div class="info-group">
                            <span class="info-label">Tên người nhận</span>
                            <h4 class="info-value">${order.fullName}</h4>
                        </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="info-group">
                            <span class="info-label">Số điện thoại</span>
                            <h4 class="info-value">${order.phone}</h4>
                        </div>
                        <div class="info-group">
                            <span class="info-label">Email</span>
                            <h4 class="info-value">${order.email}</h4>
                        </div>
                    </div>

                    <div class="info-group">
                        <span class="info-label">Địa chỉ giao hàng</span>
                        <h4 class="info-value">${order.orderAddress}</h4>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="info-group">
                            <span class="info-label">Ngày đặt hàng</span>
                            <h4 class="info-value">
                                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm:ss"/>
                            </h4>
                        </div>
                        <div class="info-group">
                            <span class="info-label">Phương thức vận chuyển</span>
                            <h4 class="info-value">${order.deliveryMethodName}</h4>
                        </div>
                    </div>

                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="info-group">
                            <span class="info-label">Phương thức thanh toán</span>
                            <h4 class="info-value">${order.paymentMethodName}</h4>
                        </div>
                        <div class="info-group">
                            <span class="info-label">Mã giảm giá áp dụng</span>
                            <h4 class="info-value" style="color: #007bff;">
                                ${order.discountName != null ? order.discountName : 'Không có'}
                            </h4>
                        </div>
                    </div>

                    <div class="info-group">
                        <span class="info-label">Ghi chú của đơn hàng</span>
                        <h4 class="info-value">${order.note}</h4>
                    </div>

                    <div class="total-money-section">
                        <span class="info-label" style="margin-bottom: 0;">TỔNG TIỀN ĐƠN HÀNG</span>
                        <div class="total-money-value">
                            <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                        </div>
                    </div>
                </div>

                <div class="action-card">
                    <h3 class="section-title" style="font-size: 1.1rem;">Cập nhật trạng thái</h3>

                    <label class="info-label" style="color: #333; font-weight: bold;">Trạng thái xử lý (*)</label>

                    <select name="status" class="status-select">
                        <option value="1" ${order.orderStatus == 1 ? 'selected' : ''}>Chờ xác nhận</option>
                        <option value="2" ${order.orderStatus == 2 ? 'selected' : ''}>Đang vận chuyển</option>
                        <option value="3" ${order.orderStatus == 3 ? 'selected' : ''}>Đã giao hàng</option>
                        <option value="4" ${order.orderStatus == 4 ? 'selected' : ''}>Đã hủy</option>
                    </select>

                    <div class="btn-stack">
                        <button type="submit" class="btn-submit">
                            <i class="fa-solid fa-floppy-disk"></i> Lưu cập nhật
                        </button>

                        <a href="${pageContext.request.contextPath}/AdminOrder" class="btn-back">
                            <i class="fa-solid fa-arrow-left"></i> Quay lại
                        </a>
                    </div>
                </div>

            </form>
        </section>


    </main>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {

        const menu = document.querySelector(".has-submenu");
        const arrow = document.querySelector(".has-submenu .arrow");

        // Nhấn để mở/đóng submenu
        document.querySelector(".submenu-toggle").onclick = () => {
            menu.classList.toggle("open");

            // Lưu trạng thái submenu
            localStorage.setItem("menu-open", menu.classList.contains("open"));
        };

        // Khi load trang: mở submenu
        if (localStorage.getItem("menu-open") === "true") {
            menu.classList.add("open");

            // Ngăn mũi tên xoay khi load lại trang
            arrow.style.transform = "none";
        }
    });
</script>



<script>
    (function () {
        const btn = document.getElementById('accountBtn');
        const popup = document.getElementById('profilePopup');

        if (!btn || !popup) return;

        btn.addEventListener('click', (e) => {
            e.stopPropagation();
            popup.classList.toggle('show');
            const shown = popup.classList.contains('show');
            btn.setAttribute('aria-expanded', shown ? 'true' : 'false');
            popup.setAttribute('aria-hidden', shown ? 'false' : 'true');
        });

        // đóng thẻ khi click ngoài vùng
        document.addEventListener('click', (e) => {
            if (!popup.contains(e.target) && !btn.contains(e.target)) {
                popup.classList.remove('show');
                btn.setAttribute('aria-expanded', 'false');
                popup.setAttribute('aria-hidden', 'true');
            }
        });

        // đóng Escape
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                popup.classList.remove('show');
                btn.setAttribute('aria-expanded', 'false');
                popup.setAttribute('aria-hidden', 'true');
            }
        });
    })();
</script>


</body>
</html>
