<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý bán hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
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
        opacity: 0.6;
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

    .breadcrumb .current {
        color: #777;
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

    .button-wrap {
        display: flex;
        justify-content: right;
    }

    .new-post {
        background-color: #03a9f4;
        font-size: 15px;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 3px;
        margin-bottom: 10px;
    }

    .new-post:hover {
        background-color: #007bff;
        cursor: pointer;
    }

    .cate {
        display: flex;
    }

    .cate li {
        list-style-type: none;
        border: 1px solid #888;
        padding: 15px 0;
    }

    /* Chiều rộng từng cột */
    .cate-stt {
        width: 120px;
        text-align: center;
        font-weight: bold;
    }

    .cate-item {
        width: 260px;
        text-align: center;
        font-weight: bold;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    /* Thumbnail */
    .cate-item img {
        width: 30px;
        height: 30px;
        object-fit: cover;
    }

    .thin li {
        font-weight: lighter;
    }

    .fa-pen {
        border: 1px solid #007bff;
        padding: 5px;
        color: white;
        background-color: #007bff;
        border-radius: 3px;
    }

    .fa-trash {
        border: 1px solid red;
        padding: 5px;
        color: white;
        background-color: red;
        border-radius: 3px;
    }

    .fa-solid {
        cursor: pointer;
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
        top: 58px;
        /* vị trí popup cách top của header */
        right: 18px;
        /* căn vào cạnh phải header */
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

    .profile-popup .uemail,
    .profile-popup .uphone {
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
        padding: 8px 82px;
        border-radius: 6px;
        border: 1px solid #d1d9df;
        background: #fff;
        cursor: pointer;
        font-weight: 600;
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
                <li style="opacity: 0.6"><i class="fa-solid fa-home"></i><a href="${pageContext.request.contextPath}/AdminDashboard">Bảng điều
                        khiển</a></li>
                <hr>

                <li class="has-submenu" style="opacity: 0.6">
                    <div class="submenu-toggle">
                        <i class="fa-solid fa-box"></i>
                        <span>Sản phẩm </span>
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
                <li style="opacity: 0.6"> <i class="fa-solid fa-user"></i><a href="${pageContext.request.contextPath}/AdminUser">Người
                        dùng</a></li>
                <hr>
                <li style="opacity: 0.6"> <i class="fa-solid fa-shopping-cart"></i><a href="${pageContext.request.contextPath}/AdminOrder">Đơn hàng</a></li>
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
            <div id="profilePopup" class="profile-popup" role="dialog" aria-label="Thông tin tài khoản"
                aria-hidden="true">
                <div class="top">
                    <div class="avatar-large">
                        <img src="image/admin/images.jpg" alt="avatar">
                    </div>
                    <div class="uname">adminT</div>
                    <div class="uemail">adminT@gmail.com</div>
                    <div class="uphone">0357250466</div>
                </div>
                <div class="footer">
                    <button class="btn-logout" type="button">Đăng xuất</button>
                </div>
            </div>

            <!-- Breadcrumb -->
            <div class="breadcrumb">
                <span>Trang chủ</span>
                <span>/</span>
                <span>Bài viết</span>
                <span class="current">/</span>
                <span class="current">Danh sách</span>
            </div>

            <section class="dashboard">
                <div class="border-dashboard">
                    <div class="button-wrap">
                        <button class="new-post" onclick="window.location.href='${pageContext.request.contextPath}/AdminNewsCreate'">
                            + Tạo mới
                        </button>
                    </div>
                    <ul class="cate">
                        <li class="cate-stt">STT</li>
                        <li class="cate-item">Tiêu đề</li>
                        <li class="cate-item">Ngày đăng</li>
                        <li class="cate-item">Trạng thái</li>
                        <li class="cate-item">Hành động</li>
                    </ul>

                    <c:forEach items="${listNews}" var="n" varStatus="loop">
                        <ul class="cate thin">
                            <li class="cate-stt">${loop.index + 1}</li>
                            <li class="cate-item" style="text-align:left; padding-left:10px;">
                                    ${n.title}
                            </li>
                            <li class="cate-item">
                                <fmt:formatDate value="${n.datePost}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </li>
                            <li class="cate-item">
                    <span style="color: ${n.isPublished == 1 ? 'green' : 'gray'};">
                            ${n.statusText}
                    </span>
                            </li>
                            <li class="cate-item">
                                <a href="${pageContext.request.contextPath}/AdminNewsEdit?id=${n.id}">
                                    <i class="fa-solid fa-pen"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/AdminNewsDelete?id=${n.id}"
                                   onclick="return confirm('Bạn có chắc muốn xóa bài viết này?');">
                                    <i class="fa-solid fa-trash"></i>
                                </a>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </section>
        </main>
    </div>

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


</body>

</html>