<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách địa chỉ</title>

    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<style>
    /* Khối bao của trang phần body */
    .mainContainer-theme {
        font-family: Tahoma, Arial, sans-serif;
        color: #222;
        background: #fff;
        padding: 40px 0 80px;
        box-sizing: border-box;
    }

    /* tiêu đề*/
    .layout-infor-account h1 {
        font-size: 40px;
        font-weight: 800;
        margin: 6px 0 18px;
        text-align: center;
        letter-spacing: 0.5px;
    }

    /*Thanh gạch nhỏ dưới tiêu đề */
    .layout-infor-account::after {
        content: "";
        display: block;
        width: 60px;
        height: 4px;
        background: #2f2f2f;
        margin: 10px auto 0;
        border-radius: 2px;
        opacity: 0.9;
    }

    /* Sidebar */
    .sidebar-account {
        width: 22%;
        float: left;
        padding-left: 60px;
        box-sizing: border-box;
    }

    .AccountSidebar {
        position: sticky;
        top: 120px; /* khoảng cách từ mép trên*/
    }

    /*Kc phía trên với AccountSidebar*/
    .AccountTitle.titleSidebar {
        font-size: 17px;
        letter-spacing: 1px;
        font-weight: 700;
        text-transform: uppercase;
        margin-bottom: 18px;
    }

    /* danh sách liên kết */
    .AccountList ul {
        padding-left: 0;
        margin: 0;
    }

    .AccountList li {
        list-style: none;
        margin: 8px 0;
        padding-left: 8px;
        position: relative;
        color: #666;
        font-size: 15px;
    }

    .AccountList li::before {
        content: "◦";
        color: #c9b29b;
        position: absolute;
        left: -16px;
        top: 0;
        font-size: 14px;
    }

    .AccountList li a {
        color: #6d6d6d;
        text-decoration: none; /*không hiện gạch chân*/
    }

    /*mục đang chọn*/
    .AccountList li.current a {
        color: #2c1c12;
        font-weight: 600;
    }


    /* dòng thông tin */
    #customer_sidebar p {
        margin: 12px 0;
        color: #444;
        font-size: 17px;
    }

    /*nhãn thông tin*/
    #customer_sidebar p span {
        display: inline-block;
        min-width: 110px; /* căn nhãn trước nội dung */
        font-weight: 700;
        color: #2c1c12;
    }


    /* --- Khối danh sách địa chỉ ----------------------------------------------- */
    .address-list-wrap {
        background: transparent;
        padding: 10px 0;
    }

    .title-detail {
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 16px;
        color: #2c1c12;
    }

    /* Item */
    .address-item {
        background: #fafafa;
        border: 1px solid #eee;
        margin-bottom: 12px;
        border-radius: 2px;
        box-shadow: none;
        overflow: hidden;
    }

    .address-item.default {
        background: #fff;
        border-color: #dfeef7;
        box-shadow: 0 0 0 4px rgba(212, 234, 245, 0.5);
    }

    /* Dải trên màu xanh nhạt (địa chỉ mặc định) */
    .address-item.default .address-item-head {
        background: #e6f4fb;
        padding: 12px 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid rgba(0, 0, 0, 0.03);
    }

    .address-item .address-item-head {
        padding: 10px 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    /* Tên người nhận */
    .address-item .name {
        font-size: 15px;
        color: #16384b;
        font-weight: 700;
    }

    .address-item .name span {
        font-weight: 600;
        color: #2c1c12;
        margin-left: 6px;
    }

    /* Nội dung */
    .address-item-body {
        padding: 14px;
        color: #555;
        font-size: 15px;
        line-height: 1.6;
    }

    /* Tag mặc định */
    .tag-default {
        color: #6b8aa1;
        font-weight: 600;
        margin-top: 8px;
    }

    /* Actions (icon edit/xóa) */
    .actions {
        display: flex;
        gap: 8px;
    }

    .btn-icon {
        background: transparent;
        border: 0;
        cursor: pointer;
        padding: 6px;
        border-radius: 4px;
    }

    .btn-icon:hover {
        background: rgba(0, 0, 0, 0.04);
    }

    /* Nút thêm địa chỉ mới (bên phải) */
    .new-address-wrap {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
    }

    .btn-add {
        background: #2c1c12;
        color: #fff;
        padding: 10px 18px;
        font-weight: 700;
        border-radius: 2px;
        cursor: pointer;
        margin-top: 8px;
        margin-right: 30px;

    }


    /*******************/


    /* Modal thêm địa chỉ (UI) */
    .address-modal {
        position: fixed;
        inset: 0;
        z-index: 9999;
        display: none;
        align-items: center;
        justify-content: center;
        font-family: inherit;
    }

    .address-modal.open {
        display: flex;
    }

    .address-modal-backdrop {
        position: absolute;
        inset: 0;
        background: rgba(0, 0, 0, 0.35);
        backdrop-filter: blur(1px);
    }

    .address-modal-panel {
        position: relative;
        width: 100%;
        max-width: 740px;
        margin: 24px;
        background: #fff;
        border-radius: 6px;
        overflow: hidden;
        box-shadow: 0 18px 40px rgba(0, 0, 0, 0.15);
        transform: translateY(6px);
    }

    /* header */
    .address-modal-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 18px 20px;
        background: #f8fafb;
        border-bottom: 1px solid #eee;
    }

    .address-modal-header h2 {
        margin: 0;
        font-size: 18px;
        color: #2c1c12;
        font-weight: 700;
    }

    .address-modal-close {
        background: transparent;
        border: 0;
        font-size: 26px;
        line-height: 1;
        cursor: pointer;
        color: #333;
    }

    /* body & form */
    .address-modal-body {
        padding: 18px 20px 24px;
        color: #444;
    }

    .address-form .form-group {
        margin-bottom: 14px;
    }

    .address-form label {
        display: block;
        font-weight: 600;
        margin-bottom: 6px;
        color: #2c1c12;
        font-size: 13px;
    }

    .address-form input[type="text"], .address-form input[type="email"] {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #e6e6e6;
        border-radius: 4px;
        font-size: 14px;
        background: #fff;
    }

    .address-form .row {
        margin-left: -8px;
        margin-right: -8px;
    }

    .address-form .col-12 {
        padding-left: 8px;
        padding-right: 8px;
    }

    /* actions */
    .form-actions {
        display: flex;
        gap: 10px;
        justify-content: flex-end;
        margin-top: 8px;
    }

    .btn-primary {
        background: #2c1c12;
        color: #fff;
        padding: 10px 16px;
        border-radius: 4px;
        border: 0;
        font-weight: 700;
        cursor: pointer;
    }

    .btn-secondary {
        background: #fff;
        color: #2c1c12;
        padding: 10px 14px;
        border-radius: 4px;
        border: 1px solid #ddd;
        cursor: pointer;
    }

    .checkbox{
        margin-top: 10px;
    }




