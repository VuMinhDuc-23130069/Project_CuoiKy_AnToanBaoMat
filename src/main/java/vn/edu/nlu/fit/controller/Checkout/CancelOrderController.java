package vn.edu.nlu.fit.controller.Checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.dao.OrderDAO;

import java.io.IOException;

@WebServlet(name = "CancelOrderController", value = "/CancelOrder")
public class CancelOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("TrangDangNhapTK.jsp");
            return;
        }
        String idParam = request.getParameter("id");
        if (idParam != null) {
            int orderId = Integer.parseInt(idParam);

            // 3. Gọi DAO để hủy
            OrderDAO orderDAO = new OrderDAO();
            boolean isCancelled = orderDAO.cancelOrder(orderId);

            if (isCancelled) {
                request.getSession().setAttribute("message", "Đã hủy đơn hàng thành công!");
            } else {
                request.getSession().setAttribute("error", "Không thể hủy đơn hàng này (Đơn đã được xử lý).");
            }
        }
        response.sendRedirect(request.getHeader("referer"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}