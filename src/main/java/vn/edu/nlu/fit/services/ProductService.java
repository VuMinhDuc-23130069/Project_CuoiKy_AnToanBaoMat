package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.ProductDAO;
import vn.edu.nlu.fit.model.Products;

import java.util.List;

public class ProductService {
    ProductDAO proDao= new ProductDAO();


    public List<Products> getListProduct() {
        return proDao.getListProduct();
    }

    public Products getDetail(int id) {
        return proDao.findById(id);
    }

    public List<Products> getProductsByFilter(String stringCategoryID, String sortType, String priceRange) {
        int categoryID = 0;
        try {
            if (stringCategoryID != null) categoryID = Integer.parseInt(stringCategoryID);
        } catch (NumberFormatException e) {
            categoryID = 0;
        }

        double min = 0;
        double max = 0;

        if (priceRange != null && priceRange.contains("-")) {
            try {
                String[] parts = priceRange.split("-");
                min = Double.parseDouble(parts[0]);
                max = Double.parseDouble(parts[1]);
            } catch (Exception e) {
                // Nếu lỗi format thì reset về 0 để không lọc bậy
                min = 0; max = 0;
            }
        }

        // Gọi DAO
        return proDao.getProductsByFilter(categoryID, sortType, min, max);
    }
}
