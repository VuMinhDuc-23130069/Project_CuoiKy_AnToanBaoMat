package vn.edu.nlu.fit.controller.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.services.UserService;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", value = "/ResetPassword")
public class ResetPasswordController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");

        Users user = userService.findByResetToken(token);
        if (user == null) {
            response.sendError(403);
            return;
        }

        request.setAttribute("token", token);
        request.getRequestDispatcher("DatLaiMatKhau.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // check null / trống
        if (password == null || confirmPassword == null
                || password.isEmpty() || confirmPassword.isEmpty()) {

            request.setAttribute("error", "Vui lòng nhập đầy đủ mật khẩu");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/DatLaiMatKhau.jsp")
                    .forward(request, response);
            return;
        }

        //  check nhập lại mật khẩu
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu nhập lại không khớp");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/DatLaiMatKhau.jsp")
                    .forward(request, response);
            return;
        }

        try {
            // reset password (check token + regex + hash ở Service)
            userService.resetPasswordByToken(token, password);

            // thành công → về trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/TrangDangNhapTK.jsp");

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("token", token);
            request.getRequestDispatcher("/DatLaiMatKhau.jsp")
                    .forward(request, response);
        }
    }
}