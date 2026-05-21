package vn.edu.nlu.fit.controller.admin.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.services.AdminOrderService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrder", value = "/AdminOrder")
public class AdminOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminOrderService service = new AdminOrderService();
        List<Orders> list = service.getAll();

        request.setAttribute("listOrder", list);
        request.getRequestDispatcher("Admin-QuanLyDonHang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}