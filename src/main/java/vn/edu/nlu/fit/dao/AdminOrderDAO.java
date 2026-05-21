package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Orders;

import java.util.List;

public class AdminOrderDAO extends BaseDao{
    public List<Orders> getAll() {
        return getJdbi().withHandle(handle ->
                handle.createQuery("select * from orders order by order_date desc")
                        .mapToBean(Orders.class)
                        .list()
        );
    }

    public Orders getById(int id) {
        String sql = "select o.*, d.discount_name " +
                "from orders o " +
                "left join discounts d on o.discount_id = d.id " +
                "where o.id = :id";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .map((rs, ctx) -> {
                            Orders o = new Orders();

                            o.setId(rs.getInt("id"));
                            o.setUserID(rs.getInt("user_id"));
                            o.setFullName(rs.getString("fullName"));
                            o.setPhone(rs.getString("phone"));
                            o.setEmail(rs.getString("email"));
                            o.setOrderAddress(rs.getString("order_address"));
                            o.setOrderStatus(rs.getInt("order_status"));

                            o.setTotal(rs.getDouble("total"));

                            o.setOrderDate(rs.getTimestamp("order_date"));

                            o.setDeliveryMethodID(rs.getInt("delivery_method_id"));
                            o.setPaymentMethodID(rs.getInt("payment_method_id"));
                            o.setDiscountID(rs.getInt("discount_id"));

                            o.setDiscountName(rs.getString("discount_name"));
                            o.setNote(rs.getString("note"));

                            return o;
                        }).one()
        );
    }

    public void updateStatus(int id, int status) {
        getJdbi().useHandle(handle ->
                handle.createUpdate("update orders set order_status = :status where id = :id")
                        .bind("id", id)
                        .bind("status", status)
                        .execute()
        );
    }
}
