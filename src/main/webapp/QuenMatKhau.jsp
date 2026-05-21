<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>

    <style>
        body {
            font-family: Tahoma, Arial, sans-serif;
        }
        .modal {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .modal-content {
            width: 400px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        input {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            background: #6D4C41;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        a {
            color: #a46b2c;
            text-decoration: none;
        }
        .alert {
            padding: 10px;
            margin-bottom: 10px;
        }
        .alert-danger {
            background: #f8d7da;
        }
        .alert-success {
            background: #d4edda;
        }
    </style>
</head>

<body>

<div class="modal">
    <div class="modal-content">

        <h2>Khôi phục mật khẩu</h2>

        <!-- hiển thị lỗi tk eamil ko tồn tại -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <!-- nhập tk -->
        <c:if test="${empty step}">
            <form action="<c:url value='/QuenMatKhau'/>" method="post">
                <input type="email" name="email" placeholder="Nhập email của bạn" required>
                <button type="submit">Khôi phục</button>
                <p>
                    <a href="<c:url value='/TrangChu'/>">Bạn đã nhớ mật khẩu? Quay lại đăng nhập</a>
                </p>
            </form>
        </c:if>


        <!--thông báo thành công -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>

        </c:if>

    </div>
</div>

</body>
</html>
