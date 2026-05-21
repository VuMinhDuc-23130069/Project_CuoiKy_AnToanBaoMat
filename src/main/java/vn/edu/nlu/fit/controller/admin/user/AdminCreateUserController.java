package vn.edu.nlu.fit.controller.admin.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.services.HashMD5;
import vn.edu.nlu.fit.services.UserService;

import java.io.IOException;

@WebServlet(name = "AdminCreateUserController", value = "/AdminCreateUser")
public class AdminCreateUserController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/Admin-Quanlynguoidung-taomoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String phone    = request.getParameter("phone");
        String role     = request.getParameter("role");
        String status   = request.getParameter("status");

        Users user = new Users();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setUserRole(role != null ? role : "user");
        user.setActive("active".equals(status));

        String hashPass = HashMD5.md5(password);
        user.setPassword_hash(hashPass);

        userService.createByAdmin(user);

        response.sendRedirect(request.getContextPath() + "/AdminUser");
        }


}