package vn.edu.nlu.fit.controller.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.services.AdminCategoryService;

import java.io.IOException;

@WebServlet(name = "AdminCategoryCreate", value = "/AdminCategoryCreate")
public class AdminCategoryCreate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Admin-QuanLyDanhMuc-TaoMoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("categoryName");
        String statusStr = request.getParameter("status");
        int status = Integer.parseInt(statusStr);

        AdminCategoryService service = new AdminCategoryService();
        service.createCategory(name, status);

        response.sendRedirect(request.getContextPath() + "/AdminCategory");
    }
}