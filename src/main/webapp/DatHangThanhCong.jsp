<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Dat Hang Thanh Cong</title>
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

        /* Giao diện trang đặt hàng thành công */
        .success-page {
            width: 700px;
            padding: 20px;
        }

        .success-page h1 {
            font-size: 26px;
            margin-bottom: 25px;
        }

        .order-success {
            text-align: left;
            margin-bottom: 25px;
        }

        .success-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: #1a73e8;
            color: white;
            font-size: 30px;
            line-height: 50px;
            text-align: center;
            display: inline-block;
            margin-bottom: 10px;
        }

        .order-success h2 {
            color: #333;
            margin: 5px 0;
        }

        .order-success .order-id {
            color: #555;
            margin: 5px 0;
        }

        .order-success .thank-you {
            color: #777;
            margin-top: 5px;
        }

        .order-info-box {
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 25px;
            background: #fff;
        }

        .order-info-box h3 {
            margin-top: 0;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .order-section {
            margin-bottom: 15px;
        }

        .section-title {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .footer-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .help {
            color: #777;
            font-size: 14px;
        }

        .help a {
            color: #1a73e8;
            text-decoration: none;
        }

        .help a:hover {
            text-decoration: underline;
        }

        .continue-btn {
            background: #1a73e8;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .continue-btn:hover {
            background: #155bb5;
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
    </style>

</head>

<body>
    <div class="checkout-container">
        <!-- Cột bên trái mới -->
        <div class="shipping-form success-page">
            <h1>Ngũ cốc Ngon</h1>

            <div class="order-success">
                <div class="success-icon">✔</div>
                <h2>Đặt hàng thành công</h2>
                <p class="order-id">Mã đơn hàng <strong>${orderId}</strong></p>
                <p class="thank-you">Cảm ơn bạn đã mua hàng!</p>
            </div>

            <div class="order-info-box">
                <h3>THÔNG TIN ĐƠN HÀNG !</h3>

                <div class="order-section">
                    <p><strong>Người nhận:</strong> ${customerName}</p>
                    <p><strong>SĐT:</strong> ${customerPhone}</p>
                    <p><strong>Email:</strong> ${customerEmail}</p>
                    <p><strong>Địa chỉ:</strong> ${customerAddress}</p>
                </div>

                <div class="order-section">
                    <p class="section-title">Phương thức thanh toán</p>
                    <p>${paymentMethodName}</p>
                </div>
            </div>

            <div class="footer-actions">
                <p class="help">
                    Cần hỗ trợ? <a href="<c:url value='/LienHe'/>">Liên hệ chúng tôi</a>
                </p>
                <button class="continue-btn" onclick="window.location.href='SanPham-TatCa'">Tiếp tục mua hàng</button>
            </div>
        </div>


        <!--Đường ngăn cách-->
        <div class="divider"></div>

        <!--Cột đơn hàng bên phải-->
        <div class="order-summary">
            <h2>Đơn hàng của bạn</h2>

            <c:forEach items="${finalCart.item}" var="p">
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
            <div class="summary-line">
                <span>Tạm tính</span>
                <span>
                    <fmt:formatNumber value="${finalCart.total}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                </span>
            </div>

            <div class="summary-line">
                <span>Phí vận chuyển</span>
                <span>
                    <span><fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                </span>
            </div>

            <hr>

            <div class="total-line">
                <div>
                    <strong>Tổng cộng</strong>
                    <small>VND</small>
                </div>
                <strong class="total-price">
                    <fmt:formatNumber value="${totalMoney}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                </strong>
            </div>

        </div>
    </div>

</body>


</html>