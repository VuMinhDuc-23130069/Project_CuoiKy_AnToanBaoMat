package vn.edu.nlu.fit.controller.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.services.UserService;

import java.io.IOException;

@WebServlet(name = "VerifyEmailController", value = "/VerifyEmail")

public class VerifyEmailController extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String token = request.getParameter("token");

        boolean success = userService.verifyEmail(token);

        if (success) {
            request.setAttribute("success", "Xác thực thành công! Bạn có thể đăng nhập.");
        } else {
            request.setAttribute("error", "Link không hợp lệ hoặc đã hết hạn.");
        }

        request.getRequestDispatcher("/TrangDangNhapTK.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
}
