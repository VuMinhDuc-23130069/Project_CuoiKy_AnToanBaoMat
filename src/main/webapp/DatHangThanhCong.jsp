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

                    /* Nút bấm */
                    .ds-btn {
                        display: inline-block; padding: 8px 16px; font-size: 14px; border-radius: 4px;
                        cursor: pointer; text-decoration: none; border: none; transition: all 0.2s;
                    }
                    .ds-btn-primary { background-color: #007bff; color: #fff; margin-top: 5px; }
                    .ds-btn-primary:hover { background-color: #0069d9; }

                    /* Form nhập chữ ký */
                    .sign-order-form { margin-top: 15px; }
                    .form-control {
                        border: 1px solid #ced4da; border-radius: 4px; padding: 10px;
                        font-size: 14px; color: #333; background: #fff; width: 100%; box-sizing: border-box;
                        font-family: monospace; resize: vertical; min-height: 100px;
                    }
                    .form-control:focus {
                        border-color: #007bff;
                        outline: none;
                        box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.15);}

                    .sign-box-container {
                        margin: 20px 0;
                        padding: 20px;
                        background: #f8f9fa;
                        border: 1px solid #dee2e6;
                        border-radius: 8px;
                    }

                    .tool-download-box {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        background-color: #fff;
                        padding: 15px;
                        border: 1px solid #e0e0e0;
                        border-radius: 6px;
                        margin-bottom: 20px;
                    }

                    .tool-title {
                        font-size: 16px;
                        font-weight: 700;
                        color: #2c1c12;
                        margin: 0 0 5px 0;
                    }

                    .tool-desc {
                        font-size: 13px;
                        color: #555;
                        margin: 0;
                    }

                    .btn-download-tool {
                        background-color: #28a745;
                        color: white;
                        font-weight: 600;
                        white-space: nowrap;
                        margin-left: 15px;
                    }

                    .btn-download-tool:hover {
                        background-color: #218838;
                        color: white;
                    }

                    .sign-title {
                        font-size: 18px;
                        font-weight: 600;
                        color: #2c1c12;
                        margin: 0 0 10px 0;
                    }

                    .sign-guide {
                        margin: 0 0 10px 0;
                        font-size: 14px;
                        color: #444;
                    }

                    .hash-display-box {
                        background: #fff;
                        border: 1px dashed #007bff;
                        padding: 12px;
                        border-radius: 4px;
                        word-break: break-all;
                        font-family: monospace;
                        font-size: 14px;
                        color: #333;
                        margin-bottom: 10px;
                    }

                    .btn-copy-hash {
                        padding: 6px 16px;
                        cursor: pointer;
                        border: 1px solid #007bff;
                        border-radius: 4px;
                        background: #e6f2ff;
                        font-size: 13px;
                        color: #007bff;
                        font-weight: bold;
                        transition: background-color 0.2s;
                    }

                    .btn-copy-hash:hover {
                        background: #cce5ff;
                    }

                    .sign-divider {
                        border-top: 1px solid #e0e0e0;
                        margin: 20px 0;
                    }

                    .sign-label {
                        display: block;
                        font-size: 14px;
                        font-weight: 600;
                        margin-bottom: 8px;
                    }

                    .btn-submit-sign {
                        font-size: 16px;
                        padding: 10px 25px;
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
                                    <fmt:formatNumber value="${p.total}" type="currency" currencySymbol="đ"
                                        maxFractionDigits="0" />
                                </div>
                            </div>
                        </c:forEach>
                        <div class="summary-line">
                            <span>Tạm tính</span>
                            <span>
                                <fmt:formatNumber value="${finalCart.total}" type="currency" currencySymbol="đ"
                                    maxFractionDigits="0" />
                            </span>
                        </div>

                        <c:if test="${not empty discountAmount && discountAmount > 0}">
                            <div class="summary-line" style="color: #dc3545;">
                                <span>Giảm giá (${percentDiscount}%)</span>
                                <span>
                                    -
                                    <fmt:formatNumber value="${discountAmount}" type="currency" currencySymbol="đ"
                                        maxFractionDigits="0" />
                                </span>
                            </div>
                        </c:if>

                        <div class="summary-line">
                            <span>Phí vận chuyển</span>
                            <span>
                                <span>
                                    <fmt:formatNumber value="${shippingFee}" type="currency" currencySymbol="đ"
                                        maxFractionDigits="0" />
                                </span>
                            </span>
                        </div>

                        <hr>

                        <div class="total-line">
                            <div>
                                <strong>Tổng cộng</strong>
                                <small>VND</small>
                            </div>
                            <strong class="total-price">
                                <fmt:formatNumber value="${totalMoney}" type="currency" currencySymbol="đ"
                                    maxFractionDigits="0" />
                            </strong>
                        </div>

                    </div>
                </div>
                <%-- Khối xác nhận đơn hàng --%>
                <c:if test="${not empty orderHash}">
                    <div class="sign-box-container">

                        <div class="tool-download-box">
                            <div>
                                <h5 class="tool-title">Tải công cụ hỗ trợ ký số đơn hàng</h5>
                            </div>
                            <a href="<c:url value='/Downloads/ToolChuKy-1.0.exe'/>" class="ds-btn btn-download-tool">
                                Tải về máy (.exe)
                            </a>
                        </div>

                        <h4 class="sign-title">Ký xác nhận đơn hàng</h4>
                        <p class="sign-guide">
                            <strong>Hướng dẫn ký:</strong> Sao chép chuỗi băm thông tin đơn hàng bên dưới → Đưa vào Tool kèm theo private key để tạo chữ ký → Sao chép và dán chữ ký vào ô "Chữ ký" trên web và ấn "Xác nhận chữ ký".
                        </p>

                        <div id="hashValue" class="hash-display-box">
                                ${orderHash}
                        </div>

                        <button onclick="navigator.clipboard.writeText('${orderHash}'); this.innerText='✔ Đã copy hash'; setTimeout(()=>this.innerText='Copy hash', 2000);" class="btn-copy-hash">
                            Copy hash
                        </button>

                        <hr class="sign-divider">

                        <form id="signForm" action="<c:url value='/ChuKySo'/>" method="POST" class="sign-order-form">
                            <input type="hidden" name="action" value="signOrder">
                            <input type="hidden" name="order_id" value="${orderId.replace('#', '')}">

                            <div style="margin-bottom: 15px;">
                                <label class="sign-label">Chữ ký:</label>
                                <textarea id="signatureInput" name="signature" placeholder="Dán chữ ký bạn vừa tạo từ Tool vào đây..." class="form-control" required></textarea>
                            </div>

                            <button id="btnSubmitSign" type="submit" class="ds-btn ds-btn-primary btn-submit-sign">Xác nhận chữ ký</button>
                            <div id="signMessage" style="margin-top: 15px; font-weight: bold; display: none; font-size: 15px;"></div>
                        </form>
                    </div>
                </c:if>

                <div class="footer-actions">
                    <p class="help">
                        Cần hỗ trợ? <a href="<c:url value='/LienHe'/>">Liên hệ chúng tôi</a>
                    </p>
                    <button class="continue-btn" onclick="window.location.href='SanPham-TatCa'">Tiếp tục mua
                        hàng</button>
                </div>

                <script>
                    document.getElementById("signForm").addEventListener("submit", function(e) {
                        e.preventDefault();

                        const btn = document.getElementById("btnSubmitSign");
                        const msgBox = document.getElementById("signMessage");
                        const signatureInput = document.getElementById("signatureInput");

                        const formData = new FormData(this);
                        const searchParams = new URLSearchParams(formData);

                        // Hiệu ứng chờ
                        btn.innerText = "Đang xử lý...";
                        btn.disabled = true;
                        msgBox.style.display = "none";

                        fetch("ChuKySo", {
                            method: 'POST',
                            body: searchParams
                        })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error("HTTP " + response.status);
                                }
                                return response.text();
                            })
                            .then(text => {
                                if(text.trim() === 'success') {
                                    msgBox.style.display = "block";
                                    msgBox.style.color = "#28a745";
                                    msgBox.innerText = "✔ Ký xác nhận đơn hàng thành công! Đã lưu chữ ký vào hệ thống.";

                                    // Khóa form lại
                                    signatureInput.disabled = true;
                                    btn.innerText = "Đã xác nhận";
                                } else {
                                    msgBox.style.display = "block";
                                    msgBox.style.color = "#dc3545";
                                    msgBox.innerText = text.replace("error: ", "");

                                    btn.innerText = "Xác nhận chữ ký";
                                    btn.disabled = false;
                                }
                            })
                            .catch(err => {
                                msgBox.style.display = "block";
                                msgBox.style.color = "#dc3545";
                                msgBox.innerText = "Lỗi kết nối: " + err.message + ". Vui lòng thử lại!";
                                btn.innerText = "Xác nhận chữ ký";
                                btn.disabled = false;
                            });
                    });
                </script>

            </body>
            </html>