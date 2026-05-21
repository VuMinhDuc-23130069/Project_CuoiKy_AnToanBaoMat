<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %> <!--ép hiện dữ liệu lên-->
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giới thiệu - Về Ngon</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<style>
    /* ==== Trang Về Ngon ==== */
    .about-page {
        font-family: 'Tahoma', Arial, sans-serif;
        color: #444;
        background-color: #fff;
    }

    /* Tối ưu breadcrumb: giảm chiều cao và không xuống dòng */
    .breadcrumb-bar {
        padding-top: 5px;   /* giảm khoảng cách trên/dưới của thanh */
        padding-bottom: 5px;
        background:  #f6efe3;
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



    /* --- Giới thiệu mở đầu --- */
    .about-intro .lead {
        font-size: 18px;
        line-height: 1.8;
        color: #555;
        max-width: 850px;
        margin: 0 auto;
    }

    /* --- Các phần nội dung --- */
    .about-page h2 {
        color: #6d4c41;
        font-weight: 600;
    }
    .about-page p {
        font-size: 16px;
        line-height: 1.7;
    }

    /* --- Ảnh trong nội dung --- */
    .about-page img {
        width: 100%;
        height: auto;
        border-radius: 10px;
        object-fit: cover;
    }

    /* --- Section sáng và tối xen kẽ --- */
    .about-story,
    .about-growth {
        background-color: #faf7f5;
    }

    /* --- Người sáng lập --- */
    .about-founder {
        background-color: #fff;
    }
    .about-founder h3 {
        color: #6d4c41;
        font-weight: 600;
    }
    .about-founder p {
        max-width: 600px;
        margin: 0 auto;
        line-height: 1.8;
    }

    /* --- Phần kết --- */
    .about-ending {
        background-color: #faf7f5;
    }
    .about-ending h2 {
        color: #6d4c41;
        font-weight: 700;
    }
    .about-ending p {
        max-width: 750px;
        margin: 0 auto 20px auto;
        line-height: 1.7;
    }

    /* --- Nút CTA --- */
    .about-ending .btn {
        background-color: #a46b2c;
        border: none;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    .about-ending .btn:hover {
        background-color: #6d4c41;
        transform: translateY(-2px);
    }

    /* --- Hiệu ứng ảnh nhẹ --- */
    .about-page img.shadow-sm:hover {
        box-shadow: 0 4px 16px rgba(0,0,0,0.25);
        transition: all 0.3s ease;
    }





    /* ===== DANH MỤC SIDEBAR ===== */
    .category-sidebar {
        border: 1px solid #f0e7df;
        background: linear-gradient(180deg, #fff, #fff);
    }

    .category-sidebar h4 {
        color: #6d4c41;
        font-weight: 700;
        font-size: 18px;
    }

    .category-list .category-item {
        padding: 10px 8px;
        border-radius: 6px;
        transition: background 0.18s ease, transform 0.12s ease;
        margin-bottom: 6px;
    }

    .category-list .category-item a {
        display: block;
        color: #4b4b4b;
        text-decoration: none;
        padding: 4px 6px;
    }

    .category-list .category-item:hover {
        background-color: #faf0e5;
        transform: translateX(4px);
    }

    .category-list .category-item a .badge {
        font-size: 0.8rem;
        opacity: 0.9;
    }

    /* Trạng thái active (nếu muốn đánh dấu trang hiện tại) */
    .category-list .category-item.active,
    .category-list .category-item a.active {
        background-color: #a46b2c;
        color: #fff;
    }
    .category-list .category-item.active a,
    .category-list .category-item a.active {
        color: #fff;
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
<main class="about-page">

    <!-- Breadcrumb bar: để riêng 1 div có màu nền khác -->
    <section class="breadcrumb-bar py-2">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-2 rounded-3">
                    <li class="breadcrumb-item"><a href="<c:url value='/TrangChu'/>">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Về Ngon</li>
                </ol>
            </nav>
        </div>
    </section>

    <!-- Tiêu đề trang để ở section riêng -->
    <section class="page-hero text-center py-4">
        <div class="container">
            <h1 class="about-title mb-0">Trao an lành, nhận yêu thương cùng Ngũ cốc Ngon</h1>
        </div>
    </section>


    <section class="about-intro py-5">
        <div class="container">
            <div class="row align-items-start">


                <!-- SIDEBAR DANH MỤC TRANG-->

                <!--thẻ div gồm các class sử dụng bootstrap chia làm 2 cột 1 ảnh và 1 nội dung xen kẽ nhau-->

                <aside class="col-md-4 mb-4 mb-md-0">
                    <div class="category-sidebar p-3 bg-white rounded shadow-sm">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="mb-0">Danh mục trang</h4>

                            <!--dùng bootstrap tạo danh mục trang-->
                            <!-- nút ▾ chỉ hiện trên mobile, sử dùng bootstrap collapse -->
                            <button class="btn btn-outline-secondary d-md-none btn-sm"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#categoryList"
                                    aria-expanded="false"
                                    aria-controls="categoryList">
                                Danh mục ▾
                            </button>
                        </div>

                        <ul id="categoryList" class="category-list list-unstyled mb-0 collapse d-md-block">
                            <li class="category-item"><a href="<c:url value='/VeNgon'/>">Giới thiệu</a></li>
                            <li class="category-item"><a href="<c:url value='/ChinhSachBaoMat'/>">Chính sách bảo mật</a></li>
                            <li class="category-item"><a href="<c:url value='/DieuKhoanDichVu'/>">Điều khoản dịch vụ</a></li>
                            <li class="category-item"><a href="<c:url value='/ChinhSachThanhToan'/>">Chính sách thanh toán</a></li>
                        </ul>
                    </div>
                </aside>

                <!-- NỘI DUNG GIỚI THIỆU -->
                <div class="col-md-8">
                    <p class="lead text-start">
                        Ngũ cốc Ngon được hình thành từ mong muốn mang lại sản phẩm thuần tự nhiên, lành mạnh và tốt cho sức khỏe.
                        Chúng tôi tin rằng sự an lành bắt đầu từ những điều giản dị nhất – từ từng hạt ngũ cốc quê hương.

                    </p>
                    <br>

                    <!--  có thể thêm 1-2 link nhanh hoặc featured ở đây -->
                    <div class="mt-3">
                        <a href="<c:url value='/SanPham-TatCa'/>" class="btn btn-outline-success me-2">Xem tất cả sản phẩm</a>
                        <a href="<c:url value='/ChinhSachDoiTra'/>" class="btn btn-outline-secondary">Chính sách đổi trả</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Câu chuyện thương hiệu -->
    <section class="about-story py-5 bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 mb-4 mb-md-0">
                    <img src="image/Image_VeNgon/donglua.jpg" alt="Câu chuyện thương hiệu" class="img-fluid rounded-3 shadow-sm"><img>
                </div>
                <div class="col-md-6">
                    <h2 class="mb-3">Sinh ra từ làng, nuôi dưỡng dự định dang dở</h2>
                    <p>
                        Ngũ cốc Ngon được khởi đầu từ một người con sinh ra ở làng quê miền Trung, mang trong mình khát vọng
                        đem đến sản phẩm sạch, an toàn và tốt cho sức khỏe cộng đồng. Từ những hạt gạo, hạt đậu bình dị,
                        Ngon bắt đầu hành trình tạo nên những gói ngũ cốc mang giá trị thật sự.
                    </p>
                </div>
            </div>
        </div>
    </section>


    <!-- Cơ duyên với ngũ cốc -->

    <section class="about-journey py-5">
        <div class="container">
            <div class="row align-items-center flex-md-row-reverse">
                <div class="col-md-6 mb-4 mb-md-0">
                    <img src="image/Image_VeNgon/ngucoc1.jpg" alt="Cơ duyên với ngũ cốc" class="img-fluid rounded-3 shadow-sm">
                </div>
                <div class="col-md-6">
                    <h2 class="mb-3">Cơ duyên đến với ngũ cốc</h2>
                    <p>
                        Từ một dự định nhỏ, Ngon dần trở thành niềm đam mê lớn khi nhận ra sức mạnh của những hạt ngũ cốc thuần Việt.
                        Sản phẩm được nghiên cứu, thử nghiệm và hoàn thiện với mong muốn mang lại sự an lành cho từng gia đình Việt.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Hành trình phát triển -->

    <section class="about-growth py-5 bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 mb-4 mb-md-0">
                    <img src="image/Image_VeNgon/ngucoc2.jpg" alt="Hành trình phát triển" class="img-fluid rounded-3 shadow-sm">
                </div>
                <div class="col-md-6">
                    <h2 class="mb-3">Từ Ngũ cốc XYZ đến Ngũ cốc Ngon</h2>
                    <p>
                        Trải qua hành trình phát triển và cải tiến, thương hiệu Ngon không chỉ là sản phẩm dinh dưỡng mà còn là
                        lời tri ân đến quê hương, đến những giá trị truyền thống được gìn giữ và lan tỏa.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Người sáng lập -->

    <section class="about-founder py-5 text-center">
        <div class="container">
            <img src="image/Image_VeNgon/nguoisanglap.jpg" alt="Người sáng lập" class="img-fluid rounded-circle mb-3 shadow-sm"
                 style="width:180px; height:180px; object-fit:cover;">
            <h3 class="mb-1">Người sáng lập</h3>
            <p class="fw-bold">ABCD</p>
            <p class="fst-italic">
                “Mỗi sản phẩm là một lời gửi gắm yêu thương, một món quà từ thiên nhiên cho sức khỏe cộng đồng.”
            </p>
        </div>
    </section>

    <!-- Kết thúc trang -->

    <section class="about-ending py-5 bg-light text-center">
        <div class="container">
            <h2 class="mb-3">Ngũ cốc Ngon – Trao an lành, nhận yêu thương</h2>
            <p class="mb-4">
                Chúng tôi tin rằng sức khỏe là nền tảng của hạnh phúc, và hạnh phúc bắt đầu từ những điều giản dị nhất – từ bữa sáng lành mạnh mỗi ngày.
            </p>
            <a href="<c:url value='/SanPham-TatCa'/>" class="btn btn-success px-4 py-2 rounded-pill">Khám phá sản phẩm</a>
        </div>
    </section>

</main>




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
                <p>Copyright © 2025 <a href="TrangChu.jsp">Ngũ cốc Ngon</a>. Powered by <a href="#" target="_blank"
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
<script src="script.js"></script>

</body>
</html>