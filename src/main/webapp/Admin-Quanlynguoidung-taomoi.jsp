<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin-Tạo mới</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

</head>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Tahoma", sans-serif, Arial;
    }

    body {
        background-color: #f4f7fb;
    }

    .container {
        display: flex;
        height: 100vh;
    }

    /* === SIDEBAR === */
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

    .submenu-toggle {
        width: 100%;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .has-submenu {
        flex-direction: column;
        align-items: flex-start;
        position: relative;
        opacity: 0.6;
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
        gap: 8px;
    }

    .arrow {
        margin-left: auto;
        transition: 0.3s;
    }

    .has-submenu.open .arrow {
        transform: rotate(180deg);
    }


    /* === MAIN === */
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

    /* breadcrumb */
    .breadcrumb {
        font-size: 16px;
        color: #007bff;
        margin-top: 20px;
        margin-left: 20px;
    }

    .breadcrumb span {
        margin: 0 5px;
    }

    /* mặc định: các icon và link mờ */
    .menu a, .menu i {
        opacity: 0.6;
    }

    /* mục active: sáng rõ hơn */
    .menu a.active, .fa-solid.fa-user {
        opacity: 1;
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


    /* Wrapper layout */
    .create-wrap {
        width: 100%;
        box-sizing: border-box;
        padding: 12px 20px;
        margin: 10px 0 40px;
    }


    .create-left {
        flex: 0 0 25%;
        max-width: 25%;
        box-sizing: border-box;
        padding-right: 8px;
    }

    .create-left .card {
        padding: 18px;
        background: #fff;
        border: 1px solid #e7ecf2;
        border-radius: 8px;
        box-shadow: 0 6px 18px rgba(11, 20, 35, 0.03);
        text-align: center;
    }

    .create-left .avatar {
        width: 140px;
        height: 140px;
        border-radius: 50%;
        object-fit: cover;
        border: 6px solid #eef3f6;
        box-shadow: 0 6px 18px rgba(11, 20, 35, 0.06);
        display: block;
        margin: 6px auto 12px;
    }

    .create-left .btn-upload {
        width: 100%;
        padding: 8px 10px;
        border-radius: 6px;
        border: 1px solid #d1e0ea;
        background: #fff;
        color: #333;
        display: inline-block;
    }

    .create-right {
        flex: 1 1 0%;
        max-width: 100%;
        box-sizing: border-box;
        padding-left: 8px;
    }

    .create-right .card {
        padding: 18px;
        background: #fff;
        border: 1px solid #e7ecf2;
        border-radius: 8px;
        box-shadow: 0 6px 18px rgba(11, 20, 35, 0.03);
    }

    .create-right h5 {
        font-size: 18px;
        margin-bottom: 12px;
        font-weight: 600;
        color: #1f2937;
    }

    /*Form Thông tin*/
    .create-right .form-control,
    .create-right input[type="text"],
    .create-right input[type="email"],
    .create-right input[type="password"],
    .create-right input[type="tel"],
    .create-right textarea,
    .create-right select {
        display: block;
        width: 100%;
        padding: 8px 12px;
        height: 40px;
        border: 1px solid #d6e0ea !important;
        border-radius: 6px !important;
        box-sizing: border-box;
        background: #fff;
        font-size: 14px;
        color: #111;
        margin-top: 10px;
        margin-bottom: 5px;
    }

    /* Radio  */
    .create-right .form-check {
        margin-right: 14px;
    }

    /* Button */
    .btn-save {
        background: #0aa0e6;
        color: #fff;
        border: none;
        padding: 8px 14px;
        border-radius: 6px;
        font-weight: 600;
        margin-right: 8px;
        margin-top: 15px;
        margin-left: 10px;

    }

    /*ghi chú nhỏ (kích thước đề xuất)*/
    .create-left .small-muted {
        font-size: 12px;
        color: #6b7280;
        margin-top: 8px;
    }


</style>

<body>

<div class="container">

    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="admin-info">
                <i class="fa fa-user"></i>
                <span>Admin</span>
            </div>
        </div>

        <ul class="menu">
            <li><i class="fa-solid fa-home"></i><a href="<c:url value='/AdminDashboard'/>">Bảng điều khiển</a></li>
            <hr>

            <li class="has-submenu">
                <div class="submenu-toggle">
                    <i class="fa-solid fa-box"></i>
                    <span>Sản phẩm</span>
                    <i class="fa-solid fa-chevron-down arrow"></i>
                </div>
                <ul class="submenu">
                    <li><i class="fa-solid fa-list"></i> <a href="${pageContext.request.contextPath}/AdminCategory">Danh mục</a></li>
                    <li><i class="fa-solid fa-boxes-stacked"></i> <a href="${pageContext.request.contextPath}/AdminProduct">Sản phẩm</a></li>
                </ul>
            </li>
            <hr>

            <li><i class="fa-solid fa-file-lines"></i> <a href="${pageContext.request.contextPath}/AdminNews">Bài viết</a></li>
            <hr>

            <li><i class="fa-solid fa-user"></i> <a href="<c:url value='/AdminUser'/>" class="active">Người dùng</a></li>
            <hr>

            <li style="opacity: 0.6"> <i class="fa-solid fa-shopping-cart"></i><a href="${pageContext.request.contextPath}/AdminOrder">Đơn hàng</a></li>
            <hr>
            <li style="opacity: 0.6"> <i class="fa-solid fa-tag"></i><a href="${pageContext.request.contextPath}/AdminDiscount">Mã giảm giá</a></li>
            <hr>

        </ul>
    </aside>


    <!-- ===== MAIN CONTENT ===== -->
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


        <div class="breadcrumb">
            <span>Trang chủ</span> /
            <span>Người dùng</span> /
            <span>Tạo mới</span>

        </div>


        <!--Form nhập dữ liệu-->
        <div class="create-wrap container-fluid">
            <div class="row g-3">



                <div class="col-md-9 create-right">
                    <div class="card p-4">
                        <h5>Thông tin người dùng</h5>

                        <form class="row g-3"
                              action="<c:url value='/AdminCreateUser'/>"
                              method="post">

                            <div class="col-12">
                                <label class="form-label">Họ và tên <span class="text-danger">(*)</span></label>
                                <input class="form-control"
                                       type="text"
                                       name="fullName"
                                       placeholder="Họ và tên"
                                       required>
                            </div>

                            <div class="col-12">
                                <label class="form-label">Email <span class="text-danger">(*)</span></label>
                                <input class="form-control"
                                       type="email"
                                       name="email"
                                       placeholder="Email"
                                       required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Mật khẩu <span class="text-danger">(*)</span></label>
                                <input class="form-control"
                                       type="password"
                                       name="password"
                                       placeholder="Mật khẩu"
                                       required
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}$"
                                       title="Mật khẩu ≥ 8 ký tự, gồm chữ, số và ký tự đặc biệt">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Phone <span class="text-danger">(*)</span></label>
                                <input class="form-control"
                                       type="tel"
                                       name="phone"
                                       placeholder="Phone"
                                       required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Vai trò</label>
                                <select name="role" class="form-control">
                                    <option value="user" selected>Người dùng</option>
                                    <option value="admin">Quản trị viên</option>
                                </select>
                            </div>

                            <div class="col-12">
                                <label class="form-label d-block">Trạng thái</label>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input"
                                           type="radio"
                                           name="status"
                                           value="active"
                                           checked>
                                    <label class="form-check-label">Hoạt động</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input"
                                           type="radio"
                                           name="status"
                                           value="blocked">
                                    <label class="form-check-label">Đã khóa</label>
                                </div>
                            </div>

                            <div class="col-12 mt-2">
                                <button type="submit" class="btn-save btn">
                                    <i class="fa fa-floppy-disk me-2"></i> Lưu dữ liệu
                                </button>
                            </div>

                        </form>



                    </div>
                </div>

            </div>
        </div>


    </main>


</div>

</body>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const submenuToggles = document.querySelectorAll(".submenu-toggle");

        submenuToggles.forEach((toggle) => {
            toggle.addEventListener("click", function () {
                const parent = this.closest(".has-submenu");
                parent.classList.toggle("open");
            });
        });
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
</html>