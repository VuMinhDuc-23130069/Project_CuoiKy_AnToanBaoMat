package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Categories;
import vn.edu.nlu.fit.model.Products;

import java.util.List;

public class AdminProductDAO extends BaseDao{
    public List<Products> getAllProducts() {
        String sql = "SELECT p.id, p.product_name, p.image_url, p.price, p.quantity, c.category_name " +
                "FROM products p " +
                "JOIN products_categories pc ON p.id = pc.product_id " +
                "JOIN categories c ON pc.category_id = c.id " +
                "ORDER BY p.id DESC";

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .map((rs, context) -> new Products(
                                rs.getInt("id"),
                                rs.getString("product_name"),
                                rs.getDouble("price"),
                                rs.getString("image_url"),
                                rs.getInt("quantity"),
                                rs.getString("category_name")
                        ))
                        .list()
        );
    }

    public int insertProduct(Products p, int categoryId) {
        String sqlProduct = "INSERT INTO products (product_name, price, quantity, product_expiry_date, " +
                "product_description, ingredient, instruction, attention, uses, image_url, product_status) " +
                "VALUES (:name, :price, :qty, :expiry, :desc, :ingre, :instr, :att, :uses, :img, 1)";

        return getJdbi().inTransaction(handle -> {
            int productId = handle.createUpdate(sqlProduct)
                    .bind("name", p.getProductName())
                    .bind("price", p.getPrice())
                    .bind("qty", p.getQuantity())
                    .bind("expiry", p.getProductExpiryDate())
                    .bind("desc", p.getProductDescription())
                    .bind("ingre", p.getIngredient())
                    .bind("instr", p.getInstruction())
                    .bind("att", p.getAttention())
                    .bind("uses", p.getUses())
                    .bind("img", p.getImageURL())
                    .executeAndReturnGeneratedKeys("id")
                    .mapTo(Integer.class)
                    .one();

            handle.createUpdate("INSERT INTO products_categories (product_id, category_id) VALUES (:pid, :cid)")
                    .bind("pid", productId)
                    .bind("cid", categoryId)
                    .execute();

            return productId;
        });
    }

    public List<Categories> getCategoryIsActived() {
        return getJdbi().withHandle(handle ->
                handle.createQuery("select * from categories where is_actived = 1")
                        .mapToBean(Categories.class)
                        .list()
        );
    }

    public void updateProduct(Products p, int categoryId) {
        String sql = "UPDATE products SET product_name=:name, price=:price, quantity=:qty, " +
                "product_expiry_date=:expiry, product_description=:desc, ingredient=:ingre, " +
                "instruction=:instr, attention=:att, uses=:uses, image_url=:img " +
                "WHERE id=:id";

        getJdbi().useTransaction(handle -> {
            handle.createUpdate(sql)
                    .bind("name", p.getProductName())
                    .bind("price", p.getPrice())
                    .bind("qty", p.getQuantity())
                    .bind("expiry", p.getProductExpiryDate())
                    .bind("desc", p.getProductDescription())
                    .bind("ingre", p.getIngredient())
                    .bind("instr", p.getInstruction())
                    .bind("att", p.getAttention())
                    .bind("uses", p.getUses())
                    .bind("img", p.getImageURL())
                    .bind("id", p.getId())
                    .execute();

            handle.createUpdate("UPDATE products_categories SET category_id = :cid WHERE product_id = :pid")
                    .bind("cid", categoryId)
                    .bind("pid", p.getId())
                    .execute();
        });
    }

    public void deleteProduct(int id) {
        getJdbi().useTransaction(handle -> {
            handle.createUpdate("DELETE FROM products_categories WHERE product_id = :id").bind("id", id).execute();
            handle.createUpdate("DELETE FROM products WHERE id = :id").bind("id", id).execute();
        });
    }

    // Lấy thông tin để hiển thị ở trang chỉnh sửa
    public Products getProductById(int id) {
        String sql = "SELECT p.*, pc.category_id FROM products p " +
                "LEFT JOIN products_categories pc ON p.id = pc.product_id " +
                "WHERE p.id = :id";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .map((rs, ctx) -> {
                            Products p = new Products();
                            p.setId(rs.getInt("id"));
                            p.setProductName(rs.getString("product_name"));
                            p.setPrice(rs.getDouble("price"));
                            p.setQuantity(rs.getInt("quantity"));
                            p.setImageURL(rs.getString("image_url"));
                            p.setProductExpiryDate(rs.getString("product_expiry_date"));
                            p.setProductDescription(rs.getString("product_description"));
                            p.setIngredient(rs.getString("ingredient"));
                            p.setInstruction(rs.getString("instruction"));
                            p.setAttention(rs.getString("attention"));
                            p.setUses(rs.getString("uses"));
                            p.setCategoryName(String.valueOf(rs.getInt("category_id")));
                            return p;
                        }).one()
        );
    }
}
