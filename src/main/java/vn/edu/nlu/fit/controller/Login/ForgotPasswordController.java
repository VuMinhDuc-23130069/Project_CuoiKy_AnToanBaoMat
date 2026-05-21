package vn.edu.nlu.fit.controller.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.services.UserService;

import java.io.IOException;


@WebServlet(name = "ForgotPasswordController", value = "/QuenMatKhau")
public class ForgotPasswordController extends HttpServlet {
    private UserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("QuenMatKhau.jsp").forward(request, response);//hiern thị form nhập email
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI(), request.getContextPath());
            userService.sendResetPasswordEmail(email, baseUrl);
            request.setAttribute("success", "Đã gửi link khôi phục mật khẩu qua email của bạn");
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
        }
        request.getRequestDispatcher("/QuenMatKhau.jsp").forward(request, response);


    }
}