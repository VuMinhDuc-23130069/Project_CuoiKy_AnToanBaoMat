<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %> <!--ép hiện dữ liệu lên-->
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm - tất cả</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
    /* ==== Trang danh mục sản phẩm ==== */

    .main-collection {
        font-family: 'Tahoma', Arial, sans-serif;
        color: #444;
        background-color: #fff;
    }

    /* --- Breadcrumb --- */
    /* Tối ưu breadcrumb: giảm chiều cao và không xuống dòng */
    .breadcrumb-bar {
        padding-top: 5px; /* giảm khoảng cách trên/dưới của thanh */
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
    .breadcrumb-bar .breadcrumb .breadcrumb-item + .breadcrumb-item::before {
        content: "/"; /* đảm bảo ký tự phân cách luôn là / */
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


    /* ==== Banner ==== */
    .banner-collection {
        width: 100%;
        height: 350px;
        overflow: hidden;
        position: relative;
    }

    .banner-collection img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* ==== Khung chính ==== */
    .collection-container {
        display: flex;
        justify-content: space-between;
        padding: 40px 80px;
        gap: 40px;
    }

    /* ==== Sidebar (Danh mục sản phẩm + Giá) ==== */
    .sidebar {
        flex: 0 0 250px;
    }

    .sidebar h2 {
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 0.5px;
        border-bottom: 1px solid #eee;
        margin-bottom: 15px;
        padding-bottom: 5px;
    }

    .sidebar ul {
        list-style: none;
        padding-left: 0;
        margin-bottom: 40px;
    }

    .sidebar ul li {
        margin: 8px 0;
    }

    .sidebar a {
        text-decoration: none;
        color: #333;
        font-weight: 500;
    }

    .sidebar a:hover {
        color: #8b5e34;
    }

    .price-list input[type="radio"] {
        margin-right: 8px;
    }

    /* ==== Khu vực sản phẩm ==== */
    .collection-product-section {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    /* ==== Header sản phẩm ==== */
    .product-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }

    .product-header h2 {
        font-size: 26px;
        font-weight: 700;
    }

    #sort {
        padding: 8px 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        background-color: #fff;
        font-size: 14px;
        cursor: pointer;
    }

    /* ==== Lưới sản phẩm ==== */
    /* Lưới sản phẩm: 4 cột, mỗi dòng 4 sản phẩm */
    .collection-product-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 30px;
    }

    /* ==== Khung sản phẩm ==== */
    .collection-product-item {
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
        text-align: center;
        padding-bottom: 20px;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .collection-product-item:hover {
        transform: translateY(-6px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    /* ==== Hình ảnh sản phẩm ==== */
    .collection-product-image {
        position: relative;
        width: 100%;
        height: 220px; /* chiều cao cố định theo ảnh sản phẩm đầu tiên */
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #fff;
    }

    .collection-product-image img {
        width: 100%;
        height: 100%;
        object-fit: cover; /* cắt ảnh đều khung */
        transition: transform 0.4s ease;
    }

    .collection-product-item:hover .collection-product-image img {
        transform: scale(1.05);
    }

    /* ==== overlay khi hover ==== */
    .collection-overlay {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        height: 60px;
        background-color: rgb(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .collection-product-item:hover .collection-overlay {
        opacity: 1;
    }

    .collection-overlay button {
        border: none;
        color: #fff;
        font-size: 13px;
        padding: 8px 15px;
        border-radius: 10px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .collection-add-to-cart {
        background-color: #bb7412;
        text-decoration: none;
        display: inline-block;
        padding: 8px 15px;
        color: white;
        border-radius: 10px;
        font-size: 14px;
    }

    .collection-add-to-cart:hover {
        background-color: #c52314;
    }

    .collection-view-btn {
        background-color: #bb7412;
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .collection-view-btn:hover {
        background-color: #c52314;
    }

    /* ==== Tên và giá sản phẩm ==== */
    .collection-product-item h3 {
        font-size: 15px;
        margin-top: 15px;
        margin-bottom: 6px;
        color: #333;
    }

    .collection-product-item p {
        font-weight: 600;
    }

    /* ==== Phân trang ==== */
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 12px;
        margin-top: 40px;
    }

    .pagination button {
        padding: 6px 12px;
        border: none;
        border-radius: 4px;
        background-color: #8b5e34;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .pagination button:hover {
        background-color: #a67244;
    }

    #page-num {
        font-weight: 600;
        color: #333;
    }

    /*Modal chi tiết sản phẩm*/
    /*Hình bên trái*/
    .product-modal-content img {
        width: 250px;
        border-radius: 8px;
        object-fit: cover;
    }

    /*Căn chỉnh cho thông tin bên phải*/
    .product-modal-content .info {
        flex: 1;
        text-align: left;
    }

    .product-modal-content .info h3 {
        font-size: 22px;
        margin-bottom: 10px;

    }

    .product-modal-content .info .price {
        color: #b22a00;
        font-size: 20px;
        font-weight: bold;
    }

    .product-modal-content .infor .add {
        margin-top: 10px;
        margin-bottom: 15px;
        background: #3b5c2f;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 15px;
        border-radius: 5px;
        cursor: pointer;
    }

    .product-modal-content .infor .add:hover {
        background-color: #2d471f;
    }

    /*link xem chi tiết sản phẩm*/
    .product-modal-content .infor a {
        text-decoration: none;
        margin-top: 15px;
        color: #333;
    }

    .product-modal-content .infor a:hover {
        text-decoration: underline;
        color: #bb7412;
    }

    .quantity-box input {
        width: 50px;
        text-align: center;
        padding-top: 5px;
        font-size: 16px;
        border: 1px solid #aaa;
        border-radius: 4px;
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

    .category-list li.active a {
        font-weight: bold;
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
<main class="main-collection">
    <!-- Breadcrumb -->
    <section class="breadcrumb-bar py-2">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-2 rounded-3">
                    <li class="breadcrumb-item"><a href="<c:url value='/TrangChu'/>">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh mục</li>
                </ol>
            </nav>
        </div>
    </section>

    <!-- Collection -->
    <div class="banner-collection">
        <img src="image/collection/banner.jpg" alt="Ngũ cốc">
    </div>

    <div class="collection-container">
        <!-- Cột danh mục bên trái -->
        <aside class="sidebar">
            <h2>DANH MỤC SẢN PHẨM</h2>
            <ul class="category-list">
                <li class="${tag == null || tag == '0' ? 'active' : ''}">
                    <a href="filter?categoryID=0">Tất cả sản phẩm</a>
                </li>
                <li class="${tag == '1' ? 'active' : ''}">
                    <a href="filter?categoryID=1">Ngũ cốc</a>
                </li>
                <li class="${tag == '2' ? 'active' : ''}">
                    <a href="filter?categoryID=2">Bánh dinh dưỡng</a>
                </li>
                <li class="${tag == '3' ? 'active' : ''}">
                    <a href="filter?categoryID=3">Hạt dinh dưỡng</a>
                </li>
                <li class="${tag == '4' ? 'active' : ''}">
                    <a href="filter?categoryID=4">Trà gạo lứt</a>
                </li>
            </ul>

            <h2>GIÁ SẢN PHẨM</h2>
            <form id="priceForm" action="filter" method="GET">
                <input type="hidden" name="categoryID" value="${tag}" />
                <input type="hidden" name="sort" value="${param.sort}" />
                <ul class="price-list">
                    <li><label><input type="radio" name="price" value="0-100000" onchange="this.form.submit()" ${param.price == '0-100000'?'checked':''}> Dưới 100,000₫</label></li>
                    <li><label><input type="radio" name="price" value="100000-199000" onchange="this.form.submit()" ${param.price == '100000-199000'?'checked':''}> 100,000₫ - 199,000₫</label></li>
                    <li><label><input type="radio" name="price" value="200000-299000" onchange="this.form.submit()" ${param.price == '200000-299000'?'checked':''}> 200,000₫ - 299,000₫</label></li>
                    <li><label><input type="radio" name="price" value="300000-399000" onchange="this.form.submit()" ${param.price == '300000-399000'?'checked':''}> 300,000₫ - 399,000₫</label></li>
                    <li><label><input type="radio" name="price" value="400000-99999999" onchange="this.form.submit()" ${param.price == '400000-99999999'?'checked':''}> Trên 400,000₫</label></li>
                </ul>
            </form>
        </aside>

        <!-- Danh sách sản phẩm -->
        <section class="collection-product-section">
            <div class="product-header">
                <h2>Tất cả sản phẩm</h2>
                <form action="filter" method="GET">
                    <input type="hidden" name="categoryID" value="${tag}">
                    <input type="hidden" name="price" value="${param.price}">

                    <select name="sort" id="sort" onchange="this.form.submit()">
                        <option value="price_asc" ${selectedSort == 'price_asc' ? 'selected' : ''}>Giá: Tăng dần</option>
                        <option value="price_desc" ${selectedSort == 'price_desc' ? 'selected' : ''}>Giá: Giảm dần</option>
                        <option value="name_az" ${selectedSort == 'name_az' ? 'selected' : ''}>Tên: A-Z</option>
                        <option value="name_za" ${selectedSort == 'name_za' ? 'selected' : ''}>Tên: Z-A</option>
                        <option value="oldest" ${selectedSort == 'oldest' ? 'selected' : ''}>Cũ nhất</option>
                        <option value="newest" ${selectedSort == 'newest' ? 'selected' : ''}>Mới nhất</option>
                    </select>
                </form>
            </div>

            <div class="collection-product-grid">


                <!--------------------------------------------------------->

                <!-- Sản phẩm -->

                <c:forEach var="p" items="${list}" >
                    <c:url var="detailUrl_byID" value="/Chi-tiet-san-pham">
                        <c:param name="id" value="${p.id}"/>
                    </c:url>
                    <fmt:formatNumber var="formattedPrice" value="${p.price}" type="number" groupingUsed="true"/>

                    <div class="collection-product-item">
                        <div class="collection-product-image">

                            <a href="${detailUrl_byID}">
                                <img src="${p.imageURL}" alt="${p.productName}">
                            </a>

                            <div class="collection-overlay"><!-- Hover để hiển thị-->
                                <!-- contextPath đảm bảo nó chèn được thư mục gốc trc servlet-->
                                <a href="${pageContext.request.contextPath}/addCart?id=${p.id}&quantity=1" class="collection-add-to-cart">
                                    🛒 THÊM VÀO GIỎ
                                </a>

                                <button class="collection-view-btn"
                                        onclick="openModal('${p.id}','${p.imageURL}','${p.productName}', '${formattedPrice}đ', '${detailUrl_byID}')">👁
                                    XEM NHANH
                                </button>
                            </div>
                        </div>
                        <h3>${p.productName}</h3>
                        <p class="price">${formattedPrice}đ</p>
                    </div>
                </c:forEach>

                <!------------------------13--------------------------->

            </div>
            <!-- Nút chuyển trang -->
            <div class="pagination">
                <button id="prev">&laquo;</button>
                <span id="page-num">1</span>
                <button id="next">&raquo;</button>
            </div>

        </section>


        <!-- Modal hiển thị chi tiết sản phẩm -->
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
                <p>Copyright © 2025 <a href="<c:url value='/TrangChu'/>">Ngũ cốc Ngon</a>. Powered by <a href="#"
                                                                                           target="_blank"
                                                                                           rel="noreferrer">Team
                    18</a></p>
            </div>
        </div>
    </footer>
</div>

<!-- Bỏ chọn input radio sau khi chọn -->
<script>
    const radios = document.querySelectorAll('input[name="price"]');

    radios.forEach(radio => {
        radio.addEventListener('click', function () {
            // Nếu radio này đang được chọn lần trước
            if (this.checked && this.dataset.wasChecked === "true") {
                this.checked = false;          // bỏ chọn
                this.dataset.wasChecked = "false";
            } else {
                // đặt trạng thái cho tất cả radio khác
                radios.forEach(r => r.dataset.wasChecked = "false");
                this.dataset.wasChecked = "true";
            }
        });
    });
</script>

<!-- Nút chuyển trang - js-->
<script>
    const products = document.querySelectorAll('.collection-product-item');
    const productsPerRow = 4;      // 4 sản phẩm/1 dòng
    const rowsPerPage = 5;         // 5 dòng/trang
    const productsPerPage = productsPerRow * rowsPerPage;

    let currentPage = 1;
    const totalPages = Math.ceil(products.length / productsPerPage);

    // cuộn lên lại phần sản phẩm sau khi chuyển trang
    const mainSection = document.querySelector('.collection-container');


    function showPage(page) {
        // ẩn tất cả sản phẩm
        products.forEach(p => p.style.display = 'none');

        // hiển thị các sản phẩm trong trang
        const start = (page - 1) * productsPerPage;
        const end = start + productsPerPage;
        for (let i = start; i < end && i < products.length; i++) {
            products[i].style.display = 'block';
        }

        // cập nhật số trang
        document.getElementById('page-num').textContent = page;

        // bật/tắt nút prev/next
        document.getElementById('prev').disabled = page === 1;
        document.getElementById('next').disabled = page === totalPages;
    }

    // sự kiện nút prev/next
    document.getElementById('prev').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
            mainSection.scrollIntoView({behavior: 'smooth'}); // kéo lên main
        }
    });

    document.getElementById('next').addEventListener('click', () => {
        if (currentPage < totalPages) {
            currentPage++;
            showPage(currentPage);
            mainSection.scrollIntoView({behavior: 'smooth'}); // kéo lên main
        }
    });

    // hiển thị trang đầu tiên khi load
    showPage(currentPage);
</script>

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

    // 3. Hàm đóng Modal
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
</body>
</html>