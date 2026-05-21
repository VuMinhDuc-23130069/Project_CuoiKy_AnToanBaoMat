package vn.edu.nlu.fit.controller.admin.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.services.AdminOrderService;

import java.io.IOException;

@WebServlet(name = "AdminOrderEdit", value = "/AdminOrderEdit")
public class AdminOrderEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            AdminOrderService service = new AdminOrderService();
            Orders order = service.getById(id);

            request.setAttribute("order", order);
            request.getRequestDispatcher("Admin-QuanLyDonHang-ChinhSua.jsp").forward(request, response);
        } else {
            response.sendRedirect("AdminOrder");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));

        AdminOrderService service = new AdminOrderService();
        service.updateStatus(id, status);

        response.sendRedirect(request.getContextPath() + "/AdminOrder");
    }
}