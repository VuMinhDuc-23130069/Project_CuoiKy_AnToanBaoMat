package vn.edu.nlu.fit.controller.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Categories;
import vn.edu.nlu.fit.services.AdminCategoryService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategory", value = {"/AdminCategory"})
public class AdminCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminCategoryService service = new AdminCategoryService();

        List<Categories> list = service.getListForManage();
        request.setAttribute("listCategory", list);
        request.getRequestDispatcher("Admin-QuanLyDanhMuc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}