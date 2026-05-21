<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /* Đây là file cầu nối.
       Khi chạy server, nó sẽ chạy file này đầu tiên.
       Nhiệm vụ duy nhất của nó là "đá" người dùng sang Servlet.
    */
    response.sendRedirect(request.getContextPath() + "/TrangChu");
%>