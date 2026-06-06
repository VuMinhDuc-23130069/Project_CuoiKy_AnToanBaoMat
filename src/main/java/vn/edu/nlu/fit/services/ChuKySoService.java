package vn.edu.nlu.fit.services;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

import vn.edu.nlu.fit.dao.OrderDAO;
import vn.edu.nlu.fit.dao.UserKeyDAO;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.UserKey;

public class ChuKySoService {

    private UserKeyDAO userKeyDAO;

    public ChuKySoService() {
        this.userKeyDAO = new UserKeyDAO();
    }

    public UserKey getActiveKey(int userId) {
        return userKeyDAO.getActiveKeyByUserId(userId);
    }

    // Xử lý báo mất khoá
    public boolean revokeKey(int userId) {
        try {
            userKeyDAO.revokeKey(userId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isKeyValid(int orderId) {
        OrderDAO orderDAO = new OrderDAO();
        Orders order = orderDAO.getOrderById(orderId);

        // Nếu đơn hàng không có key_id
        if (order == null || order.getKeyId() == null || order.getKeyId() == 0) {
            return false;
        }

        // Lấy đúng khóa đã dùng cho đơn hàng này
        UserKey keyUsedForOrder = userKeyDAO.findById(order.getKeyId());

        // Nếu khóa đã bị báo mất -> Không cho ký
        if (keyUsedForOrder == null || keyUsedForOrder.getRevokedAt() != null) {
            return false;
        }

        return true;
    }

    public static String hashOrderInfo(Orders order) throws Exception {
    // Băm: mã đơn | tên | sdt | địa chỉ | khuyến mãi | pttt | thời gian | tổng tiền
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
