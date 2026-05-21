package vn.edu.nlu.fit.controller.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.services.UserService;

import java.io.IOException;

@WebServlet(name = "LoginControler", value = "/DangNhapTaiKhoan")
public class LoginControler extends HttpServlet {
    private UserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/TrangDangNhapTK.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Users user = userService.login(email, password);

            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);

                // phân quyền
                if ("admin".equals(user.getUserRole())) {
                    response.sendRedirect(request.getContextPath() + "/AdminDashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/TrangChu");
                }
                return;
            }

            // sai email hoặc mật khẩu
            request.setAttribute("error", "Sai email hoặc mật khẩu");
            request.getRequestDispatcher("/TrangDangNhapTK.jsp").forward(request, response);

        } catch (IllegalArgumentException e) {
            // tài khoản bị khóa
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/TrangDangNhapTK.jsp").forward(request, response);
        }
    }
}