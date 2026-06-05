<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>

    .main-detailProduct {
        font-family: 'Tahoma', Arial, sans-serif;
        color: #444;
        background-color: #fff;
    }

    /* --- Breadcrumb --- */
    /* Tối ưu breadcrumb: giảm chiều cao và không xuống dòng */
    .breadcrumb-bar {
        padding-top: 5px;
        /* giảm khoảng cách trên/dưới của thanh */
        padding-bottom: 5px;
        background: #f6efe3;
        border-bottom: 1px solid rgba(0, 0, 0, 0.04);
    }

    /* Mỗi item không có margin dày (tránh làm nội dung tràn xuống dưới)*/
    .breadcrumb-bar .breadcrumb .breadcrumb-item {
        margin: 0;
        padding: 0;
    }

    /* Dấu phân cách (nếu muốn điều chỉnh kích thước/màu) */
    .breadcrumb-bar .breadcrumb .breadcrumb-item+.breadcrumb-item::before {
        content: "/";
        /* đảm bảo ký tự phân cách luôn là / */
        margin: 0 6px;
        color: #8a7354;
        font-weight: 600;
    }

    /* Text các link và active */
    .breadcrumb-bar .breadcrumb a {
        color: #6d4c41;
        text-decoration: none;
        font-weight: 500;
    }

    .breadcrumb-bar .breadcrumb .active {
        color: #3b2d22;
        font-weight: 600;
    }



    /*--------------------Giỏ hàng-------------------------*/

    body {
        font-family: 'Arial', sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
        color: #333;
    }

    .cart-container {
        max-width: 1200px;
        margin: 50px auto;
        text-align: center;
    }

    h1 {
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 40px;
        border-bottom: 3px solid #000;
        display: inline-block;
        padding-bottom: 5px;
    }

    .cart-content {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 30px;
    }

    .cart-productlist {
        width: 700px;
    }

    .quantity-box {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .quantity-box input {
        width: 50px;
        text-align: center;
        font-size: 14px;
        border: 1px solid #aaa;
        border-radius: 4px;
    }

    .qty-btn {
        width: 25px;
        height: 25px;
        font-size: 15px;
        background: #eee;
        border-radius: 4px;
        cursor: pointer;
        transition: 0.15s;

    }

    .qty-btn:hover {
        background: #d6d6d6;
    }

    .cart-title-qty {
        text-align: left;
        background-color: rgb(237, 237, 237);
    }

    .cart-title-qty p {
        padding: 10px;
    }

    .cart-title-qty p {
        margin-left: 10px;
    }

    .cart-items {
        display: flex;
        justify-content: space-between;
        margin-top: 5px;
    }

    .right-infor {
        position: relative;
        /* cho phép định vị icon bên trong */
    }

    .right-infor i {
        position: absolute;
        /* đặt icon thùng rác ở góc phải */
        right: 10px;
        /* sát mép phải vùng chứa */
        top: 5px;
        /* nằm ở phía trên */
        cursor: pointer;
        font-size: 18px;
    }

    .right-infor .total {
        margin-top: 40px;
        /* tạo khoảng cách để dòng “Thành tiền” không bị icon che */
    }


    .item {
        display: flex;
        align-items: center;
        gap: 15px;
        text-align: left;
        background: #fff;
        border-radius: 10px;
    }

    .item img {
        width: 100px;
        height: 100px;
        object-fit: cover;
    }

    .item-infor h3 {
        font-weight: bold;
        font-size: 15px;
        color: #333;
        margin: 0;
    }

    .order-note {
        margin-top: 30px;
        background-color: rgb(237, 237, 237);
        display: block;
        justify-items: left;
    }

    .order-note p {
        font-weight: bold;
        margin-left: 10px;
    }

    .order-note textarea {
        width: 500px;
        height: 150px;
    }

    .order-note textarea:focus {
        border: 1px solid #a46b2c;
    }

    .order-info {
        flex: 1;
        border: 1px solid #ddd;
        padding: 25px;
        border-radius: 5px;
        background-color: #fafafa;
        text-align: left;
    }

    .order-info h2 {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .order-total {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 18px;
        margin-bottom: 20px;
    }

    .order-total strong {
        color: red;
        font-size: 20px;
    }

    .note {
        font-size: 14px;
        color: #666;
        margin-bottom: 25px;
    }

    .checkout-btn {
        width: 100%;
        padding: 12px 0;
        background-color: red;
        color: #fff;
        border: none;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 3px;
        transition: 0.3s;
    }

    .checkout-btn:hover {
        background-color: #cc0000;
    }

    .continue {
        margin-top: 15px;
        text-align: center;
    }

    .continue a {
        color: #333;
        text-decoration: none;
        font-size: 15px;
    }

    .continue a:hover {
        text-decoration: underline;
        color: #a46b2c;
    }

    /* Style cho cái con số bay lên (Badge) */
    .cart-count {
        position: absolute;
        top: -8px;
        right: -8px;

        background-color: #c52314;
        color: white;

        font-size: 11px;
        font-weight: bold;

        padding: 2px 6px;
        border-radius: 50%;
        min-width: 18px;
        text-align: center;
        line-height: 14px;
        border: 2px solid #fff;
    }

    .buy-now{
        padding: 12px 0;
        color: #fff;
        border: none;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 3px;
        transition: 0.3s;
        text-decoration: none;
        display: inline-block;
        width: 200px;
        background: #bb7412;
    }
    .empty-cart-alert{
        text-align: center;
        padding: 50px 20px;
    }
    .img-empty-cart{
        width: 150px;
        margin-bottom: 20px;
        opacity: 0.6;
    }

    /* Key Management Section Styles */
    .key-management-section {
        margin-top: 40px;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
    }

    .key-section-header {
        margin-bottom: 25px;
        padding-bottom: 15px;
        border-bottom: 2px solid #d0d0d0;
    }

    .key-section-header h3 {
        font-size: 18px;
        font-weight: 600;
        color: #2c3e50;
        margin: 0 0 8px 0;
    }

    .key-section-info {
        font-size: 13px;
        color: #7f8c8d;
        margin: 0;
    }

    .key-section-content {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .key-subsection {
        padding: 15px;
        background-color: #ffffff;
        border-radius: 5px;
        border-left: 4px solid #3498db;
    }

    .key-subsection h4 {
        font-size: 15px;
        font-weight: 600;
        color: #34495e;
        margin: 0 0 12px 0;
    }

    .key-action-btn {
        padding: 10px 16px;
        font-size: 14px;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        margin-right: 10px;
        margin-bottom: 8px;
    }

    .btn-primary.key-action-btn {
        background-color: #27ae60;
        color: white;
    }

    .btn-primary.key-action-btn:hover {
        background-color: #229954;
    }

    .btn-primary.key-action-btn:disabled {
        background-color: #bdc3c7;
        cursor: not-allowed;
    }

    .btn-outline-primary.key-action-btn {
        background-color: white;
        color: #3498db;
        border: 1px solid #3498db;
    }

    .btn-outline-primary.key-action-btn:hover {
        background-color: #3498db;
        color: white;
    }

    .btn-outline-secondary.key-action-btn {
        background-color: white;
        color: #7f8c8d;
        border: 1px solid #bdc3c7;
    }

    .btn-outline-secondary.key-action-btn:hover {
        background-color: #ecf0f1;
    }

    .key-note {
        display: block;
        font-size: 12px;
        color: #95a5a6;
        margin-top: 8px;
    }

    .key-status-container {
        padding: 12px;
        background-color: #ecf0f1;
        border-radius: 4px;
        min-height: 40px;
        display: flex;
        align-items: center;
    }

    .key-status-badge {
        display: inline-block;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 600;
    }

    .key-status-badge.active {
        background-color: #d4edda;
        color: #155724;
    }

    .key-status-badge.inactive {
        background-color: #f8d7da;
        color: #721c24;
    }

    .key-status-badge.none {
        background-color: #d6d8db;
        color: #383d41;
    }

    .key-action-group {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    .email-key-section {
        margin-top: 15px;
        padding: 15px;
        background-color: #f8f9fa;
        border-radius: 5px;
        border-left: 4px solid #f39c12;
    }

    .form-label {
        font-size: 14px;
        font-weight: 600;
        color: #34495e;
        margin-bottom: 8px;
        display: block;
    }

    .input-group {
        display: flex;
        gap: 8px;
    }

    .form-control {
        flex: 1;
        padding: 10px;
        border: 1px solid #bdc3c7;
        border-radius: 4px;
        font-size: 14px;
    }

    .form-control:focus {
        outline: none;
        border-color: #3498db;
        box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
    }

    .alert {
        padding: 12px 15px;
        border-radius: 4px;
        font-size: 14px;
        margin-top: 15px;
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }

    .alert-error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }

    .alert-info {
        background-color: #d1ecf1;
        color: #0c5460;
        border: 1px solid #bee5eb;
    }

    .loading-spinner {
        display: inline-block;
        width: 14px;
        height: 14px;
        border: 2px solid rgba(0, 0, 0, 0.1);
        border-radius: 50%;
        border-top-color: #3498db;
        animation: spin 0.8s linear infinite;
    }

    @keyframes spin {
        to { transform: rotate(360deg); }
    }

    .text-muted {
        color: #7f8c8d;
        font-size: 12px;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .key-action-group {
            flex-direction: column;
        }

        .key-action-btn {
            width: 100%;
            justify-content: center;
        }

        .input-group {
            flex-direction: column;
        }
    }

</style>


<body>
<!-- Thanh thông tin trên cùng -->
<div class="top-info-bar">
    <div class="header-container">
        <span>Ngũ cốc Ngon xin chào!</span>
        <div class="contact-info">
            <a href="mailto:ngucocNgon2025@gmail.com">Email: ngucocNgon2025@gmail.com</a>
            <a href="tel:0357250466">Hotline: 0357 250 466</a>
        </div>
    </div>
</div>

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

    <!------------------------------------------------------------------------------------>
    <!--Body-->
    <main class="main-detailProduct">
        <!-- Breadcrumb -->
        <section class="breadcrumb-bar py-2">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-2 rounded-3">
                        <li class="breadcrumb-item"><a href="<c:url value='/TrangChu'/>">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                    </ol>
                </nav>
            </div>
        </section>

        <!----------------------------------GIỎ HÀNG----------------------------------------------->

        <div class="cart-container">
            <h1>Giỏ hàng của bạn</h1>

            <c:choose>
                <%-- Gior hàng trống--%>
            <c:when test="${sessionScope.cart == null || sessionScope.cart.totalQuantity == 0}">
                <div class="empty-cart-alert">
                    <img src="https://tse2.mm.bing.net/th/id/OIP.9TNLG7dziWUfxa_gtem_hgHaHa?pid=Api&P=0&h=180"
                         alt="Giỏ hàng trống" class="img-empty-cart">
                    <h3 style="color: #666;">Giỏ hàng của bạn đang trống!</h3>
                    <p style="color: #888; margin-bottom: 30px;">Hãy dạo một vòng và chọn những sản phẩm yêu thích nhé.</p>
                    <a href="SanPham-TatCa" class="buy-now">
                        MUA SẮM NGAY
                    </a>
                </div>
            </c:when>

                <%-- Gior hàng có sản phẩm--%>
            <c:otherwise>
            <div class="cart-content">

                <div class="cart-productlist">
                    <div class="cart-title-qty">
                        <p>Bạn đang có <strong>${sessionScope.cart.totalQuantity} sản phẩm</strong> trong giỏ hàng</p>
                    </div>

                    <c:forEach items="${sessionScope.cart.item}" var="p">
                        <fmt:formatNumber var="formattedPrice" value="${p.price}" type="number" groupingUsed="true"/>
                    <div class="cart-items">
                        <div class="item">
                            <img src="${p.product.imageURL}" alt="Banh hat dinh duong">
                            <div class="item-infor">
                                <h3>${p.product.productName}</h3>
                                <p class="price">${formattedPrice}đ</p>
                                <div class="quantity-box">
                                    <button class="qty-btn"  onclick="updateQuantity(${p.product.id}, -1)">-</button>
                                    <input type="number" name="qty-product" id="qty-${p.product.id}" value="${p.quantity}" min="1" readonly>
                                    <button class="qty-btn"  onclick="updateQuantity(${p.product.id}, 1)">+</button>
                                </div>
                            </div>
                        </div>
                        <div class="right-infor">
                           <a href="Del-product?id=${p.product.id}"><i class="fa-solid fa-trash" style="color: red"></i></a>
                            <p class="total">Thành tiền: <strong id="item-total-${p.product.id}"><fmt:formatNumber value="${p.total}" type="number" groupingUsed="true"/>đ</strong></p>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="order-note">
                        <p>Ghi chú đơn hàng</p>
                        <textarea name="note" id="order-note"></textarea>
                    </div>

                    <!-- Key Management Section -->
                    <div class="key-management-section" id="keyManagementSection">
                        <div class="key-section-header">
                            <h3><i class="fas fa-lock"></i> Quản lý khóa bảo mật RSA</h3>
                            <p class="key-section-info">Tạo và quản lý khóa mã hóa RSA-2048 của bạn</p>
                        </div>

                        <div class="key-section-content">
                            <!-- Generate Key Section -->
                            <div class="key-subsection">
                                <h4>1. Tạo cặp khóa mới</h4>
                                <button type="button" id="generateKeyBtn" class="btn btn-primary key-action-btn" onclick="generateKeyPair()">
                                    <i class="fas fa-key"></i> Tạo khóa
                                </button>
                                <small class="key-note">Tạo cặp khóa RSA-2048 mới cho tài khoản của bạn</small>
                            </div>

                            <!-- Key Status Section -->
                            <div class="key-subsection">
                                <h4>2. Trạng thái khóa hiện tại</h4>
                                <div id="keyStatusContainer" class="key-status-container">
                                    <p id="keyStatusText" style="color: #666;">Đang kiểm tra...</p>
                                </div>
                            </div>

                            <!-- Key Actions Section -->
                            <div class="key-subsection" id="keyActionsSection" style="display: none;">
                                <h4>3. Hành động với khóa</h4>
                                <div class="key-action-group">
                                    <button type="button" class="btn btn-outline-primary key-action-btn" onclick="downloadPublicKey()">
                                        <i class="fas fa-download"></i> Tải khóa công khai
                                    </button>
                                    <button type="button" class="btn btn-outline-secondary key-action-btn" onclick="toggleEmailSection()">
                                        <i class="fas fa-envelope"></i> Gửi qua Email
                                    </button>
                                </div>

                                <!-- Email Key Section (Hidden by default) -->
                                <div id="emailKeySection" class="email-key-section" style="display: none; margin-top: 15px; padding: 15px; border: 1px solid #ddd; border-radius: 4px; background-color: #f9f9f9;">
                                    <p style="font-size: 13px; color: #666; margin-bottom: 10px;">
                                        Nhập email để nhận file khóa riêng tư (Private Key).
                                        <br><small style="color: #e74c3c;">Lưu ý: Hành động này sẽ tạo cặp khóa mới.</small>
                                    </p>
                                    <div class="input-group" style="display: flex; gap: 10px;">
                                        <input type="email" id="emailForKey" class="form-control" placeholder="example@email.com" style="flex: 1; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                                        <button type="button" class="btn btn-success" onclick="sendPrivateKeyViaEmail()" style="background-color: #28a745; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer;">
                                            Gửi ngay
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Status Messages -->
                        <div id="keyStatusMessage" class="alert" style="display: none; margin-top: 15px;"></div>
                    </div>
                    <!-- End Key Management Section -->

                </div>

                <div class="order-info">
                    <h2>Thông tin đơn hàng</h2>
                    <div class="order-total">
                        <span>Tổng tiền:</span>
                        <strong id="cart-grand-total">
                            <fmt:formatNumber value="${sessionScope.cart.total}" type="number" groupingUsed="true"/>đ
                        </strong>
                    </div>
                    <p class="note">Phí vận chuyển sẽ được tính ở trang thanh toán.<br>
                        Bạn cũng có thể nhập mã giảm giá ở trang thanh toán.</p>

                    <button class="checkout-btn" onclick="proceedToCheckout()">THANH TOÁN</button>

                    <div class="continue">
                        <a href="${pageContext.request.contextPath}/SanPham-TatCa">Tiếp tục mua hàng</a>
                    </div>
                </div>
            </div>
            </c:otherwise>
            </c:choose>
        </div>


        <!------------------------------------------------------------------------------>

    </main>

    <!------------------------------------------------------------------------------>
    <!--Footer-->

    <div class="main-footer-new">
        <!--section đăng kí nhận tin-->
        <section id="send-for-gmail" class="section section-for-email">
            <!--phần tử sẽ chiếm toàn bộ chiều ngang màn hình-->
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--back to top bootstrap-->
            <button onclick="window.scrollTo({ top: 0, behavior: 'smooth' });" id="btn-back-to-top"
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

    <!-- Tăng giảm số lượng js -->
<%--    <script>--%>
<%--    &lt;%&ndash;    let detailProductQty = 1;&ndash;%&gt;--%>
<%--    &lt;%&ndash;    const detailProductQtyDisplay = document.getElementById('detail-product-qty');&ndash;%&gt;--%>
<%--    &lt;%&ndash;    const detailProductPlus = document.getElementById('detail-product-plus');&ndash;%&gt;--%>
<%--    &lt;%&ndash;    const detailProductMinus = document.getElementById('detail-product-minus');&ndash;%&gt;--%>

<%--    &lt;%&ndash;    detailProductPlus.addEventListener('click', () => {&ndash;%&gt;--%>
<%--    &lt;%&ndash;        detailProductQty++;&ndash;%&gt;--%>
<%--    &lt;%&ndash;        detailProductQtyDisplay.textContent = detailProductQty;&ndash;%&gt;--%>
<%--    &lt;%&ndash;    });&ndash;%&gt;--%>

<%--    &lt;%&ndash;    detailProductMinus.addEventListener('click', () => {&ndash;%&gt;--%>
<%--    &lt;%&ndash;        if (detailProductQty > 1) detailProductQty--;&ndash;%&gt;--%>
<%--    &lt;%&ndash;        detailProductQtyDisplay.textContent = detailProductQty;&ndash;%&gt;--%>
<%--    &lt;%&ndash;    });&ndash;%&gt;--%>

<%--    &lt;%&ndash;</script>&ndash;%&gt;--%>

<%--    <!--back to top (bootstrap) js-->--%>
<%--    <script>--%>

<%--    </script>--%>

    <script>
        // hàm back to top
        const backToTopBtn = document.getElementById("btn-back-to-top");

        window.addEventListener("scroll", function () {
            if (window.scrollY > 300) {
                backToTopBtn.style.display = "block";
            } else {
                backToTopBtn.style.display = "none";
            }
        });
        // Hàm định dạng tiền tệ
        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' })
                .format(amount)
                .replace("₫", "đ");
        }

        function updateQuantity(productId, delta) {
            const inputId = 'qty-' + productId;
            const input = document.getElementById(inputId);


            if (!input) {
                console.error("Lỗi: Không tìm thấy thẻ input có ID là: " + inputId);
                return;
            }

            let currentQty = parseInt(input.value);
            let newQty = currentQty + delta;
            if (newQty < 1) return;
            fetch('${pageContext.request.contextPath}/UpdateQuantityInCart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'id=' + productId + '&quantity=' + newQty
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // Cập nhật giao diện
                    input.value = newQty;

                    // Cập nhật thành tiền món đó
                    const itemTotalEl = document.getElementById('item-total-' + productId);
                    if(itemTotalEl) itemTotalEl.innerText = formatCurrency(data.itemTotal);

                    // Cập nhật tổng tiền giỏ hàng
                    const cartTotalEl = document.getElementById('cart-grand-total');
                    if(cartTotalEl) cartTotalEl.innerText = formatCurrency(data.cartTotal);

                    // Cập nhật Badge số lượng
                    const badge = document.querySelector('.cart-count');
                    if(badge) badge.innerText = data.totalQuantity;
                })
                .catch(error => {
                    console.error('Lỗi AJAX:', error);
                    alert("Có lỗi kết nối đến server!");
                });
        }
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

        //lấy ghi chú đn hàng
         function proceedToCheckout() {
             const noteElement = document.getElementById('order-note');
             const noteValue = noteElement ? noteElement.value.trim() : "";
             // xử lý tiếng việt
             const url = "Checkout-infor?note=" + encodeURIComponent(noteValue);

             // 3. Chuyển trang
             window.location.href = url;
         }
     </script>

     <!-- Key Management JavaScript -->
     <script>
         // Initialize key management on page load
         document.addEventListener('DOMContentLoaded', function() {
             loadKeyStatus();
         });

         /**
          * Load and display current key status
          */
         function loadKeyStatus() {
             const statusContainer = document.getElementById('keyStatusContainer');
             const statusText = document.getElementById('keyStatusText');

             if (!statusText) return;

             statusText.innerHTML = '<span class="loading-spinner"></span> Đang kiểm tra...';

             fetch('${pageContext.request.contextPath}/key-status', {
                 method: 'GET',
                 headers: {
                     'Content-Type': 'application/json'
                 }
             })
             .then(response => response.json())
             .then(data => {
                 if (data.success) {
                     const keyStatus = data.data;
                     let statusHTML = '';

                     if (keyStatus.activeKeys && keyStatus.activeKeys > 0) {
                         statusHTML = '<span class="key-status-badge active">';
                         statusHTML += '<i class="fas fa-check-circle"></i> ✓ Có khóa hoạt động</span>';

                          // Show key details if available
                         if (keyStatus.mostRecentLabel) {
                             statusHTML += '<div style="margin-top: 8px; font-size: 12px; color: #666;">';
                             statusHTML += '<strong>Khóa hiện tại:</strong> ' + escapeHtml(keyStatus.mostRecentLabel) + '<br>';
                             if (keyStatus.mostRecentCreated) {
                                 statusHTML += '<strong>Tạo lúc:</strong> ' + formatDate(new Date(keyStatus.mostRecentCreated));
                             }
                             statusHTML += '</div>';
                         }

                          // Show key actions (if the UI elements exist)
                          const actionsSection = document.getElementById('keyActionsSection');
                          if (actionsSection) actionsSection.style.display = 'block';
                          const downloadPrivBtn = document.getElementById('downloadPrivateKeyBtn');
                          if (downloadPrivBtn) downloadPrivBtn.style.display = 'inline-flex';
                     } else {
                         statusHTML = '<span class="key-status-badge none">';
                         statusHTML += '<i class="fas fa-info-circle"></i> Chưa có khóa</span>';
                         statusHTML += '<div style="margin-top: 8px; font-size: 12px; color: #666;">';
                         statusHTML += 'Bạn chưa tạo khóa bảo mật. Hãy tạo khóa để bắt đầu.';
                         statusHTML += '</div>';

                          // Hide key actions (if present)
                          const actionsSectionNone = document.getElementById('keyActionsSection');
                          if (actionsSectionNone) actionsSectionNone.style.display = 'none';
                     }

                     statusContainer.innerHTML = statusHTML;
                 } else {
                     statusText.textContent = 'Lỗi: ' + (data.error || 'Không thể tải trạng thái khóa');
                 }
             })
             .catch(error => {
                 console.error('Error loading key status:', error);
                 statusText.textContent = 'Lỗi kết nối. Vui lòng thử lại.';
             });
         }

         /**
          * Generate new RSA key pair
          */
         function generateKeyPair(email = null) {
             const btn = document.getElementById('generateKeyBtn');
             const originalText = btn.innerHTML;

             // Disable button and show loading state
             btn.disabled = true;
             btn.innerHTML = '<span class="loading-spinner"></span> Đang tạo khóa...';

             // Build a hidden iframe and form to submit the POST and receive a download without navigating away
             const iframeName = 'keyGenDownloadFrame';
             let iframe = document.getElementById(iframeName);
             if (!iframe) {
                 iframe = document.createElement('iframe');
                 iframe.style.display = 'none';
                 iframe.id = iframeName;
                 iframe.name = iframeName;
                 document.body.appendChild(iframe);
             }

             const form = document.createElement('form');
             form.method = 'POST';
             form.action = '${pageContext.request.contextPath}/generate-key';
             form.target = iframeName;

             const input = document.createElement('input');
             input.type = 'hidden';
             input.name = 'label';
             input.value = 'Key from Shopping Cart - ' + new Date().toLocaleString('vi-VN');
             form.appendChild(input);

             if (email) {
                 const emailInput = document.createElement('input');
                 emailInput.type = 'hidden';
                 emailInput.name = 'email';
                 emailInput.value = email;
                 form.appendChild(emailInput);
             }

             document.body.appendChild(form);
             form.submit();

             // Small delay to allow download to start then refresh status and UI
             setTimeout(() => {
                 let msg = 'Khóa RSA đã được tạo và đang được tải xuống. Vui lòng lưu nó ở nơi an toàn.';
                 if (email) {
                     msg += ' Đồng thời khóa riêng tư đã được gửi tới ' + email;
                 }
                 showMessage('success', msg);
                 loadKeyStatus();
                 btn.disabled = false;
                 btn.innerHTML = originalText;
                 // remove temporary form
                 document.body.removeChild(form);
             }, 1500);
         }

         /**
          * Download public key
          */
         function downloadPublicKey() {
             const btn = event.target.closest('button');
             const originalText = btn.innerHTML;

             btn.disabled = true;
             btn.innerHTML = '<span class="loading-spinner"></span> Đang tải...';

             // Use a simple link approach for file download
             const link = document.createElement('a');
             link.href = '${pageContext.request.contextPath}/download-public-key';
             link.click();

             setTimeout(() => {
                 btn.disabled = false;
                 btn.innerHTML = originalText;
                 showMessage('success', 'Khóa công khai đã được tải xuống!');
             }, 1500);
         }

          /**
           * Download private key (one-time only)
           */
          function downloadPrivateKey() {
              // Confirm with user
              if (!confirm('⚠️ CẢNH BÁO:\n\nKhóa riêng tư chỉ có thể tải được 1 lần sau khi tạo.\n\nBạn có chắc muốn tải xuống ngay bây giờ? Vui lòng lưu nó ở nơi an toàn.')) {
                  return;
              }

              // If user requests to download private key, generate a new key and download immediately
              generateKeyPair();
              // hide the button to reduce user confusion
              const btn = document.getElementById('downloadPrivateKeyBtn');
              if (btn) {
                  btn.style.display = 'none';
              }
         }

         /**
          * Toggle email sending section
          */
         function toggleEmailSection() {
             const emailSection = document.getElementById('emailKeySection');
             emailSection.style.display = emailSection.style.display === 'none' ? 'block' : 'none';
         }

         /**
          * Send private key via email
          */
         function sendPrivateKeyViaEmail() {
             const emailInput = document.getElementById('emailForKey');
             const email = emailInput.value.trim();

             // Validate email
             if (!email) {
                 showMessage('error', 'Vui lòng nhập địa chỉ email');
                 emailInput.focus();
                 return;
             }

             if (!isValidEmail(email)) {
                 showMessage('error', 'Địa chỉ email không hợp lệ');
                 emailInput.focus();
                 return;
             }

              // Confirm with user
              if (!confirm('Hành động này sẽ TẠO MỚI cặp khóa RSA và gửi khóa riêng tư tới: ' + email + '?\n\nCặp khóa cũ sẽ bị vô hiệu hóa.')) {
                  return;
              }

             generateKeyPair(email);
             document.getElementById('emailKeySection').style.display = 'none';
             emailInput.value = '';
         }

         /**
          * Show status message
          */
         function showMessage(type, message) {
             const messageContainer = document.getElementById('keyStatusMessage');
             messageContainer.className = 'alert alert-' + type;
             messageContainer.textContent = message;
             messageContainer.style.display = 'block';

             // Auto-hide after 5 seconds
             setTimeout(() => {
                 messageContainer.style.display = 'none';
             }, 5000);
         }

          /**
           * Validate email format
           */
          function isValidEmail(email) {
              const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
              return emailRegex.test(email);
          }

         /**
          * Escape HTML special characters
          */
         function escapeHtml(text) {
             const map = {
                 '&': '&amp;',
                 '<': '&lt;',
                 '>': '&gt;',
                 '"': '&quot;',
                 "'": '&#039;'
             };
             return text.replace(/[&<>"']/g, m => map[m]);
         }

         /**
          * Format date to Vietnamese locale
          */
         function formatDate(date) {
             if (!(date instanceof Date)) {
                 date = new Date(date);
             }
             return date.toLocaleString('vi-VN');
         }
     </script>
 </body>

 </html>
