<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Thông tin giao hàng</title>
    <style>
        body {
            font-family: 'Tahoma', Arial, sans-serif;
            background-color: #fff;
            color: #333;
            margin: 0;
            padding: 40px;
        }

        .checkout-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 40px;
            min-width: 1200px;
            margin: 0 auto;
        }

        /** căn form thông tin rộng hơn*/
        .shipping-form {
            flex: 1;
            /*Chia đều mỗi phần tử đều 1 bên*/
            max-width: 700px;
        }

        .shipping-form h1 {
            font-size: 26px;
        }

        .shipping-form nav {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
        }

        .shipping-form nav a {
            color: #1a73e8;
            text-decoration: none;
        }

        .shipping-form nav a:hover {
            cursor: pointer;
            color: #5c93db;
        }

        /*Phần đăng nhập ?*/
        .shipping-form h2 {
            font-size: 20px;
            margin-bottom: 5px;
        }

        .shipping-form p a {
            color: #1a73e8;
            text-decoration: none;
        }

        /*Giãn các phần tử đều ra*/
        .form-group,
        .form-row {
            margin-bottom: 15px;
        }

        /*Giãn ngang theo gap*/
        .form-row {
            display: flex;
            gap: 10px;
        }

        /*chỉnh các input*/
        input,
        select {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-footer {
            display: flex;
            justify-content: space-between;
            /* cắt đôi*/
            align-items: center;
            margin-top: 10px;
        }

        .cart-link {
            color: #1a73e8;
            text-decoration: none;
        }

        .cart-link:hover {
            cursor: pointer;
            color: #5c93db;
        }

        .submit-btn {
            background-color: #1a73e8;
            color: #fff;
            border: none;
            padding: 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .submit-btn:hover {
            background-color: #155bb5;
        }

        /*Đường ngăn*/
        .divider {
            width: 1px;
            background-color: #ddd;
            height: 100%;
            min-height: 500px;
        }

        /*Mục sản phẩm*/
        .order-summary {
            flex: 0 0 350px;
            background: #fafafa;
            border: 1px solid #eeeeee;
            padding: 20px;
            border-radius: 6px;
        }

        .order-summary h2 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        /*đưa thông tin của item căn theo chiều ngang*/
        .product-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .product-img {
            position: relative;
        }

        .product-img img {
            width: 60px;
            height: 60px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        /*xử lí thông tin mặt hàng*/
        .product-qty {
            position: absolute;
            top: -8px;
            right: -8px;
            background: #a3a3a3;
            color: #fff;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 12px;
            text-align: center;
            line-height: 20px;
        }

        .product-infor {
            flex-grow: 1;
            margin-left: 10px;
            ;
        }

        .product-name {
            font-size: 14px;
            margin: 0;
        }

        .product-price {
            font-weight: lighter;
        }

        .discount {
            display: flex;
            margin: 15px 0;
        }

        .discount input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px 0 0 4px;
        }

        .discount button {
            background: #1a73e8;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }

        .summary-line,
        .total-line {
            display: flex;
            justify-content: space-between;
            margin: 8px 0;
            font-size: 14px;
        }

        .total-price {
            font-size: 18px;
            color: #000;
        }

        /* ---------------- RESPONSIVE ----------------*/
        @media (max-width: 900px) {
            .checkout-container {
                flex-direction: column;
                gap: 20px;
            }

            .divider {
                display: none;
            }

            .order-summary {
                width: 100%;
            }
        }
        .product-list-scroll{
            max-height: 300px;
            overflow-y: auto;
            padding-right: 5px;
        }

        .user-profile-box {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
            padding: 12px;
            background-color: #fafafa;
            border: 1px solid #e1e1e1;
            border-radius: 8px;
        }
        .user-avatar {
            width: 45px;
            height: 45px;
            flex-shrink: 0;
        }
        .user-avatar img {
            width: 100%;
            height: 100%;
            border-radius: 50%; /* Bo tròn ảnh */
            object-fit: cover;
            border: 1px solid #ddd;
        }

        .default-avatar {
            width: 100%;
            height: 100%;
            background-color: #ccc;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .user-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .user-name {
            font-weight: 600;
            color: #333;
            font-size: 15px;
        }
        .user-email {
            font-size: 13px;
            color: #737373;
        }
        .logout-btn {
            font-size: 13px;
            color: #e45a5a;
            text-decoration: none;
            margin-top: 4px;
            display: inline-block;
        }
        .logout-btn:hover {
            text-decoration: underline;
        }

        .login-prompt {
            margin-bottom: 20px;
            font-size: 14px;
        }
        .login-prompt a { color: #338dbc;
            text-decoration: none;
        }
    </style>

</head>

<body>
    <div class="checkout-container">
        <!--Cột form bên trái-->
        <div class="shipping-form">
            <h1>Ngũ cốc Ngon</h1>
            <nav>
                <a href="GioHang">Giỏ hàng</a> >
                <span>Thông tin giao hàng</span> >
                <span>Phương thức thanh toán</span>
            </nav> <!--Đường dẫn hiện tại-->

            <c:choose>
                <%-- TH đã đăng nhập --%>
                <c:when test="${not empty sessionScope.user}">
                    <div class="user-profile-box">
                        <div class="user-avatar">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user.imageURL}">
                                    <img src="${sessionScope.user.imageURL}" alt="Avatar">
                                </c:when>
                                <c:otherwise>
                                    <div class="default-avatar">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div class="user-info">
                <span class="user-name">
                        ${sessionScope.user.fullName}
                </span>
                            <span class="user-email">
                                    ${sessionScope.user.email}
                            </span>
                            <a href="Logout" class="logout-btn">Đăng xuất</a>
                        </div>
                    </div>
                </c:when>

                <%-- TH khách vãng lai --%>
                <c:otherwise>
                    <div class="login-prompt">
                        Bạn đã có tài khoản? <a href="DangNhapTaiKhoan">Đăng nhập</a>
                    </div>
                </c:otherwise>
            </c:choose>

            <form action="Checkout-infor" method="post"><!--Form thông tin đơn hàng-->

                <div class="form-group"><!--Họ và tên-->
                    <input type="text" placeholder="Họ và tên" name="fullname" required>
                </div>

                <div class="form-row"><!--Email và số điện thoại-->
                    <input type="email" name="Email" placeholder="Email" id="mail" required>
                    <input type="tel" name="sdt" placeholder="Số điện thoại" required>
                </div>

                <div class="form-group"><!--địa chỉ khách hàng-->
                    <input type="text" placeholder="Địa chỉ" name="dc" required>
                </div>

                <%-- hai cái này để nhận tt từ thẻ select--%>
                <input type="hidden" name="province_name" id="province_name_hidden">
                <input type="hidden" name="district_name" id="district_name_hidden">

                <div class="form-row"> <!--Thông tin quận/ huyện/ thành phố-->
                    <select name="province" id="province" required>
                        <option value="">Tỉnh/ thành phố</option>
                    </select>


                    <select name="district" id="district">
                        <option value="">Quận/ huyện</option>
                    </select>

                </div>

                <div class="form-footer">
                    <a href="GioHang" class="cart-link">Giỏ hàng</a>
                    <button type="submit" class="submit-btn">
                        Tiếp tục đến phương thức thanh toán</button>
                </div>
            </form>
        </div>

        <!--Đường ngăn cách-->
        <div class="divider"></div>

        <!--Cột đơn hàng bên phải-->
        <div class="order-summary">
            <h2>Đơn hàng của bạn (${sessionScope.cart.totalQuantity} sản phẩm)</h2>

            <div class="product-list-scroll" >
                <c:forEach items="${sessionScope.cart.item}" var="p">
                    <div class="product-item">
                        <div class="product-img">
                            <img src="${p.product.imageURL}" alt="${p.product.productName}">
                            <span class="product-qty">${p.quantity}</span>
                        </div>
                        <div class="product-infor">
                            <p class="product-name">${p.product.productName}</p>
                        </div>
                        <div class="product-price">
                            <fmt:formatNumber value="${p.total}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <hr style="border-top: 1px solid #eee; margin: 10px 0;">

            <div class="discount">
                <input type="text" placeholder="Mã giảm giá" name="discount">
                <button type="button">Sử dụng</button>
            </div>

            <div class="summary-line">
                <span>Tạm tính</span>
                <span>
                <fmt:formatNumber value="${sessionScope.cart.total}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
            </span>
            </div>

            <div class="summary-line">
                <span>Phí vận chuyển</span>
                <span>—</span>
            </div>

            <hr>

            <div class="total-line">
                <div>
                    <strong>Tổng cộng</strong>
                    <small>VND</small>
                </div>
                <strong class="total-price">
                    <fmt:formatNumber value="${sessionScope.cart.total}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                </strong>
            </div>

        </div>
    </div>


    <!--Xử lí import tỉnh/ thành phố, quận/ huyện-->
    <script>
        const provinceSelect = document.getElementById('province');
        const districtSelect = document.getElementById('district');
        const provinceHidden = document.getElementById('province_name_hidden');
        const districtHidden = document.getElementById('district_name_hidden');

        // Load tỉnh/thành
        fetch("https://provinces.open-api.vn/api/p/")
            .then(res => res.json())
            .then(data => {
                data.forEach(p => {
                    const opt = document.createElement("option");
                    opt.value = p.code;
                    opt.textContent = p.name;
                    provinceSelect.appendChild(opt);
                });
            });

        // Khi chọn tỉnh thì load huyện
        provinceSelect.addEventListener("change", function () {
            const selectedOption = this.options[this.selectedIndex];
            provinceHidden.value = selectedOption.text; // lưu vào input ẩn
            districtSelect.innerHTML = '<option value="">Quận/ huyện</option>';
            districtHidden.value = ""; // Reset huyện

            fetch('https://provinces.open-api.vn/api/p/' + this.value + '?depth=2')
                .then(res => res.json())
                .then(data => {
                    data.districts.forEach(d => {
                        const opt = document.createElement("option");
                        opt.value = d.code;
                        opt.textContent = d.name;
                        districtSelect.appendChild(opt);
                    });
                });
        });
        //chọn huyện thì lưu huyện xuống
        districtSelect.addEventListener("change", function() {
            const selectedOption = this.options[this.selectedIndex];
            districtHidden.value = selectedOption.text;
        });
    </script>

</body>


</html>