</style>


<body>
<!-- Header chính -->
<header class="main-header">
    <div class="header-container">
        <!-- Logo -->
        <div class="logo">
            <a href="<c:url value='/TrangChu'/>">
                <img src="image/Header/logongucocNgon.png" alt="Ngũ cốc Ngon"><img/>
            </a>
        </div>

        <!-- Thanh tìm kiếm -->
        <div class="search-bar">
            <input type="text"
                   id="searchInput"
                   placeholder="Tìm kiếm sản phẩm..."
                   aria-label="Tìm kiếm">

            <button type="submit" id="searchBtn">
                <i class="icon_timkiem">
                    <img src="image/Header/icon_timkiem.png" alt="Tìm kiếm"/>
                </i>
            </button>
        </div>


        <!-- Menu điều hướng -->
        <nav class="main-nav">
            <ul>
                <li><a href="<c:url value='/TrangChu'/>">Trang chủ</a></li>
                <li><a href="<c:url value='/VeNgon'/>">Về Ngon</a></li>
                <li class="menu-sp">
                    <a href="${pageContext.request.contextPath}/SanPham-TatCa">Sản phẩm <span class="arrow">▾</span></a>

                    <ul class="dropdown-menu">
                        <li class="dropdown-item">
                            <a href="${pageContext.request.contextPath}/filter?categoryID=1">Ngũ cốc</a>
                        </li>
                        <li class="dropdown-item">
                            <a href="${pageContext.request.contextPath}/filter?categoryID=3">Hạt dinh dưỡng</a>
                        </li>
                        <li class="dropdown-item">
                            <a href="${pageContext.request.contextPath}/filter?categoryID=2">Bánh dinh dưỡng</a>
                        </li>
                        <li class="dropdown-item">
                            <a href="${pageContext.request.contextPath}/filter?categoryID=4">Trà gạo lứt</a>
                        </li>
                    </ul>

                </li>

                <li><a href="${pageContext.request.contextPath}/News">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/CongTacVien">Cộng tác viên</a></li>
                <li><a href="${pageContext.request.contextPath}/LienHe">Liên hệ</a></li>
            </ul>
        </nav>


        <!-- Biểu tượng tài khoản và giỏ hàng -->
        <div class="user-actions">

            <c:choose>

                <c:when test="${not empty sessionScope.user}">
                    <a href="javascript:void(0)" class="account-btn" aria-label="Tài khoản">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 11C14.2091 11 16 9.20914 16 7
                             C16 4.79086 14.2091 3 12 3
                             C9.79086 3 8 4.79086 8 7
                             C8 9.20914 9.79086 11 12 11ZM12 13
                             C8.68629 13 4 14.5714 4 17V19H20V17
                             C20 14.5714 15.3137 13 12 13Z"
                                  fill="#333"/>
                        </svg>
                    </a>

                    <div id="accountMenu" class="account-menu">
                        <div class="account-menu_arrow"></div>
                        <div class="account-menu_inner">
                            <p class="account-menu_hello">
                                Xin chào, <strong>${sessionScope.user.fullName}</strong>
                            </p>
                            <hr>
                            <a href="<c:url value='/TaiKhoanCuaBan'/>" class="account-menu_link">Thông tin tài khoản</a>
                            <a href="<c:url value='/DangXuat'/>" class="account-menu_link">Đăng xuất</a>
                        </div>
                    </div>
                </c:when>


                <c:otherwise>
                    <a href="<c:url value='/DangNhapTaiKhoan'/>"
                       class="account-btn" aria-label="Tài khoản">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 11C14.2091 11 16 9.20914 16 7
                             C16 4.79086 14.2091 3 12 3
                             C9.79086 3 8 4.79086 8 7
                             C8 9.20914 9.79086 11 12 11ZM12 13
                             C8.68629 13 4 14.5714 4 17V19H20V17
                             C20 14.5714 15.3137 13 12 13Z"
                                  fill="#333"/>
                        </svg>
                    </a>
                </c:otherwise>

            </c:choose>

            <!-- CART -->
            <a href="GioHang" class="cart-btn" aria-label="Giỏ hàng">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                     viewBox="0 0 24 24" fill="none"
                     stroke="black" stroke-width="2"
                     stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a1 1 0 0 0 .99.81h9.66
                     a1 1 0 0 0 .98-.8l1.7-8.2H6"></path>
                </svg>
                <c:if test="${sessionScope.cart != null && sessionScope.cart.totalQuantity > 0}">
                    <span class="cart-count">
                            ${sessionScope.cart.totalQuantity}
                    </span>
                </c:if>
            </a>

        </div>

    </div>

