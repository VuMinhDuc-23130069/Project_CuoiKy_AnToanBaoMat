package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.OrderDAO;
import vn.edu.nlu.fit.model.Orders;

import java.util.List;

public class OrderService {

    private OrderDAO orderDAO = new OrderDAO();

    public List<Orders> getOrdersByUser(int userId) {
        return orderDAO.findByUserId(userId);
    }

    public void createHashForOrder(int orderId) {
        try {
            Orders order = orderDAO.getOrderById(orderId);

            if (order == null) {
                System.out.println("Order null");
                return;
            }

            System.out.println("Order = " + order);

            String hash = ChuKySoService.hashOrderInfo(order);

            System.out.println("Hash = " + hash);

            orderDAO.updateOrderHash(orderId, hash);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
