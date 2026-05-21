package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.Cart.Cart;
import vn.edu.nlu.fit.Cart.CartItem;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.Products_Orders;

import java.sql.Timestamp;
import java.util.List;

public class OrderDAO extends BaseDao{
    //tìm user id tướng ứng vs  order_date hiện sp đã đặt
    public List<Orders> findByUserId(int userId) {
        String sql = """
                    SELECT *
                    FROM orders
                    WHERE user_id = :userId
                    ORDER BY order_date DESC
                """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("userId", userId)
                        .mapToBean(Orders.class)
                        .list()
        );
    }

    public int createOrder(String name, String phone, String email, String address,
                           int deliveryId, int paymentId, double totalMoney, Integer userId, Cart cart, String note) {

        return getJdbi().inTransaction(handle -> {
            try {
                String sqlOrder = "INSERT INTO orders " +
                        "(fullname, phone, email, total, order_date, order_address, order_status, user_id, delivery_method_id, payment_method_id, note) " +
                        "VALUES " +
                        "(:name, :phone, :email, :total, :date, :address, :status, :userId, :deliveryId, :paymentId, :note)";

                int orderId = handle.createUpdate(sqlOrder)
                        .bind("name", name)
                        .bind("phone", phone)
                        .bind("email", email)
                        .bind("total", totalMoney)
                        .bind("date", new Timestamp(System.currentTimeMillis()))
                        .bind("address", address)
                        .bind("status", 1)
                        .bind("userId", userId)
                        .bind("deliveryId", deliveryId)
                        .bind("paymentId", paymentId)
                        .bind("note", note)
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(Integer.class)
                        .one();

                String sqlDetail = "INSERT INTO products_orders " +
                        "(order_id, product_id, product_name, quantity, price_at_time) " +
                        "VALUES " +
                        "(:orderId, :productId, :productName, :quantity, :price)";

                for (CartItem item : cart.getItem()) {
                    handle.createUpdate(sqlDetail)
                            .bind("orderId", orderId)
                            .bind("productId", item.getProduct().getId())
                            .bind("productName",item.getProduct().getProductName())
                            .bind("quantity", item.getQuantity())
                            .bind("price", item.getProduct().getPrice())
                            .execute();
                }
                return orderId;
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Lỗi tạo đơn hàng: " + e.getMessage());
            }
        });
    }

    //DS đơn hàng của người mua đã đăng nhập
    public List<Orders> getOrdersByUserId(int userId) {
        String sql = "SELECT o.id, o.user_id AS userID, o.total AS total, o.order_status AS orderStatus, " +
                "o.order_date AS orderDate, " +
                "o.order_address AS orderAddress, " +
                "o.fullName AS fullName, o.phone, o.email, d.method_name as deliveryMethod " +
                "FROM orders o left join deliverymethods d on o.delivery_method_id = d.id  " +
                "WHERE user_id = :userId " +
                "ORDER BY order_date DESC";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql).bind("userId", userId).mapToBean(Orders.class).list());
    }

    //Lấy 1 đơn làm chi tiết đơn hàng
    public Orders getOrdersById(int orderId) {
        String sql = "SELECT o.id, o.user_id AS userID, o.total AS total, o.order_status AS orderStatus, " +
                "o.order_date AS orderDate, " +
                "o.order_address AS orderAddress, " +
                "o.fullName AS fullName, o.phone, o.email, d.method_name as deliveryMethod, d.price AS shippingFee " +
                "FROM orders o left join deliverymethods d on o.delivery_method_id = d.id  " +
                "WHERE o.id = :orderId";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("orderId", orderId)
                        .mapToBean(Orders.class)
                        .findOne()
                        .orElse(null));
    }

    //Hủy đơn
    public boolean cancelOrder(int orderId) {
        String sql = "update orders SET order_status = 4 WHERE id = :orderId AND order_status = 1";
        int rowsAffected = getJdbi().withHandle(handle ->
                handle.createUpdate(sql).bind("orderId", orderId).execute());
        return rowsAffected > 0;
    }

    // Lấy danh sách sản phẩm trong đơn
    public List<Products_Orders> getOrderDetails(int orderId) {
        String sql = "SELECT " +
                "od.order_id AS orderID, od.product_id AS productID, od.quantity, " +
                "od.price_at_time AS priceAtTime, p.product_name AS productName, p.image_url AS productImg " +
                "FROM products_orders od JOIN products p ON od.product_id = p.id " +
                "WHERE od.order_id = :orderId";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("orderId", orderId)
                        .mapToBean(Products_Orders.class)
                        .list());
    }

}
