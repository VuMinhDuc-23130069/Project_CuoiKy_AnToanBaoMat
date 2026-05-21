<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Ngũ cốc Ngon | Dinh dưỡng cho mọi nhà</title>

    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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



<!------------------------------------------------------------------------------>
<section class="home-slider"> <!-- Section trình chiếu ảnh trang chủ -->
    <div class="slider-container">

        <div class="slide active"> <!-- Hình ảnh hiển thị đầu tiên -->
            <img src="image/home-slider/slide1.jpg" alt="Ngũ cốc">
        </div>
        <div class="slide">
            <img src="image/home-slider/slide2.jpg" alt="Ngũ cốc">
        </div>
        <div class="slide">
            <img src="image/home-slider/slide3.jpg" alt="Ngũ cốc">
        </div>
        <div class="slide">
            <img src="image/home-slider/slide4.jpg" alt="Ngũ cốc">
        </div>

        <button class="prev-btn">&#10094;</button> <!-- Nút qua ảnh trước -->
        <button class="next-btn">&#10095;</button> <!-- Nút qua ảnh sau -->

        <div class="dots"></div> <!-- Dấu chấm điều hướng -->
    </div>
</section>

<section class="suggest-interest"> <!-- Section có thể bạn quan tâm -->
    <div class="suggest-interest-container">
        <div class="si-heading">
            <div class="si-title">
                <h2>CÓ THỂ BẠN QUAN TÂM</h2>
            </div>
        </div>
        <div class="si-items">
            <a href="${pageContext.request.contextPath}/Chi-tiet-san-pham?id=21" class="si-item">
                <div class="si-img">
                    <img src="image/suggest-interest/ngu_coc_me_bau.png" alt="Ngũ cốc mẹ bầu">
                </div>
                <p>Ngũ cốc mẹ bầu</p>
            </a>

            <a href="${pageContext.request.contextPath}/Chi-tiet-san-pham?id=22" class="si-item">
                <div class="si-img">
                    <img src="image/suggest-interest/ngu_coc_loi_sua.png" alt="Ngũ cốc lợi sữa">
                </div>
                <p>Ngũ cốc lợi sữa</p>
            </a>

            <a href="${pageContext.request.contextPath}/Chi-tiet-san-pham?id=1" class="si-item">
                <div class="si-img">
                    <img src="image/suggest-interest/ngu_coc_tre_em.png" alt="Ngũ cốc trẻ em">
                </div>
                <p>Ngũ cốc trẻ em</p>
            </a>

            <a href="${pageContext.request.contextPath}/Chi-tiet-san-pham?id=20" class="si-item">
                <div class="si-img">
                    <img src="image/suggest-interest/ngu_coc_dinh_duong_cao_cap.png"
                         alt="Ngũ cốc dinh dưỡng cao cấp">
                </div>
                <p>Ngũ cốc dinh dưỡng<br>cao cấp</p>
            </a>

            <a href="${pageContext.request.contextPath}/Chi-tiet-san-pham?id=201" class="si-item">
                <div class="si-img">
                    <img src="image/suggest-interest/ngu_coc_nguoi_gia.png" alt="Ngũ cốc người già">
                </div>
                <p>Ngũ cốc người già</p>
            </a>

            <a href="${pageContext.request.contextPath}/filter?categoryID=1" class="si-item">
                <div class="si-img bg-lightgreen">
                    <img src="image/suggest-interest/ngu_coc_khac.png" alt="Ngũ cốc khác">
                </div>
                <p>Ngũ cốc khác</p>
            </a>
        </div>
    </div>
</section>

