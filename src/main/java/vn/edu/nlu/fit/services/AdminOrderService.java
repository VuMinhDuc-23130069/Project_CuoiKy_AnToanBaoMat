package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.AdminOrderDAO;
import vn.edu.nlu.fit.dao.UserKeyDAO;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.UserKey;
import vn.edu.nlu.fit.util.PemUtil;
import vn.edu.nlu.fit.util.RSAUtils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.PublicKey;
import java.util.List;

public class AdminOrderService {
    AdminOrderDAO dao = new AdminOrderDAO();
    UserKeyDAO keyDao = new UserKeyDAO();

    public List<Orders> getAll() {
        List<Orders> list = dao.getAll();

        for (Orders o : list) {
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
        return list;
    }
    public Orders getById(int id) {
        return dao.getById(id);
    }
    public void updateStatus(int id, int status) {
        dao.updateStatus(id, status);
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
