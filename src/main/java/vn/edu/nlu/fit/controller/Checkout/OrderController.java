package vn.edu.nlu.fit.controller.Checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.Cart.Cart;
import vn.edu.nlu.fit.dao.DeliveryMethodDao;
import vn.edu.nlu.fit.dao.OrderDAO;
import vn.edu.nlu.fit.dao.PaymentMethodDao;
import vn.edu.nlu.fit.model.Users;

import java.io.IOException;

@WebServlet(name = "OrderController", value = "/Order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("GioHang.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        //kiểm giỏ trc khi đi
        if (cart == null || cart.getTotalQuantity() == 0) {
            response.sendRedirect("GioHang.jsp");
            return;
        }

        //lấy pttt và ptvc
        String paymentId = request.getParameter("paymentId");
        String deliveryId = request.getParameter("delivery");

        int shipId = Integer.parseInt(deliveryId);

        // Gọi DAO để lấy giá tiền chính xác từ DB
        DeliveryMethodDao deliveryDao = new DeliveryMethodDao();
        double shippingFee = deliveryDao.getShippingPriceById(shipId);

        // Tính tổng tiền cuối cùng
        double finalTotal = cart.getTotal() + shippingFee;

        // lấy từ hàm dopost đã vết bên checkoutcontroller
        String name = (String) session.getAttribute("order_name");
        String phone = (String) session.getAttribute("order_phone");
        String address = (String) session.getAttribute("order_address");
        String email = (String) session.getAttribute("order_email");

        String note = (String) session.getAttribute("ORDER_NOTE");
        if (note == null) {
            note = ""; // Tránh bị null khi lưu xuống DB
        }

        // Kiểm tra lưu user trong session tên là "auth" hay "user"
        Users user = (Users) session.getAttribute("user");
        Integer userId = (user != null) ? user.getId() : null;

        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.createOrder(name, phone, email, address,
                Integer.parseInt(deliveryId), Integer.parseInt(paymentId), finalTotal, userId, cart, note);

        if (orderId != -1) {
            PaymentMethodDao paymentDao = new PaymentMethodDao();
            String paymentName = paymentDao.getPaymentMehthodNameById(Integer.parseInt(paymentId));


            //guwirr dl đi
            request.setAttribute("orderId", "#" + orderId);
            request.setAttribute("customerName", name);
            request.setAttribute("customerPhone", phone);
            request.setAttribute("customerEmail", email);
            request.setAttribute("customerAddress", address);


            //gửi giỏ hàng sang request để jsp hiển thị lần cuối
            request.setAttribute("finalCart", cart);
            //gửi qua dathangthnagcong
            request.setAttribute("shippingFee", shippingFee);
            request.setAttribute("totalMoney", finalTotal);

            //pttt
            request.setAttribute("paymentMethodName", paymentName);
            //mua xong xóa đi
            session.removeAttribute("cart");
            session.removeAttribute("order_name");
            session.removeAttribute("order_phone");
            session.removeAttribute("order_address");
            session.removeAttribute("order_email");
            //note
            session.removeAttribute("ORDER_NOTE");

            //chuyển trang
            request.getRequestDispatcher("DatHangThanhCong.jsp").forward(request, response);
        } else {
            response.getWriter().println("Lỗi hệ thống! Không thể tạo đơn hàng.");
        }
    }
}