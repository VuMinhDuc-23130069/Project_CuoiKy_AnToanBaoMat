<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chính sách bảo mật</title>
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
        background: #f6efe3;
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



    /*----------NỘI DUNG CHÍNH---------- */
    .main-privacy {
        font-family: 'Tahoma', Arial, sans-serif;
        color: #444;
        background-color: #fff;
    }
    /* Dàn 2 cột: nội dung bên trái, sidebar bên phải */
    .privacy-container {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 30px;
        max-width: 1200px;
        margin-left: 60px;
    }

    /* Nội dung chính bên trái */
    .privacy-content {
        flex: 1 1 68%;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        font-size: 15px;
        line-height: 1.7;
        color: #333;
    }

    /* Tiêu đề chính */
    .privacy-title {
        font-size: 26px;
        font-weight: 700;
        margin-bottom: 20px;
        color: #6d4c41;
    }

    /* Tiêu đề mục */
    .section-privacy-title {
        font-size: 18px;
        margin-top: 25px;
        margin-bottom: 10px;
        color: #a46b2c;
        border-left: 4px solid #a46b2c;
        padding-left: 10px;
    }

    /* Văn bản */
    .privacy-content p {
        font-size: 17px;
    }

    /* Sidebar bên phải */
    aside {
        flex: 1 1 28%;
        margin-top: 28px;
        margin-right: -120px;
    }

    /* Đặt sidebar cố định khi cuộn */
    .category-sidebar {
        position: sticky;
        top: 100px;
    }

    /* RESPONSIVE: Khi màn nhỏ, xếp dọc */
    @media (max-width: 992px) {
        .privacy-container {
            flex-direction: column;
        }

        .privacy-content,
        aside {
            flex: 1 1 100%;
        }
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

    /* Ẩn nút toggle trên màn lớn (dùng bootstrap d-md-none) */
    /* Dạng collapse: trên di động ẩn danh mục theo class .collapsed */
    @media (max-width: 767.98px) {
        /* mặc định ẩn category list, bật bằng nút toggle */
        #categoryList.collapsed {
            display: none;
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
<main class="main-privacy">
    <!-- Breadcrumb -->
    <section class="breadcrumb-bar py-2">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-2 rounded-3">
                    <li class="breadcrumb-item"><a href="<c:url value='/TrangChu'/>">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Chính sách bảo mật</li>
                </ol>
            </nav>
        </div>
    </section>

    <!-- Nội dung chính sách -->
    <div class="privacy-container">
        <section class="privacy-content">
            <h1 class="privacy-title">Chính sách bảo mật</h1>

            <p>Công ty TNHH phát triển nông nghiệp xanh Ngũ cốc Ngon (hoặc “Chúng tôi”, hoặc “Ngũ cốc Ngon”) cam kết bảo vệ quyền riêng tư của khách hàng và đảm bảo rằng thông tin thành viên của khách hàng (như được quy định dưới đây) và các thông tin khác mà có thể dẫn đến việc nhận dạng ra khách hàng (gọi chung là “thông tin cá nhân”) đều được bảo vệ.</p>
            <p>Chính sách bảo mật này giải thích những loại thông tin cá nhân và cách thức sử dụng, tiết lộ, chuyển giao và bảo vệ thông tin đó. Chính sách về quyền riêng tư này áp dụng đối với bất kỳ thông tin cá nhân nào mà Ngũ cốc Ngon thu thập được thông qua website ngucocngon.com.</p>
            <p>Chính sách này có thể thay đổi vào thời điểm bằng cách đăng phiên bản được cập nhật trên website hoặc gửi thư điện tử cho các thành viên trực tuyến của Ngũ cốc Ngon.</p>
            <p>Việc khách hàng tiếp tục truy cập và sử dụng website được xem là khách hàng đã đồng ý và chấp thuận với bất kỳ thay đổi nào của Ngũ cốc Ngon về chính sách quyền riêng tư.</p>

            <h2 class="section-privacy-title">1. Thông tin chung</h2>
            <p>Khách hàng có thể ghé thăm website mà không cần tiết lộ thông tin cá nhân.</p>
            <p>Chúng tôi không thu thập, sử dụng, chuyển giao hoặc tiết lộ bất kỳ thông tin nào của khách hàng mà không được sự đồng ý của khách hàng.</p>
            <p>Website này cho phép khách hàng đưa các ý kiến hoặc nhận xét của khách hàng lên mục đánh giá sản phẩm, blog, và các chức năng khác.</p>
            <p>Bất kỳ thông tin nào mà khách hàng tiết lộ đều trở thành thông tin công cộng và khách hàng nên thận trọng khi quyết định tiết lộ thông tin cá nhân, thông tin tài chính hoặc các thông tin khác.</p>
            <p>Ngũ cốc Ngon không thể ngăn chặn việc sử dụng những thông tin đó theo cách thức mà có thể vi phạm chính sách bảo mật này, luật pháp hoặc quyền riêng tư và sự an toàn của cá nhân khách hàng và không chịu trách nhiệm đối với các kết quả xảy ra từ việc đăng tải thông tin đó.</p>
            <p>Khách hàng có trách nhiệm thông báo kịp thời cho website về những hành vi sử dụng trái phép, lạm dụng, vi phạm bảo mật của bên thứ ba để có biện pháp giải quyết phù hợp.</p>

            <h2 class="section-privacy-title">2. Phạm vi sử dụng thông tin</h2>
            <p>Các thông tin thu thập thông qua website sẽ giúp chúng tôi: (1) Hỗ trợ khách hàng khi mua sản phẩm; (2) Tư vấn, giải đáp các thắc mắc của khách hàng một cách tốt nhất.</p>
            <p>Trong trường hợp hợp có yêu cầu của cơ quan có thẩm quyền, chúng tôi có trách nhiệm hợp tác cung cấp thông tin cá nhân khách hàng khi có yêu cầu từ: Viện kiểm sát, tòa án, cơ quan công an điều tra liên quan đến hành vi vi phạm pháp luật nào đó của khách hàng. Ngoài ra, không ai có quyền xâm phạm vào thông tin cá nhân của khách hàng.</p>

            <h2 class="section-privacy-title">3. Thời gian lưu trữ thông tin</h2>
            <p>Chúng tôi sẽ lưu trữ thông tin của khách hàng trong 5 năm kể từ ngày đăng ký hoặc nếu có phản hồi gì về việc lưu trữ thông tin, quý khách có thể gửi liên hệ tới chúng tôi.</p>
            <p>Ngoại trừ các trường hợp về sử dụng thông tin cá nhân như đã nêu trong chính sách này, chúng tôi cam kết sẽ không tiết lộ thông tin cá nhân của khách hàng cho bất cứ trường hợp nào khác.</p>

            <h2 class="section-privacy-title">4. Phương tiện và công cụ để người dùng tiếp cận và chỉnh sửa dữ liệu cá nhân của mình</h2>
            <p>Tại mục “Thành viên website” khách hàng đã đăng ký có thể truy cập để chỉnh sửa hoặc cập nhật thông tin cá nhân. Nếu không muốn tiết lộ thông tin, khách hàng có thể chấm dứt tư cách thành viên trực tuyến.</p>
            <p>Khách hàng có quyền gửi khiếu nại đến chúng tôi. Khi tiếp nhận những phản hồi này, chúng tôi sẽ xác nhận lại thông tin, trường hợp đúng như phản ánh của thành viên, tùy theo mức độ, chúng tôi sẽ có những biện pháp xử lý kịp thời theo hướng bảo vệ quyền lợi chính đáng của khách hàng trong khả năng tốt nhất của Ngũ cốc Ngon.</p>

            <h2 class="section-privacy-title">5. Địa chỉ của đơn vị thu thập và quản lý thông tin cá nhân</h2>
            <p>Công ty TNHH phát triển nông nghiệp xanh Ngũ cốc Ngon</p>
            <p>Địa chỉ: Hiền Sỹ, Phong Sơn, Phong Điền, Thừa Thiên Huế.</p>
        </section>

        <!-- SIDEBAR DANH MỤC TRANG-->

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
    </div>



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