package vn.edu.nlu.fit.controller.Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.dao.OrderDAO;
import vn.edu.nlu.fit.dao.UserKeyDAO;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.UserKey;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.util.PemUtil;
import vn.edu.nlu.fit.util.RSAUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.PublicKey;
import java.util.List;

@WebServlet(name = "AccountController", value = "/TaiKhoanCuaBan")
public class AccountController extends HttpServlet {
    //private OrderService orderService = new OrderService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("TrangDangNhapTK.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        UserKeyDAO keyDao = new UserKeyDAO();

        List<Orders> listOrders = orderDAO.getOrdersByUserId(user.getId());
        // Bỏ qua các đơn hàng đã hủy
        listOrders.removeIf(order -> order.getOrderStatus() == 4);

        // Kiểm tra chữ ký số
        for (Orders o : listOrders) {
            // Đơn hàng không có chữ ký số -> không an toàn
            if (o.getDigitalSignature() == null || o.getDigitalSignature().isEmpty()) {
                o.setAltered(true);
                continue;
            }

            try {
                // Băm dữ liệu hiện tại trong db
                String currentHash = hashOrderInfo(o);

                // Lấy Public Key của khách hàng
                UserKey userKey = keyDao.getActiveKeyByUserId(o.getUserID());

                // Nếu khách hàng không có khoá Public Key -> Không thể xác thực
                if (userKey == null || userKey.getPublicKey() == null || userKey.getPublicKey().isEmpty()) {
                    o.setAltered(true);
                    continue;
                }

                // Chuyển chuỗi văn bản PEM thành đối tượng PublicKey
                PublicKey publicKey = PemUtil.decodePublicKey(userKey.getPublicKey());

                // Kiểm tra chữ ký bằng RSA
                boolean isValid = RSAUtils.verify(currentHash, o.getDigitalSignature(), publicKey);

                o.setAltered(!isValid);

            } catch (Exception e) {
                e.printStackTrace();
                o.setAltered(true);
            }
        }
        request.setAttribute("orders", listOrders);

        // đã login → vào trang tài khoản
        request.getRequestDispatcher("/TaiKhoan-CoDonHang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    // Hàm băm thông tin đơn hàng
    private String hashOrderInfo(Orders order) throws Exception {
        String data = order.getId()
                + "|" + order.getFullName()
                + "|" + order.getPhone()
                + "|" + order.getOrderAddress()
                + "|" + order.getDiscountID()
                + "|" + order.getPaymentMethodID()
                + "|" + order.getOrderDate()
                + "|" + order.getTotal();

        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hashBytes = digest.digest(data.getBytes(StandardCharsets.UTF_8));

        StringBuilder hex = new StringBuilder();
        for (byte b : hashBytes) {
            hex.append(String.format("%02x", b));
        }
        return hex.toString();
    }
}