</header>

<!--Body trang------------------------------------------------------->

<main class="mainContainer-theme">
    <div class="layout-infor-account text-center">
        <h1>Danh sách địa chỉ</h1>
    </div>

    <div class="container-fluid">
        <!-- Row chứa 3 cột: sidebar | danh sách địa chỉ | nút thêm -->
        <div class="row align-items-start">

            <!-- SIDEBAR (col-left) -->
            <aside class="col-12 col-md-3 sidebar-account">
                <div class="AccountSidebar">
                    <h3 class="AccountTitle titleSidebar">Tài khoản</h3>
                    <div class="AccountContent">
                        <div class="AccountList">
                            <ul class="list-unstyled">
                                <li><a href="<c:url value='/TaiKhoanCuaBan'/>">Thông tin tài khoản</a></li>
                                <li class="current"><a href="<c:url value='/DanhSachDiaChi'/>">Danh sách địa chỉ</a></li>
                                <li class="last"><a href="<c:url value='/DangXuat'/>">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </aside>

            <!-- DANH SÁCH ĐỊA CHỈ (col-middle) -->
            <section class="col-12 col-md-6">
                <div class="address-list-wrap">
                    <p class="title-detail d-md-none">Danh sách địa chỉ</p>

                    <c:forEach var="a" items="${addresses}">
                        <article class="address-item ${a.isDefault == 1 ? 'default' : ''}">
                            <div class="address-item-head">
                                <strong class="name">
                                    Người nhận: <span>${a.recipientName}</span>
                                </strong>

                                <div class="actions">
                                    <!-- SỬA -->
                                    <button class="btn-icon edit"
                                            data-id="${a.id}"
                                            data-name="${a.recipientName}"
                                            data-phone="${a.phoneNumber}"
                                            data-street="${a.street}"
                                            data-province="${a.province}"
                                            data-district="${a.district}"
                                            data-ward="${a.ward}"
                                            data-default="${a.isDefault}">
                                        ✏
                                    </button>

                                    <!-- XÓA -->
                                    <form action="XoaDiaChi" method="post" style="display:inline">
                                        <input type="hidden" name="id" value="${a.id}">
                                        <button class="btn-icon delete" onclick="return confirm('Bạn muốn xóa địa chỉ này?')">
                                            ✖
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <div class="address-item-body">
                                <p>
                                    <strong>Địa chỉ:</strong>
                                        ${a.street}, ${a.ward}, ${a.district}, ${a.province}
                                </p>
                                <p>
                                    <strong>Số điện thoại:</strong> ${a.phoneNumber}
                                </p>

                                <c:if test="${a.isDefault == 1}">
                                    <p class="tag-default">(Địa chỉ mặc định)</p>
                                </c:if>
                            </div>
                        </article>
                    </c:forEach>

                    <!-- KHÔNG CÓ ĐỊA CHỈ -->
                    <c:if test="${empty addresses}">
                        <p>Chưa có địa chỉ nào.</p>
                    </c:if>
                </div>
            </section>


            <!-- NÚT NHẬP ĐỊA CHỈ MỚI (col-right) -->
            <aside class="col-12 col-md-3 d-flex align-items-start justify-content-center">
                <div class="new-address-wrap w-100 text-md-center">
                    <button id="btn-add-address" class="btn-add">NHẬP ĐỊA CHỈ MỚI</button>
                </div>
            </aside>

        </div> <!-- .row -->
    </div> <!-- .container-fluid -->
