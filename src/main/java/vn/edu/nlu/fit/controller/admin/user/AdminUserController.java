package vn.edu.nlu.fit.controller.admin.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.services.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUserController", value = "/AdminUser")
public class AdminUserController extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> users = userService.findAll();
        request.setAttribute("users", users);

        request.getRequestDispatcher("/Admin-Quanlynguoidung.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}