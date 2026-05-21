package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.AdminCategoryDAO;
import vn.edu.nlu.fit.model.Categories;

import java.util.List;

public class AdminCategoryService {
    AdminCategoryDAO dao = new AdminCategoryDAO();

    public List<Categories> getListForManage() {
        List<Categories> list = dao.getAll();

        for (Categories c : list) {
            int count = dao.countProductByCategoryID(c.getId());
            c.setTotalProducts(count);
        }

        return list;
    }

    public boolean createCategory(String name, int status) {
        int row = dao.insertCategory(name, status);
        return row > 0;
    }

    public void update(int id, String newName, int newStatus) {
        dao.updateCategory(id, newName, newStatus);
    }

    public void delete(int id) {
        dao.deleteCategory(id);
    }

    public Categories getCategoryById(int id) {
        return dao.getCategoryById(id);
    }
}