<section class="cate-product"> <!-- Section danh mục sản phẩm -->
    <h2 class="section-title">
        <img src="image/categoryProduct/title-icon.png" alt="icon" class="icon"> DANH MỤC SẢN PHẨM
    </h2>

    <div class="product-list">
        <a href="${pageContext.request.contextPath}/filter?categoryID=1" class="product-card-a">
            <div class="product-card">
                <img src="image/categoryProduct/ngu_coc.png" alt="Ngũ cốc" class="product-img">
                <h3 class="product-title">Ngũ cốc</h3>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/filter?categoryID=3" class="product-card-a">
            <div class="product-card">
                <img src="image/categoryProduct/combohatsen.jpg" alt="Hạt dinh dưỡng" class="product-img">
                <h3 class="product-title">Hạt dinh dưỡng</h3>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/filter?categoryID=2" class="product-card-a">
            <div class="product-card">
                <img src="image/categoryProduct/banh_dinh_duong.png" alt="Bánh dinh dưỡng" class="product-img">
                <h3 class="product-title">Bánh dinh dưỡng</h3>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/filter?categoryID=4" class="product-card-a">
            <div class="product-card">
                <img src="image/categoryProduct/tra_gao_lut.png" alt="Trà gạo lứt" class="product-img">
                <h3 class="product-title">Trà gạo lứt</h3>
            </div>
        </a>

    </div>

</section>

<!------------------------------------------------------------------------------>
<section class="new-products"> <!-- section hiển thị sản phẩm mới nhất -->

    <div class="products-container" > <!-- chứa các component -->
        <!--Label-->
        <h2>SẢN PHẨM MỚI NHẤT</h2>
        <p class="subtitle">Cập nhật những sản phẩm mới nhất</p>

        <!-- TẤT CẢ SẢN PHẨM CHUNG 1 GRID -->
        <div class="product-grid">

            <!-- Sản phẩm -->
            <c:forEach var="p" items="${newestProducts}">
                <c:url var="detailUrl_byID" value="/Chi-tiet-san-pham">
                    <c:param name="id" value="${p.id}"/>
                </c:url>
            <fmt:formatNumber var="formattedPrice" value="${p.price}" type="number" groupingUsed="true"/>
            <div class="product-item">
                <div class="product-image">
                    <a href="${detailUrl_byID}">
                        <img src="${p.imageURL}" alt="${p.productName}">
                    </a><!-- hình ảnh minh họa -->
                    <div class="overlay"><!-- Hover để hiển thị-->
                        <button class="add-to-cart" onclick="window.location.href='addCart?id=${p.id}&quantity=1'">🛒 THÊM VÀO GIỎ</button>
                        <button class="view-btn"
                                onclick="openModal('${p.id}','${p.imageURL}','${p.productName}', '${formattedPrice}đ', '${detailUrl_byID}')">
                            👁
                            XEM NHANH
                        </button>
                    </div>
                </div>
                <h3> ${p.productName}</h3>
                <p class="price">${formattedPrice}đ</p>
            </div>
            </c:forEach>
        </div>
    </div>
</section>


<!-- Modal hiển thị chi tiết sản phẩm-->
<div class="product-modal" id="productModal">
    <div class="product-modal-content">
        <button class="close-modal" onclick="closeModal()">&times;</button>
        <img id="modal-img" src="" alt="">
        <div class="infor">
            <h3 id="modal-name"></h3>
            <p class="price" id="modal-price"></p>
            <div class="quantity-box">
                <button class="qty-btn" id="qty-decrease">-</button>
                <input type="text" id="product-qty" value="1" min="1">
                <button class="qty-btn" id="qty-increase">+</button>
            </div>
            <button class="add" id="modal-add-to-cart-btn" onclick="addToCartAction()">🛒 THÊM VÀO GIỎ</button>
            <p><a href="#" id="modal-detail-link">Xem chi tiết sản phẩm</a></p>
        </div>
    </div>
</div>