</main>






<!-- BEGIN: Box cập nhật địa chỉ (UI only) -->
<div id="edit-address-modal" class="address-modal" aria-hidden="true" role="dialog">
    <div class="address-modal-backdrop" data-close="true"></div>

    <div class="address-modal-panel" role="document" aria-labelledby="edit-address-modal-title">
        <header class="address-modal-header">
            <h2 id="edit-address-modal-title">Cập nhật địa chỉ</h2>
            <button class="address-modal-close" aria-label="Đóng" data-close="true">&times;</button>
        </header>

        <div class="address-modal-body">
            <form class="address-form"
                  id="editAddressForm"
                  action="CapNhatDiaChi"
                  method="post">

                <!-- ID địa chỉ (ẩn) -->
                <input type="hidden" name="id" id="edit_id">

                <div class="row">
                    <div class="col-12 col-md-6 form-group">
                        <label>Họ tên</label>
                        <input type="text" name="recipientName" id="edit_name" required />
                    </div>

                    <div class="col-12 col-md-6 form-group">
                        <label>Số điện thoại</label>
                        <input type="text" name="phoneNumber" id="edit_phone" required />
                    </div>
                </div>

                <div class="form-group">
                    <label>Địa chỉ (số nhà, đường)</label>
                    <input type="text" name="street" id="edit_address" required />
                </div>

                <div class="row">
                    <div class="col-12 col-md-4 form-group">
                        <label>Tỉnh/Thành</label>
                        <input type="text" name="province" id="edit_province" required />
                    </div>

                    <div class="col-12 col-md-4 form-group">
                        <label>Quận/Huyện</label>
                        <input type="text" name="district" id="edit_district" required />
                    </div>

                    <div class="col-12 col-md-4 form-group">
                        <label>Phường/Xã</label>
                        <input type="text" name="ward" id="edit_ward" required />
                    </div>
                </div>

                <div class="form-group default-checkbox">
                    <label>
                        <input type="checkbox" name="is_default" id="edit_is_default" value="1">
                        Đặt làm địa chỉ mặc định
                    </label>
                </div>

                <div class="form-actions">
                    <button type="button" class="btn-secondary" data-close="true">Hủy</button>
                    <button type="submit" class="btn-primary">Cập Nhật</button>
                </div>
            </form>

        </div>
    </div>
</div>
<!-- END: Box cập nhật địa chỉ -->







