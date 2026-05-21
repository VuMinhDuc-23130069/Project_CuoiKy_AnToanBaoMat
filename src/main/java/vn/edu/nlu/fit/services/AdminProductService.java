package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.AdminProductDAO;
import vn.edu.nlu.fit.model.Categories;
import vn.edu.nlu.fit.model.Products;

import java.util.List;

public class AdminProductService {
    AdminProductDAO dao = new AdminProductDAO();

    public List<Products> getAll() {
        return dao.getAllProducts();
    }

    public void insert(Products p, int categoryId) {
        dao.insertProduct(p, categoryId);
    }

    public void update(Products p, int categoryId) {
        dao.updateProduct(p, categoryId);
    }

    public void delete(int id) {
        dao.deleteProduct(id);
    }

    public Products getById(int id) {
        return dao.getProductById(id);
    }

    public List<Categories> getCategoryIsActived() {
        return dao.getCategoryIsActived();
    }
}
