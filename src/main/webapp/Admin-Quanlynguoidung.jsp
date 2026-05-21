<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Quản lý người dùng</title>
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


    /* === USER TABLE ================================== */
    .user-section {
        padding: 20px;
    }

    .user-card {
        background: #fff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    }

    .user-card h3 {
        font-size: 20px;
        margin-bottom: 15px;
    }

    .btn-create {
        background-color: #03a9f4;
        border: none;
        color: white;
        padding: 8px 14px;
        border-radius: 6px;
        font-size: 15px;
        cursor: pointer;
        float: right;
        margin-top: -38px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    th {
        background: #f1f1f1;
    }

    .action-btn {
        border: none;
        padding: 8px 10px;
        border-radius: 6px;
        cursor: pointer;
        color: white;
        margin-right: 6px;
    }


    .delete-btn {
        background-color: #e63946;
    }

    .edit-btn {
        background-color: #2196f3;
    }


    /************* CSS cập nhật thông tin tk **********************/
    /* ===== Modal cập nhật thông tin tk ===== */
    .modal {
        position: fixed;
        inset: 0;
        display: none;
        background: rgba(0, 0, 0, .45);
        z-index: 1000;
    }

    .modal.show {
        display: block;
    }

    .modal__panel {
        width: 520px;
        max-width: calc(100% - 24px);
        background: #fff;
        border-radius: 10px;
        margin: 6vh auto;
        box-shadow: 0 16px 40px rgba(0, 0, 0, .18);
        overflow: hidden;
        animation: zoomIn .12s ease;
    }

    @keyframes zoomIn {
        from {
            transform: scale(.98);
            opacity: 0
        }
        to {
            transform: scale(1);
            opacity: 1
        }
    }

    .modal__header {
        padding: 14px 18px;
        background: #03a9f4;
        color: #fff;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .modal__close {
        background: transparent;
        border: 0;
        color: #fff;
        font-size: 28px;
        line-height: 1;
        cursor: pointer;
    }

    .modal__body {
        padding: 16px 18px 6px;
    }

    .form-row {
        display: flex;
        flex-direction: column;
        gap: 6px;
        margin-bottom: 12px;
    }

    .form-row label {
        font-weight: 600;
        font-size: 14px;
        color: #333;
    }

    .form-row input, .form-row select {
        border: 1px solid #dfe5eb;
        border-radius: 8px;
        padding: 10px 12px;
        font-size: 14px;
    }

    .modal__footer {
        padding: 12px 18px 16px;
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }

    .btn {
        padding: 10px 16px;
        border-radius: 8px;
        border: 1px solid transparent;
        cursor: pointer;
        font-weight: 600;
    }

    .btn--light {
        background: #fff;
        border-color: #d1d9df;
    }

    .btn--primary {
        background: #03a9f4;
        color: #fff;
    }

    .btn--primary:hover {
        background: #028ad0;
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
            <li><i class="fa-solid fa-home"></i><a href="${pageContext.request.contextPath}/AdminDashboard">Bảng điều khiển</a></li>
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

            <li><i class="fa-solid fa-user"></i> <a href="${pageContext.request.contextPath}/AdminUser" class="active">Người dùng</a></li>
            <hr>
            <li style="opacity: 0.6"><i class="fa-solid fa-shopping-cart"></i><a href="${pageContext.request.contextPath}/AdminOrder">Đơn
                hàng</a></li>
            <hr>
            <li style="opacity: 0.6"><i class="fa-solid fa-tag"></i><a href="${pageContext.request.contextPath}/AdminDiscount">Mã giảm giá</a>
            </li>
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
            <span>Người dùng</span>
        </div>

        <section class="user-section">
            <div class="user-card">
                <h3>Danh sách người dùng</h3>
                <a href="<c:url value='/AdminCreateUser'/>">
                    <button class="btn-create"><i class="fa fa-plus"></i> Tạo mới</button>
                </a>
                <table>
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Trạng thái</th>
                        <th>Hoạt động</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="u" items="${users}" varStatus="st">
                        <tr data-id="${u.id}">
                            <td>${st.count}</td>
                            <td>${u.fullName}</td>
                            <td>${u.email}</td>
                            <td>${u.phoneNumber}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.active}">
                                        Hoạt động
                                    </c:when>
                                    <c:otherwise>
                                        Đã khóa
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <button class="action-btn edit-btn"
                                        data-id="${u.id}"
                                        data-fullname="${u.fullName}"
                                        data-email="${u.email}"
                                        data-phone="${u.phoneNumber}"
                                        data-active="${u.active}">
                                    <i class="fa fa-pen"></i>
                                </button>
                                <button class="action-btn delete-btn"
                                        data-id="${u.id}">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </section>

    </main>
</div>

<!-- modal: Cập nhật người dùng -->
<div id="editUserModal" class="modal">
    <div class="modal__panel">
        <div class="modal__header">
            <h3>Cập nhật thông tin người dùng</h3>
            <button class="modal__close" type="button" aria-label="Đóng">&times;</button>
        </div>

        <form id="editUserForm"
              action="${pageContext.request.contextPath}/AdminUpdateUser"
              method="post"
              class="modal__body">

            <input type="hidden" name="id"/>

            <div class="form-row">
                <label>Họ tên</label>
                <input type="text" name="fullname" required/>
            </div>

            <div class="form-row">
                <label>Email</label>
                <input type="email" name="email" readonly/>
            </div>

            <div class="form-row">
                <label>Phone</label>
                <input type="text" name="phone"/>
            </div>

            <div class="form-row">
                <label>Trạng thái</label>
                <select name="status">
                    <option value="active">Hoạt động</option>
                    <option value="blocked">Đã khóa</option>
                </select>
            </div>


            <div class="modal__footer">
                <button type="button" class="btn btn--light" data-cancel>Hủy</button>
                <button type="submit" class="btn btn--primary">Lưu</button>
            </div>
        </form>
    </div>
</div>


<!--hiển thị thanh xổ xuống mục sản phẩm-->
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

<!--hiển thị box tk đăng nhập-->
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

<!-- hiện modal cập nhật thông tin người dùng-->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const modal = document.getElementById('editUserModal');
        const form = document.getElementById('editUserForm');
        const btnClose = modal.querySelector('.modal__close');
        const btnCancel = modal.querySelector('[data-cancel]');
        const tbody = document.querySelector('table tbody');

        /*  open / close modal */
        const openModal = () => modal.classList.add('show');
        const closeModal = () => modal.classList.remove('show');

        /* EDIT USER*/
        tbody.addEventListener('click', function (e) {
            const btn = e.target.closest('.edit-btn');
            if (!btn) return;

            // lấy data từ button
            const {id, fullname, email, phone, active} = btn.dataset;

            // đổ vào form
            form.dataset.userId = id;
            form.fullname.value = fullname || '';
            form.email.value = email || '';
            form.phone.value = phone || '';
            form.status.value = active === 'true' ? 'active' : 'blocked';

            openModal();
        });

        /*  CLOSE MODAL */
        btnClose.addEventListener('click', closeModal);
        btnCancel.addEventListener('click', closeModal);

        modal.addEventListener('click', function (e) {
            if (e.target === modal) closeModal();
        });

        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') closeModal();
        });

        /* SUBMIT UPDATE USER*/
        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const id = form.dataset.userId;

            const data = new URLSearchParams({
                id: id,
                fullname: form.fullname.value,
                phone: form.phone.value,
                status: form.status.value
            });

            fetch('${pageContext.request.contextPath}/AdminUpdateUser', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: data.toString()
            }).then(() => location.reload());
        });

        /* DELETE USER  */
        tbody.addEventListener('click', function (e) {
            const btn = e.target.closest('.delete-btn');
            if (!btn) return;

            if (!confirm('Bạn chắc chắn muốn xóa người dùng này?')) return;

            const id = btn.dataset.id;

            fetch('${pageContext.request.contextPath}/AdminDeleteUser', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: 'id=' + id
            })
                .then(() => location.reload());
        });
    });
</script>


</body>
</html>
