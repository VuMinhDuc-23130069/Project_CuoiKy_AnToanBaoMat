<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tài khoản của bạn</title>

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


    .orders-table thead th {
        font-size: 14px;
        font-weight: 700;
        color: #333;
        background: #fafafa;
        padding: 12px 14px;
        border-bottom: 1px solid #eee;
        white-space: nowrap;
    }

    .orders-table tbody td {
        padding: 12px 14px;
        border-top: 1px solid #f2f2f2;
        color: #555;
        vertical-align: middle;
    }

    .orders-table tbody tr:hover {
        background: #fcfcfc;
    }


    /* ===== Chi tiết đơn hàng ===== */
    .account-main {
        width: 78%;
        float: left;
        padding-right: 60px;
        box-sizing: border-box;
        margin-top: 20px
    }

    .order-head {
        margin: 10px 0 18px;
        color: #444;
    }

    .order-head strong {
        color: #111;
    }

    .order-box {
        background: #fff;
        border: 1px solid #eee;
        border-radius: 10px;
        padding: 18px;
    }



    .order-table {
        width: 100%;
        border-collapse: collapse;
    }

    .order-table thead th {
        font-size: 14px;
        font-weight: 700;
        background: #fafafa;
        border-bottom: 1px solid #eee;
        padding: 12px 14px;
        white-space: nowrap;
        text-align: left;
    }

    .order-table tbody td {
        padding: 14px;
        border-top: 1px solid #f2f2f2;
        vertical-align: top;
        color: #444;
    }

    .order-product {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .order-product img {
        width: 76px;
        height: 76px;
        object-fit: cover;
        border-radius: 6px;
        border: 1px solid #f0f0f0;
    }

    .order-totals {
        margin-top: 12px;
        padding: 14px;
        border-top: 1px solid #eee;
    }

    .order-totals .row-line {
        display: flex;
        justify-content: flex-end;
        gap: 28px;
        margin: 6px 0;
    }

    .order-totals .row-line .label {
        color: #666;
        min-width: 160px;
        text-align: right;
    }

    .order-totals .row-line .value {
        font-weight: 700;
    }

    .address-grid {
        display: flex;
        gap: 24px;
        margin-top: 26px;
    }

    .address-card {
        flex: 1;
        border: 1px solid #eee;
        border-radius: 10px;
        overflow: hidden;
        background: #fff;
    }

    .address-card .card-head {
        background: #dff0f7;
        color: #0b5578;
        padding: 14px 16px;
        font-weight: 700;
    }

    .address-card .card-body {
        padding: 16px;
        color: #444;
        line-height: 1.8;
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
                            <a href="#" class="account-menu_link">Thông tin tài khoản</a>
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
            <a href="<c:url value='/GioHang'/>" class="cart-btn" aria-label="Giỏ hàng">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                     viewBox="0 0 24 24" fill="none"
                     stroke="black" stroke-width="2"
                     stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a1 1 0 0 0 .99.81h9.66
                     a1 1 0 0 0 .98-.8l1.7-8.2H6"></path>
                </svg>
            </a>

        </div>

    </div>

</header>


<!--Body trang chi tiết đơn hàng-->

<main class="mainContainer-theme">
    <div class="layout-infor-account text-center">
        <h1>Chi tiết đơn hàng</h1>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-xs-3 sidebar-account">
                <div class="AccountSidebar">
                    <h3 class="AccountTitle titleSidebar">Tài khoản</h3>
                    <div class="AccountContent">
                        <div class="AccountList">
                            <ul class="list-unstyled">
                                <li class="current"><a href="<c:url value='/TaiKhoanCuaBan'/>">Thông tin tài khoản</a></li>
                                <li><a href="<c:url value='/DanhSachDiaChi'/>">Danh sách địa chỉ</a></li>
                                <li class="last"><a href="<c:url value='/TrangChu'/>">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <!-- NỘI DUNG CHI TIẾT ĐƠN HÀNG (cột phải) -->
            <div class="col-xs-12 col-xs-9 account-main">

                <!-- Thông tin đầu trang đơn -->
                <div class="order-head">
                    <div>
                        <strong>ĐƠN HÀNG: #${order.id}</strong>,
                        Đặt lúc — <span><fmt:formatDate value="${order.orderDate}" pattern="HH:mm dd/MM/yyyy"/></span>
                        <br>
                        Trạng thái:
                        <span style="font-weight: bold; font-size: 16px;">
                             <c:choose>
                                 <c:when test="${order.orderStatus == 1}">
                                     <span class="text-warning" style="color: #ffc107;">Chờ xác nhận</span>
                                 </c:when>
                                 <c:when test="${order.orderStatus == 2}">
                                     <span class="text-primary" style="color: #0d6efd;">Đang giao hàng</span>
                                 </c:when>
                                 <c:when test="${order.orderStatus == 3}">
                                     <span class="text-success" style="color: #198754;">Giao thành công</span>
                                 </c:when>
                                 <c:when test="${order.orderStatus == 4}">
                                     <span class="text-danger" style="color: #dc3545;">Đã hủy</span>
                                 </c:when>
                                 <c:otherwise>Không xác định</c:otherwise>
                             </c:choose>
                        </span>
                    </div>
                    <a href="TaiKhoanCuaBan" style="color:#0067c7;text-decoration:none">Quay lại trang tài
                        khoản - Danh sách đơn hàng</a>

                </div>

                <!-- Chi tiết đơn hàng -->
                <div class="order-box">

                    <table class="order-table">
                        <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Mã sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${details}">
                        <tr>
                            <td>
                                <div class="order-product">
                                    <img src="${item.productImg}" alt="${item.productName}">
                                    <div>${item.productName}</div>
                                </div>
                            </td>
                            <td>${item.productID}</td>
                            <td>
                                <fmt:formatNumber value="${item.priceAtTime}" type="currency" currencySymbol="₫"/>
                            </td>
                            <td>${item.quantity}</td>
                            <td><strong>
                                <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="₫"/>
                            </strong>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <!-- Tổng cộng -->
                    <c:set var="subTotal" value="${order.total - order.shippingFee}" />

                    <c:if test="${order.shippingFee == null}">
                        <c:set var="subTotal" value="${order.total}" />
                    </c:if>

                    <div class="order-totals">
                        <div class="row-line">
                            <span class="label">Giá sản phẩm: </span>
                            <span class="value">
                                <fmt:formatNumber value="${subTotal}" type="currency" currencySymbol="₫"/>
                            </span>
                        </div>

                        <div class="row-line">
                            <span class="label">Phí vận chuyển: </span>
                            <span class="value">
                                <c:choose>
                                    <c:when test="${order.shippingFee > 0}">
                                        <fmt:formatNumber value="${order.shippingFee}" type="currency" currencySymbol="₫"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: green;">Miễn phí</span>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>

                        <div class="row-line">
                            <span class="label">Tổng tiền: </span>
                            <span class="value" style="color: #d9534f; font-size: 18px; font-weight: bold;">
                                <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫"/>
                            </span>
                        </div>
                    </div>

                <!-- Địa chỉ nhận thanh toán + gửi hàng  (DEMO)-->
                <div class="address-grid">
                    <div class="address-card">
                        <div class="card-head">Thông tin người nhận</div>
                        <div class="card-body">
                            <strong>${order.fullName}</strong><br>
                            Email: ${order.email}<br>
                            SĐT: ${order.phone}<br>
                        </div>
                    </div>

                    <div class="address-card">
                        <div class="card-head">Địa chỉ giao hàng</div>
                        <div class="card-body">
                            Vận chuyển: <strong>${order.deliveryMethod != null ? order.deliveryMethod : 'Tiêu chuẩn'}</strong>
                            <br>
                           <strong>Địa chỉ: ${order.orderAddress}</strong
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>
    </div>
</main>


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