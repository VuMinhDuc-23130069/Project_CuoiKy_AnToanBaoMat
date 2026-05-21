package vn.edu.nlu.fit.controller.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.services.AdminCategoryService;

import java.io.IOException;

@WebServlet(name = "AdminCategoryDelete", value = "/AdminCategoryDelete")
public class AdminCategoryDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr != null) {
            int id = Integer.parseInt(idStr);

            AdminCategoryService service = new AdminCategoryService();
            service.delete(id);
        }

        response.sendRedirect(request.getContextPath() + "/AdminCategory");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}