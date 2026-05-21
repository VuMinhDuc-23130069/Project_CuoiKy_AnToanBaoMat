package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.AdminDiscountDAO;
import vn.edu.nlu.fit.model.Discounts;

import java.util.List;

public class AdminDiscountService {
    AdminDiscountDAO dao = new AdminDiscountDAO();

    public List<Discounts> getAll() {
        return dao.getAll();
    }
    public void insert(Discounts d) {
        dao.insert(d);
    }
    public Discounts getById(int id) {
        return dao.getDiscountById(id);
    }
    public void update(Discounts d) {
        dao.update(d);
    }
    public void delete(int id) {
        dao.delete(id);
    }
}