<!------------------------------SẢN PHẨM ĐƯỢC YÊU THÍCH NHẤT-------------------------------------------------->
<section class="favorite-products">
    <div class="favorite-container">
        <h2>SẢN PHẨM ĐƯỢC ƯA THÍCH</h2>
        <p class="subtitle">Luôn luôn tươi, sạch</p>

        <div class="favorite-grid">
            <!-- Cột 1 -->
            <c:forEach var="p" items="${favouriteProducts}">
            <c:url var="detailUrl_byID" value="/Chi-tiet-san-pham">
                <c:param name="id" value="${p.id}"/>
            </c:url>
            <fmt:formatNumber var="formattedPrice" value="${p.price}" type="number" groupingUsed="true"/>
                <div class="fav-item">
                    <a href="${detailUrl_byID}"><img src="${p.imageURL}" alt="${p.productName}"></a>
                    <div class="fav-info">
                        <a href="">${p.productName}</a>
                        <p class="price">${formattedPrice}đ</p>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>

</section>


<!------------------------------TIN TỨC-------------------------------------------------->
<section class="news-section">
    <div class="container">
    <h2>TIN TỨC</h2>
    <p class="subtitle">Cập nhật những bài viết hữu ích dành cho khách hàng</p>
    <div class="news-grid">
        <c:forEach var="n" items="${recentNews}">
        <div class="news-item">
            <div class="news-img">
                <a href="${pageContext.request.contextPath}/NewsDetail?id=${n.id}">
                    <img src="${n.imageURL}" alt="${n.title}">
                </a>
            </div>
            <a href="${pageContext.request.contextPath}/NewsDetail?id=${n.id}" class="title">
                <h3>${n.title}</h3>
            </a>
            <p class="sub-paragraph">${n.shortDescription}</p>
        </div>
        </c:forEach>

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
                <p>Copyright © 2025 <a href="TrangChu">Ngũ cốc Ngon</a>. Powered by <a href="#" target="_blank"
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
<script>
    let currentProductId_Fix = null;
    function openModal(id, imgSrc, name, price, detailUrl) {
        console.log("OPEN MODAL - ID:", id); // Check log
        currentProductId_Fix = id;

        // Gán thông tin
        document.getElementById('modal-img').src = imgSrc;
        document.getElementById('modal-name').innerText = name;
        document.getElementById('modal-price').innerText = price;

        // Gán link chi tiết, thay cho #
        const linkEl = document.getElementById('modal-detail-link');
        if(linkEl) linkEl.href = detailUrl;

        // Reset số lượng
        const qtyInput = document.getElementById('product-qty');
        if(qtyInput) qtyInput.value = 1;

        // Hiện modal
        document.getElementById('productModal').style.display = 'flex';
    }

    function closeModal() {
        document.getElementById('productModal').style.display = 'none';
    }

    function addToCartAction() {
        console.log("CLICK ADD TO CART - ID:", currentProductId_Fix); // Check log

        // Kiểm tra ID
        if (!currentProductId_Fix) {
            alert("Lỗi: Chưa chọn sản phẩm (ID null). Hãy tải lại trang!");
            return;
        }

        // Lấy số lượng
        const qtyInput = document.getElementById('product-qty');
        let quantity = 1;
        if(qtyInput) {
            let val = parseInt(qtyInput.value);
            if(val > 0) quantity = val;
        }

        // Tạo link
        const finalUrl = "addCart?id=" + currentProductId_Fix + "&quantity=" + quantity;

        console.log("Go to URL:", finalUrl);

        // Chuyển trang
        window.location.href = finalUrl;
    }
    document.addEventListener('DOMContentLoaded', function() {
        const qtyInput = document.getElementById('product-qty');
        const btnIncrease = document.getElementById('qty-increase');
        const btnDecrease = document.getElementById('qty-decrease');

        if(btnIncrease) {
            btnIncrease.onclick = function() {
                if(qtyInput) qtyInput.value = parseInt(qtyInput.value) + 1;
            }
        }

        if(btnDecrease) {
            btnDecrease.onclick = function() {
                if(qtyInput && qtyInput.value > 1) {
                    qtyInput.value = parseInt(qtyInput.value) - 1;
                }
            }
        }

        // Click ra ngoài thì đóng
        window.onclick = function(e) {
            const modal = document.getElementById('productModal');
            if (e.target === modal) closeModal();
        }
    });

</script>
<script src="script.js"></script>

</body>
</html>