<!-- BEGIN: Box thêm địa chỉ (UI only) -->
<div id="address-modal" class="address-modal" aria-hidden="true" role="dialog">
    <div class="address-modal-backdrop" data-close="true"></div>

    <div class="address-modal-panel" role="document" aria-labelledby="address-modal-title">
        <header class="address-modal-header">
            <h2 id="address-modal-title">Nhập địa chỉ mới</h2>
            <button class="address-modal-close" aria-label="Đóng" data-close="true">&times;</button>
        </header>

        <div class="address-modal-body">
            <!--Form thêm địa chỉ mới-->
            <form class="address-form"
                  action="ThemDiaChi"
                  method="post">

                <div class="row">
                    <div class="col-12 col-md-6 form-group">
                        <label>Họ tên</label>
                        <input type="text"
                               name="recipientName"
                               placeholder="Nguyễn Văn A"
                               required />
                    </div>

                    <div class="col-12 col-md-6 form-group">
                        <label>Số điện thoại</label>
                        <input type="text"
                               name="phoneNumber"
                               placeholder="0123 456 789"
                               required />
                    </div>
                </div>

                <div class="form-group">
                    <label>Địa chỉ (số nhà, đường)</label>
                    <input type="text"
                           name="street"
                           placeholder="Số nhà, đường..."
                           required />
                </div>

                <div class="row">
                    <div class="col-12 col-md-4 form-group">
                        <label>Tỉnh/Thành</label>
                        <input type="text"
                               name="province"
                               placeholder="TP.HCM"
                               required />
                    </div>

                    <div class="col-12 col-md-4 form-group">
                        <label>Quận/Huyện</label>
                        <input type="text"
                               name="district"
                               placeholder="Quận..."
                               required />
                    </div>

                    <div class="col-12 col-md-4 form-group">
                        <label>Phường/Xã</label>
                        <input type="text"
                               name="ward"
                               placeholder="Phường..."
                               required />
                    </div>
                </div>

                <!-- Đặt làm địa chỉ mặc định -->
                <div class="form-group default-checkbox">
                    <label class="checkbox-label">
                        <input class="checkbox"
                               type="checkbox"
                               name="is_default"
                               value="1" />
                        <span class="checkbox-text">Đặt làm địa chỉ mặc định</span>
                    </label>
                </div>

                <div class="form-actions">
                    <button type="button" class="btn-secondary" data-close="true">
                        Hủy
                    </button>
                    <!-- PHẢI là submit -->
                    <button type="submit" class="btn-primary">
                        Lưu
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>
<!-- END: Box thêm địa chỉ -->


<!--Footer-->

