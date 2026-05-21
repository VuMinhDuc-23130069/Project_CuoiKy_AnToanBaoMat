<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Phương thức thanh toán</title>
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

        .shipping-form h2 {
            font-weight: normal;
            font-size: 18px;
        }

        .shipping-method {
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 25px;
        }


        .method-item {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 10px;
        }

        .method-item span {
            flex-grow: 1;
        }


        .payment-method {
            border: 1px solid #ddd;
            border-radius: 6px;
            overflow: hidden;
        }

        .pay-card {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 15px;
            border-bottom: 1px solid #eee;
            cursor: pointer;
        }

        .pay-card:last-child {
            border-bottom: none;
        }

        .pay-card:hover {
            background: #f6f9ff;
        }

        .pay-card input[type="radio"] {
            width: 18px;
            height: 18px;
        }

        .pay-card .icon {
            width: 32px;
            height: 32px;
        }

        .pay-card input:checked~span,
        .pay-card input:checked~img {
            filter: brightness(0.85);
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
    </style>

</head>

<body>
    <div class="checkout-container">
        <!--Cột form bên trái-->
        <form action="Order" method="post" class="shipping-form">
            <h1>Ngũ cốc Ngon</h1>
            <nav>
                <a href="GioHang.jsp">Giỏ hàng</a> >
                <a href="ThongTinGiaoHang.jsp">Thông tin giao hàng</a> >
                <span>Phương thức thanh toán</span>
            </nav> <!--Đường dẫn hiện tại-->

            <h2>Phương thức vận chuyển</h2>
            <div class="shipping-method">
                <c:if test="${empty listDeliveryMethods}">
                    <p>Đang cập nhật phí vận chuyển...</p>
                </c:if>
                <c:forEach items="${listDeliveryMethods}" var="ship" varStatus="status">
                <label class="method-item">
                    <div style="display: flex; align-items: center; gap: 10px;">
                    <input type="radio" name="delivery" value="${ship.id}"
                           data-price="${ship.price}" onchange="updateTotal(this)"  ${status.first ? 'checked' : ''}>
                    <span>${ship.methodName}</span>
                    </div>
                    <strong id="delivery-price">
                        <fmt:formatNumber value="${ship.price}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                    </strong>
                </label>
                </c:forEach>
            </div>

            <h2>Phương thức thanh toán</h2>

            <div class="payment-method">
                <c:if test="${empty listPaymentMethods}">
                    <p style="padding:10px; color:red">Hệ thống thanh toán đang bảo trì.</p>
                </c:if>

                <c:forEach items="${listPaymentMethods}" var="pay" varStatus="status">
                <label class="pay-card">
                    <input type="radio" name="paymentId" value="${pay.id}" ${status.index == 0 ? 'checked' : ''}>
                    <img src="${pay.iconUrl}" class="icon" alt="${pay.methodName}">
                    <span>${pay.methodName}</span>
                </label>
                </c:forEach>
            </div>

            <div class="form-footer">
                <a href="GioHang.jsp" class="cart-link">Giỏ hàng</a>
                <button type="submit" class="submit-btn" >Hoàn tất đơn
                    hàng</button>
            </div>
        </form>
        <!--Đường ngăn cách-->
        <div class="divider"></div>

        <!--Cột đơn hàng bên phải-->
        <div class="order-summary">
            <h2>Đơn hàng của bạn (${sessionScope.cart.totalQuantity} sản phẩm)</h2>

            <div class="product-list-scroll">
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
                <button>Sử dụng</button>
            </div>

            <div class="summary-line">
                <span>Tạm tính</span>
                <span>
                 <fmt:formatNumber value="${sessionScope.cart.total}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
            </span>
            </div>

            <div class="summary-line">
                <span>Phí vận chuyển</span>
                <span id="ship-fee-display">20.000đ</span>
            </div>

            <hr>

            <div class="total-line">
                <div>
                    <strong>Tổng cộng</strong>
                    <small>VND</small>
                </div>
                <strong class="total-price" id="total-price-display">
                    <fmt:formatNumber value="${sessionScope.cart.total + 20000}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                </strong>
            </div>

        </div>
    </div>

</body>

<script>
    const cartTotal = ${sessionScope.cart.total};

    // Hàm chạy khi click chọn ship
    function updateTotal(radioInput) {
        // lấy giá ship từ cái thẻ vừa bấm
        const shippingFee = parseFloat(radioInput.getAttribute('data-price'));

        // tính tổng mới
        const finalTotal = cartTotal + shippingFee;

        document.getElementById('ship-fee-display').innerText = formatVND(shippingFee);
        document.getElementById('total-price-display').innerText = formatVND(finalTotal);
    }

    // Hàm format
    function formatVND(amount) {
        return amount.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace('₫', 'đ');
    }

    window.onload = function() {
        const checkedRadio = document.querySelector('input[name="delivery"]:checked');
        if(checkedRadio) updateTotal(checkedRadio);
    }
</script>


</html>