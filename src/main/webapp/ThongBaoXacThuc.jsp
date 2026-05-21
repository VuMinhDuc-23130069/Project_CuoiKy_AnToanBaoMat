<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác thực email</title>

    <!-- Font & icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        body {
            margin: 0;
            font-family: "Tahoma", Arial, sans-serif;
            background: #fff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .verify-box {
            background: #fff;
            width: 420px;
            max-width: calc(100% - 32px);
            border-radius: 12px;
            padding: 32px 28px;
            text-align: center;
            box-shadow: 0 12px 40px rgba(0,0,0,0.2);
            animation: fadeIn 0.4s ease;
        }

        .verify-icon {
            font-size: 64px;
            color: #03a9f4;
            margin-bottom: 16px;
        }

        .verify-box h2 {
            margin: 10px 0;
            font-size: 24px;
            color: #333;
        }

        .verify-box p {
            font-size: 15px;
            color: #555;
            line-height: 1.6;
            margin: 10px 0;
        }

        .btn-home {
            display: inline-block;
            margin-top: 22px;
            padding: 12px 28px;
            background: #03a9f4;
            color: #fff;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            transition: background 0.2s ease, transform 0.1s ease;
        }

        .btn-home:hover {
            background: #0288d1;
            transform: translateY(-1px);
        }

    </style>
</head>
<body>

<div class="verify-box">
    <div class="verify-icon">
        <i class="fa-solid fa-envelope-circle-check"></i>
    </div>

    <h2>Đăng ký thành công</h2>

    <p>
        Chúng tôi đã gửi <strong>link xác thực</strong> tới email của bạn.
    </p>

    <p>
        Vui lòng kiểm tra email và xác thực tài khoản mới có thể đăng nhập.
    </p>

    <a href="<c:url value='/DangNhapTaiKhoan'/>" class="btn-home">
        <i class="fa-solid fa-house"></i> Về trang Đăng nhập
    </a>
</div>

</body>
</html>