<div class="main-footer-new">
    <!--section đăng kí nhận tin-->
    <section id="send-for-gmail" class="section section-for-email">

        <!--phần tử sẽ chiếm toàn bộ chiều ngang màn hình-->
        <!--thẻ div gồm các class sử dụng bootstrap chia 4 cột-->
        <div class="container-fluid">
            <div class="row flexAlignCenter flexJustiCenter">
                <div class="col-md-6 col-sm-12">
                    <h3 class="title">Đăng kí nhận tin</h3>
                    <p class="content">
                        Đăng ký Email để theo dõi những sản phẩm được giảm giá của chúng tôi.
                        <br>
                        Theo dõi fanpage Ngũ cốc Ngon để cập nhật thông tin mới nhất.
                    </p>
                </div>

                <div class="col-md-6 col-sm-12">
                    <div class="form-newsletter">
                        <form accept-charset="UTF-8" action="/account/contact" class="contact-form" method="post">
                            <input name="form_type" type="hidden" value="customer">
                            <input name="utf8" type="hidden" value="✓">
                            <div class="form-group">
                                <input type="hidden" id="newsletter_tags" name="contact[tags]"
                                       value="khách hàng tiềm năng, bản tin">
                                <input required="" type="email" value="" placeholder="Nhập email của bạn"
                                       name="contact[email]" aria-label="Email Address"
                                       class="inputNew form-control grey newsletter-input">
                                <button type="submit" class="button dark submitNewsletter"><span>Gửi</span></button>
                            </div>
                            <div class="sitebox-recaptcha hidden">
                                This site is protected by reCAPTCHA and the Google
                                <a href="https://policies.google.com/privacy" target="_blank"
                                   rel="noreferrer">Privacy Policy</a>
                                and <a href="https://policies.google.com/terms" target="_blank"
                                       rel="noreferrer">Terms of Service</a> apply.
                            </div>
                        </form>
                    </div>
                </div>


            </div>

        </div>
    </section>


    <!-- Footer chính -->

    <footer class="main-footer footer">
        <div class="footer-middle">
            <div class="container-fluid">
                <div class="footer-middle-container">

                    <div class="row">
                        <!-- Cột 1: Giới thiệu -->
                        <div class="footer-about ft-col col-md-3 col-sm-6 col-xs-12">
                            <div class="logo-footer">
                                <a href="TrangChu" title="Ngũ cốc Ngon" aria-label="logo shop footer">
                                    <img src="image/Header/logongucocNgon.png" height="100px" width="250px"
                                         alt="Ngũ cốc Ngon">
                                </a>
                            </div>
                            <p>Công ty TNHH Phát triển Nông nghiệp Xanh Ngon<br>
                                ĐC: Dĩ An, TP.HCM<br>
                                ĐT: 0357250466<br>
                                Email: ngucocNgon@gmail.com<br>
                                Giấy CNĐKKD: 34472346746(23/2/2025)</p>
                            <div class="logo-footer-bct">

                                <img src="https://theme.hstatic.net/200000759239/1001104497/14/logo_bct.png?v=330"
                                     height="70px" width="150px" alt="Bộ Công Thương">

                            </div>
                        </div>

                        <!-- Cột 2: Hỗ trợ khách hàng -->
                        <div class="boxlink ft-col col-md-3 col-sm-6 col-xs-12">
                            <h3 class="footer-title">HỖ TRỢ KHÁCH HÀNG</h3>
                            <ul>
                                <li><a href="TimKiem" title="Tìm kiếm">Tìm kiếm</a></li>
                                <li><a href="ChinhSachDoiTra" title="Chính sách đổi trả">Chính sách đổi
                                    trả</a></li>
                                <li><a href="ChinhSachBaoMat" title="Chính sách bảo mật">Chính sách bảo
                                    mật</a></li>
                                <li><a href="DieuKhoanDichVu" title="Điều khoản dịch vụ">Điều khoản dịch
                                    vụ</a></li>
                                <li><a href="ChinhSachThanhToan"
                                       title="Chính sách thanh toán">Chính sách thanh toán</a></li>

                            </ul>
                        </div>

                        <!-- Cột 3: Kết nối nhanh -->
                        <div class="boxlink ft-col col-md-3 col-sm-6 col-xs-12">
                            <h3 class="footer-title">KẾT NỐI NHANH</h3>
                            <ul>
                                <li><a href="TrangChu" title="Trang chủ">Trang chủ</a></li>
                                <li><a href="VeNgon" title="Ngon">Ngon</a></li>
                                <li><a href="SanPham-TatCa" title="Sản phẩm">Sản phẩm</a></li>
                                <li><a href="TinTuc" title="Tin tức">Tin tức</a></li>
                                <li><a href="CongTacVien" title="Cộng tác viên">Cộng tác viên</a></li>
                                <li><a href="LienHe" title="Liên hệ">Liên hệ</a></li>
                            </ul>
                        </div>

                        <!-- Cột 4: Liên hệ và mạng xã hội -->
                        <div class="boxphone ft-col col-md-3 col-sm-6 col-xs-12">
                            <h3 class="footer-title">CHĂM SÓC KHÁCH HÀNG</h3>
                            <p class="fter-hotline">
                                <a href="tel:0357250466" rel="nofollow">0357 250 466</a>
                            </p>
                            <h3 class="footer-title">THEO DÕI CHÚNG TÔI</h3>
                            <ul class="shop_social">
                                <li class="facebook_social">
                                    <a href="#" target="_blank" rel="noreferrer" title="Facebook"
                                       aria-label="Facebook">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li class="instagram_social">
                                    <a href="#" target="_blank" rel="noreferrer" title="Instagram"
                                       aria-label="Instagram">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                                <li class="youtube_social">
                                    <a href="#" target="_blank" rel="noreferrer" title="Youtube"
                                       aria-label="Youtube">
                                        <i class="fa fa-youtube-play"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--back to top bootstrap-->
        <button onclick="window.scrollTo({ top: 0, behavior: 'smooth' });"
                id="btn-back-to-top"
                class="btn btn-success btn-lg">
            ↑
        </button>

        <div class="footer-copyright text-center">
            <div class="container-fluid">
                <p>Copyright © 2025 <a href="<c:url value='/TrangChu'/>">Ngũ cốc Ngon</a>. Powered by <a href="#" target="_blank"
                                                                                           rel="noreferrer">Team 18</a></p>
            </div>
        </div>
    </footer>
