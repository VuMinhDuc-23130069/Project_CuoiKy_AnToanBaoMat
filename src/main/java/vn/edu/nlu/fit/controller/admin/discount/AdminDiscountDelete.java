package vn.edu.nlu.fit.controller.admin.discount;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.services.AdminDiscountService;

import java.io.IOException;

@WebServlet(name = "AdminDiscountDelete", value = "/AdminDiscountDelete")
public class AdminDiscountDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if(idStr != null) {
            AdminDiscountService service = new AdminDiscountService();
            service.delete(Integer.parseInt(idStr));
        }
        response.sendRedirect(request.getContextPath() + "/AdminDiscount");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}