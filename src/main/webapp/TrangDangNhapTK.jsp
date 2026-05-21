<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập - Ngũ Cốc Ngon</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            position: relative;
        }

        .close-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 28px;
            cursor: pointer;
            color: #999;
            text-decoration: none;
            transition: color 0.3s;
        }

        .close-btn:hover {
            color: #333;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h2 {
            color: #6D4C41;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .login-header p {
            color: #757575;
            font-size: 14px;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .form-group label {
            color: #333;
            font-size: 14px;
            font-weight: 500;
        }

        .form-group input {
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #6D4C41;
        }

        .error-message {
            background: #ffebee;
            color: #c62828;
            padding: 10px;
            border-radius: 5px;
            font-size: 14px;
            text-align: center;
        }

        .recaptcha-notice {
            font-size: 12px;
            color: #757575;
            line-height: 1.5;
            text-align: center;
        }

        .recaptcha-notice a {
            color: #a46b2c;
            text-decoration: none;
        }

        .recaptcha-notice a:hover {
            text-decoration: underline;
        }

        .submit-btn {
            background: #6D4C41;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: #5a3d33;
        }

        .login-links {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
            text-align: center;
        }

        .login-links a {
            color: #a46b2c;
            text-decoration: none;
            font-size: 14px;
        }

        .login-links a:hover {
            text-decoration: underline;
        }

        .divider {
            width: 100%;
            height: 1px;
            background: #e0e0e0;
            margin: 20px 0;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }

            .login-header h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <a href="<c:url value='/TrangChu'/>" class="close-btn" title="Đóng">&times;</a>

    <div class="login-header">
        <h2>Đăng Nhập Tài Khoản</h2>
        <p>Nhập Email và mật khẩu của bạn</p>
    </div>

    <form action="<c:url value='/DangNhapTaiKhoan'/>" method="post" class="login-form">

    <c:if test="${not empty error}">
            <div class="error-message">
                ${error}
            </div>
        </c:if>

        <div class="form-group">
            <label for="email">Email đăng nhập</label>
            <input type="email" id="email" name="email" placeholder="example@email.com" required>
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
        </div>

        <p class="recaptcha-notice">
            This site is protected by reCAPTCHA and the Google
            <a href="https://policies.google.com/privacy" target="_blank">Privacy Policy</a> and
            <a href="https://policies.google.com/terms" target="_blank">Terms of Service</a> apply.
        </p>

        <button type="submit" class="submit-btn">Đăng Nhập</button>

        <div class="divider"></div>

        <div class="login-links">
            <a href="<c:url value='/TaoTaiKhoan'/>">Khách hàng mới? Tạo tài khoản</a>
            <a href="<c:url value='/QuenMatKhau'/>">Quên mật khẩu? Khôi phục mật khẩu</a>
        </div>
    </form>
</div>
</body>
</html>