package vn.edu.nlu.fit.controller.Checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.dao.OrderDAO;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.Products_Orders;
import vn.edu.nlu.fit.model.Users;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDetailController", value = "/OrderDetail")
public class OrderDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;
        if (user == null) {
            response.sendRedirect("DangNhapTK.jsp");
            return;
        }
        //lấy id đơn từ url
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("TaiKhoan.jsp");
            return;
        }
        int orderId = Integer.parseInt(idParam);
        OrderDAO dao = new OrderDAO();
        Orders order = dao.getOrdersById(orderId);

       //Không thể xem đơn hàng nười khác
        if (order == null || order.getUserID() != user.getId()) {
            response.sendRedirect("TaiKhoan.jsp");
            return;
        }
        //Lấy danh sách sản phẩm
        List<Products_Orders> details = dao.getOrderDetails(orderId);
        request.setAttribute("order", order);
        request.setAttribute("details", details);
        request.getRequestDispatcher("TaiKhoan-CoDonHang-Chitiet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}