</div>

<!--back to top (bootstrap) js-->
<script>
    const backToTopBtn = document.getElementById("btn-back-to-top");

    window.addEventListener("scroll", function () {
        if (window.scrollY > 300) {
            backToTopBtn.style.display = "block";
        } else {
            backToTopBtn.style.display = "none";
        }
    });
</script>


<script>
    (function () {
        // open modal khi nhấn ô "NHẬP ĐỊA CHÍ MỚI"
        var openBtn = document.getElementById('btn-add-address');
        var modal = document.getElementById('address-modal');

        if (openBtn && modal) {
            openBtn.addEventListener('click', function (e) {
                e.preventDefault();
                modal.classList.add('open');
                modal.setAttribute('aria-hidden', 'false');
                // focus vào first input
                setTimeout(function () {
                    var first = modal.querySelector('input');
                    if (first) first.focus();
                }, 120);
            });

            // close thẻ vs data-close="true"
            modal.addEventListener('click', function (e) {
                if (e.target && e.target.dataset && e.target.dataset.close !== undefined) {
                    modal.classList.remove('open');
                    modal.setAttribute('aria-hidden', 'true');
                }
            });

            // close khi ESC
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    modal.classList.remove('open');
                    modal.setAttribute('aria-hidden', 'true');
                }
            });
        }
    })();
</script>



<script>
    document.addEventListener('DOMContentLoaded', function () {

        // Mở modal sửa địa chỉ khi bấm Edit
        document.querySelectorAll('.btn-icon.edit').forEach(function(btn){
            btn.addEventListener('click', function(e){
                e.preventDefault();

                var editModal = document.getElementById('edit-address-modal');
                if(editModal){
                    editModal.classList.add('open');
                    editModal.setAttribute('aria-hidden','false');
                }
            });
        });

        // Đóng modal khi bấm nút close hoặc backdrop
        document.querySelectorAll('#edit-address-modal [data-close]').forEach(function(el){
            el.addEventListener('click', function(){
                var modal = document.getElementById('edit-address-modal');
                if(modal){
                    modal.classList.remove('open');
                    modal.setAttribute('aria-hidden','true');
                }
            });
        });

    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const accountBtn = document.querySelector('.account-btn');
        const accountMenu = document.getElementById('accountMenu');

        if (!accountBtn || !accountMenu) return;

        // Click icon → toggle dropdown
        accountBtn.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            accountMenu.classList.toggle('show');
        });

        // Click ra ngoài → đóng
        document.addEventListener('click', (e) => {
            if (
                accountMenu.classList.contains('show') &&
                !accountMenu.contains(e.target) &&
                !accountBtn.contains(e.target)
            ) {
                accountMenu.classList.remove('show');
            }
        });
    });

</script>
<script>
    document.querySelectorAll('.btn-icon.edit').forEach(btn => {
        btn.addEventListener('click', () => {

            document.getElementById('edit_id').value = btn.dataset.id;

            document.getElementById('edit_name').value = btn.dataset.name;
            document.getElementById('edit_phone').value = btn.dataset.phone;
            document.getElementById('edit_address').value = btn.dataset.street;
            document.getElementById('edit_province').value = btn.dataset.province;
            document.getElementById('edit_district').value = btn.dataset.district;
            document.getElementById('edit_ward').value = btn.dataset.ward;

            document.getElementById('edit_is_default').checked =
                btn.dataset.default === "1";

            document.getElementById('edit-address-modal')
                .setAttribute('aria-hidden', 'false');
        });
    });
</script>

<script>
    document.getElementById("searchBtn").addEventListener("click", function (e) {
        e.preventDefault();

        const keyword = document.getElementById("searchInput").value.trim();

        if (keyword === "") {
            alert("Vui lòng nhập từ khóa tìm kiếm");
            return;
        }

        // redirect sang servlet / trang tìm kiếm
        window.location.href = "TimKiem?q=" + encodeURIComponent(keyword);
    });

    // nhấn Enter cũng tìm
    document.getElementById("searchInput").addEventListener("keydown", function (e) {
        if (e.key === "Enter") {
            e.preventDefault();
            document.getElementById("searchBtn").click();
        }
    });
</script>

</body>


</html>