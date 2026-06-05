package vn.edu.nlu.fit.services;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

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
    public static String hashOrderInfo(Orders order) throws Exception {
    // Băm: mã đơn | tên | sdt | địa chỉ | khuyến mãi | pttt | thời gian | tổng tiền
    String data = order.getId()
            + "|" + order.getFullname()
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
