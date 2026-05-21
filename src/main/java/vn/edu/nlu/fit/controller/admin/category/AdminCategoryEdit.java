package vn.edu.nlu.fit.controller.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Categories;
import vn.edu.nlu.fit.services.AdminCategoryService;

import java.io.IOException;

@WebServlet(name = "AdminCategoryEdit", value = "/AdminCategoryEdit")
public class AdminCategoryEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);

        AdminCategoryService service = new AdminCategoryService();
        Categories c = service.getCategoryById(id);

        request.setAttribute("cate", c);

        request.getRequestDispatcher("Admin-QuanLyDanhMuc-ChinhSua.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("categoryName");
        int status = Integer.parseInt(request.getParameter("status"));

        AdminCategoryService service = new AdminCategoryService();
        service.update(id, name, status);

        response.sendRedirect(request.getContextPath() + "/AdminCategory");
    }
}