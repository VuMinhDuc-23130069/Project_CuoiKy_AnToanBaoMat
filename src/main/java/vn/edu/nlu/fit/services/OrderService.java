package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.OrderDAO;
import vn.edu.nlu.fit.model.Orders;

import java.util.List;

public class OrderService {

    private OrderDAO orderDAO = new OrderDAO();

    public List<Orders> getOrdersByUser(int userId) {
        return orderDAO.findByUserId(userId);
    }
}
