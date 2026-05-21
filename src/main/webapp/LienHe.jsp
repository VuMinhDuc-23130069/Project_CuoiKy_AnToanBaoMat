<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>

    /* Tối ưu breadcrumb: giảm chiều cao và không xuống dòng */
    .breadcrumb-bar {
        padding-top: 5px;   /* giảm khoảng cách trên/dưới của thanh */
        padding-bottom: 5px;
        background: #f6efe3; /*tạo màu nền từ trên xuống dưới gồm 2 màu*/
        border-bottom: 1px solid rgba(0,0,0,0.04);
    }

    /* Mỗi item không có margin dày (tránh làm nội dung tràn xuống dưới)*/
    .breadcrumb-bar .breadcrumb .breadcrumb-item {
        margin: 0;
        padding: 0;
    }

    /* Dấu phân cách (nếu muốn điều chỉnh kích thước/màu) */
    .breadcrumb-bar .breadcrumb .breadcrumb-item + .breadcrumb-item::before {
        content: "/";             /* đảm bảo ký tự phân cách luôn là / */
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





    /* ====== Contact cards ====== */
    .contact-cards-section { padding: 36px 0; }
    .contact-card {
        background: #F5F5F5;
        border-radius: 6px;
        padding: 28px 18px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.06);
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        transition: transform .18s ease, box-shadow .18s ease;
        border: 1px solid rgba(0,0,0,0.03);
    }
    .contact-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
    }
    .contact-icon {
        margin-bottom: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .contact-icon svg { display:block; }

    /* Title  */
    .contact-title {
        font-size: 20px;
        font-weight: 700;
        color: #2c1c12;
        margin: 8px 0 6px;
    }
    .contact-sub {
        font-size: 14px;
        color: #9b8f88;
        margin: 0;
        line-height: 1.6;
        word-break: break-word;
    }

    /* Links */
    .contact-sub a {
        color: #9b8f88;
        text-decoration: none;
    }
    .contact-sub a:hover {
        text-decoration: underline; color: #7a5a36; }




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

<!--Body-->
<section class="breadcrumb-bar py-2">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 p-2 rounded-3">
                <li class="breadcrumb-item"><a href="<c:url value='/TrangChu'/>">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Liên hệ</li>
            </ol>
        </nav>
    </div>
</section>



<section class="contact-cards-section">
    <div class="container">
        <div class="row g-4 text-center">
            <div class="col-6 col-md-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <!-- icon location (SVG) -->
                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z" stroke="#a46b2c" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </div>
                    <h4 class="contact-title">Địa chỉ chúng tôi</h4>
                    <p class="contact-sub">Dĩ An, TP HCM</p>
                </div>
            </div>

            <div class="col-6 col-md-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <!-- icon email -->
                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" aria-hidden="true"><rect x="3" y="5" width="18" height="14" rx="2" stroke="#a46b2c" stroke-width="1.5"/><path d="M3 7l9 6 9-6" stroke="#a46b2c" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </div>
                    <h4 class="contact-title">Email chúng tôi</h4>
                    <p class="contact-sub"><a href="mailto:ngucocNgon@gmail.com">ngucocNgon@gmail.com</a></p>
                </div>
            </div>

            <div class="col-6 col-md-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <!-- icon phone -->
                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.86 19.86 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6A19.86 19.86 0 0 1 2.08 4.18 2 2 0 0 1 4 2h3a2 2 0 0 1 2 1.72c.12 1.05.36 2.07.72 3.03a2 2 0 0 1-.45 2.11L8.91 10.91a16 16 0 0 0 6 6l1.05-1.05a2 2 0 0 1 2.11-.45c.96.36 1.98.6 3.03.72A2 2 0 0 1 22 16.92z" stroke="#a46b2c" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </div>
                    <h4 class="contact-title">Điện thoại</h4>
                    <p class="contact-sub"><a href="tel:0357250466">0357 250 466</a></p>
                </div>
            </div>

            <div class="col-6 col-md-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <!-- icon facebook -->
                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path d="M22 12.07C22 6.59 17.52 2 12 2S2 6.59 2 12.07C2 17.11 5.66 21.25 10.44 22v-7.03H8.08V12h2.36V9.79c0-2.33 1.39-3.61 3.52-3.61 1.02 0 2.09.18 2.09.18v2.3h-1.17c-1.16 0-1.52.72-1.52 1.46V12h2.6l-.42 2.97h-2.18V22C18.34 21.25 22 17.11 22 12.07z" stroke="#a46b2c" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </div>
                    <h4 class="contact-title">Fanpage</h4>
                    <p class="contact-sub"><a href="#" target="_blank" rel="noreferrer">facebook.com/NgucocNgon</a></p>
                </div>
            </div>
        </div>
    </div>
</section>




<!------------------------------------------------------------------------------>
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

    window.addEventListener("scroll", function() {
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