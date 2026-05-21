<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>5 LOẠI NGŨ CỐC TỐT CHO SỨC KHỎE MẸ BẦU</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
    /* Tối ưu breadcrumb: giảm chiều cao và không xuống dòng */
    .breadcrumb-bar {
        padding-top: 5px;
        /* giảm khoảng cách trên/dưới của thanh */
        padding-bottom: 5px;
        background: linear-gradient(180deg, #fbf7f3, #f6efe3);
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

    /* Responsive: nếu màn quá nhỏ, cho phép wrap để tránh overflow */
    @media (max-width: 420px) {
        .breadcrumb-bar .breadcrumb.p-2.rounded-3 {
            white-space: normal;
            /* cho phép xuống dòng trên màn nhỏ */
            padding: 8px;
            gap: 6px;
        }
    }

    body {
        font-family: 'Tahoma', Arial, sans-serif;
        color: #333;
        background-color: #fff;
    }

    article.post {
        margin-top: 30px;
        display: flex;
        gap: 30px;
        max-width: 1400px;
        /* tăng chiều rộng tổng */
        margin: 0 auto;
        align-items: flex-start;
    }

    /* Cột trái: Bài viết chính */
    article.post .news {
        width: 72%;
        /* rộng hơn */
    }

    article.post h1 {
        font-size: 32px;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
        color: #222;
    }

    article.post .author {
        font-size: 14px;
        color: #888;
        text-align: center;
        margin-bottom: 20px;
    }

    article.post section.post-image {
        text-align: center;
        margin-bottom: 20px;
    }

    .cate-infor-post .post-image {
        display: inline-block;
        justify-content: center;
    }

    article.post section.post-image img {
        text-align: center;
        max-width: 100%;
        height: auto;
        border-radius: 8px;
    }

    article.post section.post-image .description {
        max-width: 600px;
        text-align: center;
        color: #adadad;
        font-size: 14px;
        margin-top: 5px;
    }

    article.post section.cate-infor-post {
        margin-bottom: 30px;
    }

    article.post section.cate-infor-post h2 {
        font-size: 22px;
        margin-bottom: 10px;
        display: inline-block;
        padding-bottom: 3px;
        font-weight: bold;
    }

    article.post section.cate-infor-post p {
        margin-bottom: 10px;
    }

    article.post section.cate-infor-post img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
        margin: 10px 0;
        display: block;
    }

    /* responsive cho mobile */
    @media (max-width: 600px) {
        article.post h1 {
            font-size: 24px;
        }

        article.post section.cate-infor-post h2 {
            font-size: 18px;
        }
    }

    /* ========================== */
    /* CỘT PHẢI — BÀI VIẾT MỚI NHẤT */
    /* ========================== */

    /* Cột phải: Recent posts */
    .recent-posts {
        width: 20%;
        background: #fff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12);
    }

    .recent-posts h2 {
        text-align: center;
        font-size: 22px;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 2px solid #000;
    }

    .post-list {
        list-style: none;
        padding: 0;
    }

    .post-list li {
        display: flex;
        border-bottom: 1px solid #eee;
        padding: 12px 0;
        gap: 12px;
    }

    .post-index {
        font-size: 26px;
        font-weight: bold;
        color: #bbb;
        width: 28px;
    }

    .post-category {
        font-size: 12px;
        color: #888;
    }

    .post-title {
        display: block;
        text-decoration: none;
        color: #888;
        font-size: 15px;
        margin-top: 3px;
        cursor: pointer;
    }

    .post-title:hover {
        color: #bb7412;
    }

    .news-detail-container {
        max-width: 900px; /* Giới hạn chiều rộng cho dễ đọc giống báo điện tử */
        margin: 0 auto;
        padding: 40px 20px;
        background: #fff;
        font-family: 'Arial', sans-serif;
    }

    /* Tiêu đề bài viết */
    .news-title {
        font-size: 32px;
        font-weight: bold;
        color: #333;
        margin-bottom: 15px;
        line-height: 1.4;
    }

    /* Thông tin ngày đăng, tác giả */
    .news-meta {
        color: #777;
        font-size: 14px;
        margin-bottom: 25px;
        border-bottom: 1px solid #eee;
        padding-bottom: 15px;
    }
    .news-meta i { margin-right: 5px; }

    /* Mô tả ngắn (Sapo) - Thường in đậm */
    .news-sapo {
        font-weight: bold;
        font-size: 18px;
        color: #444;
        margin-bottom: 30px;
        line-height: 1.6;
    }

    /* NỘI DUNG CHÍNH */
    .news-content {
        font-size: 16px;
        line-height: 1.8;
        color: #222;
    }

    /* Xử lý ảnh trong nội dung để không bị tràn màn hình */
    .news-content img {
        max-width: 100%;
        height: auto;
        display: block;
        margin: 20px auto; /* Căn giữa ảnh */
        border-radius: 5px;
    }

    /* Khoảng cách giữa các đoạn văn */
    .news-content p {
        margin-bottom: 20px;
        text-align: justify; /* Căn đều 2 bên */
    }

    /* Nút quay lại */
    .back-btn {
        display: inline-block;
        margin-top: 40px;
        padding: 10px 20px;
        background: #f1f1f1;
        color: #333;
        text-decoration: none;
        border-radius: 4px;
        font-weight: bold;
    }
    .back-btn:hover { background: #e0e0e0; }
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

    <div class="news-detail-container">

        <h1 class="news-title">${n.title}</h1>

        <div class="news-meta">
            <i class="fa-regular fa-clock"></i>
            Đăng ngày: <fmt:formatDate value="${n.datePost}" pattern="dd/MM/yyyy - HH:mm"/>
        </div>

        <div class="news-banner" style="margin: 20px 0; text-align: center;">
            <img src="${n.imageURL}" alt="${n.title}"
                 style="max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
        </div>

        <div class="news-sapo">
            ${n.shortDescription}
        </div>

        <div class="news-content">
            <c:out value="${n.content}" escapeXml="false"/>
        </div>

        <a href="${pageContext.request.contextPath}/News" class="back-btn">
            &larr; Quay lại danh sách tin tức
        </a>

    </div>

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