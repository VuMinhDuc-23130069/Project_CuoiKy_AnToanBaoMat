package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.AdminOrderDAO;
import vn.edu.nlu.fit.model.Orders;

import java.util.List;

public class AdminOrderService {
    AdminOrderDAO dao = new AdminOrderDAO();

    public List<Orders> getAll() {
        return dao.getAll();
    }
    public Orders getById(int id) {
        return dao.getById(id);
    }
    public void updateStatus(int id, int status) {
        dao.updateStatus(id, status);
    }
}
