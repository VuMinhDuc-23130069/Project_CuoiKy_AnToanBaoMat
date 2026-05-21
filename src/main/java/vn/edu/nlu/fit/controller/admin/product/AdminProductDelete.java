package vn.edu.nlu.fit.controller.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.services.AdminProductService;

import java.io.IOException;

@WebServlet(name = "AdminProductDelete", value = "/AdminProductDelete")
public class AdminProductDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if(idStr != null) {
            AdminProductService service = new AdminProductService();
            service.delete(Integer.parseInt(idStr));
        }
        response.sendRedirect(request.getContextPath() + "/AdminProduct");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}