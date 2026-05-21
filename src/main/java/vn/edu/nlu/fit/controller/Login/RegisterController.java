package vn.edu.nlu.fit.controller.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.services.UserService;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/TaoTaiKhoan")
public class RegisterController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/TaoTaiKhoan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String birthday = request.getParameter("birthday");

        //check nhập lại mk
        if (confirmPassword == null || !password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu nhập lại không khớp");
            request.getRequestDispatcher("/TaoTaiKhoan.jsp")
                    .forward(request, response);
            return;
        }
        try {

            userService.register(name, email, phoneNumber, password, birthday);

            request.setAttribute(
                    "success",
                    "Chúng tôi đã gửi email xác thực. Vui lòng kiểm tra hộp thư.");
            request.getRequestDispatcher("/ThongBaoXacThuc.jsp").forward(request, response);

            // đăng nhập luôn sau khi đăng ký
            Users user = userService.login(email, password);

            // lưu user vào session
            request.getSession().setAttribute("user", user);


        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/TaoTaiKhoan.jsp")
                    .forward(request, response);
        }
    }
}