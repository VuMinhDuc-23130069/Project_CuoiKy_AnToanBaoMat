package vn.edu.nlu.fit.dao;

import org.jdbi.v3.core.statement.PreparedBatch;
import vn.edu.nlu.fit.model.Products;

import java.util.List;


public class ProductDAO extends BaseDao {

    //lấy 1 sp theo id 
    public Products findById(int id) {
        return getJdbi().withHandle(h ->
                h.createQuery("""
                            select *
                            from products
                            where id = :id""").bind("id", id).mapToBean(Products.class).findOne().orElse(null)
        );
    }


    //lay du lieu ra
    public List<Products> getListProduct() {
        return getJdbi().withHandle(h ->
                h.createQuery("select * from products").mapToBean(Products.class).list());
    }

    public Products getProduct(int id) {
        return getJdbi().withHandle(h ->
                h.createQuery("select * from products where id=:id").bind("id", id).
                        mapToBean(Products.class).stream().findFirst().orElse(null));
    }

    public void insertProduct(List<Products> products) {

        // jdbi.useHandle() -> không trả về kết quả -> dùng khi câu sql insert, update, delete
        // jdbi.withHandle() -> dùng khi câu sql là select

        //viết theo lamda function
        getJdbi().useHandle(handle -> {
            //dùng hàm prepareBatch() khi muốn insert nhiều dòng
            //dùng hàm createUpdate() khi muốn insert một dòng
            PreparedBatch preparedBatch = handle.prepareBatch("insert into products values(:id,:name,:img,:price)");

            products.forEach(product -> {
                preparedBatch.bindBean(product).add();
            });
            preparedBatch.execute();
        });
    }

    public List<Products> getProductsByFilter(int categoryID, String sortType, double minPrice, double maxPrice) {
        String sql = "select p.* from products p";
        if (categoryID > 0)
            sql += " join products_categories pc on p.id = pc.product_id where pc.category_id = :categoryID ";

        if (maxPrice > 0) {
            if (categoryID > 0) {
                sql += " and p.price between :min and :max ";
            } else {
                sql += " where (p.price between :min and :max) ";
            }
        }

        switch (sortType != null ? sortType : "") {
            case "price_asc":
                sql += " order by p.price ASC";
                break;
            case "price_desc":
                sql += " order by p.price DESC";
                break;
            case "name_az":
                sql += " order by p.product_name ASC";
                break;
            case "name_za":
                sql += " order by p.product_name DESC";
                break;
            case "oldest":
                sql += " order by p.id ASC";
                break;
            case "newest":
                sql += " order by p.id DESC";
                break;
            default:
                sql += " order by p.id DESC";
                break;
        }

        String finalSql = sql;
        return getJdbi().withHandle(h -> {
            var query = h.createQuery(finalSql);
            if (categoryID > 0) {
                query.bind("categoryID", categoryID);
            }
            if (maxPrice > 0) {
                query.bind("min", minPrice);
                query.bind("max", maxPrice);
            }
            return query.mapToBean(Products.class).list();
        });
    }

    public List<Products> getTopNewestProducts(int limit) {
        String sql = "SELECT id, product_name AS productName, price, " +
                "image_url AS imageURL "+
                "FROM products " +
                "ORDER BY id DESC " +
                "LIMIT :limit";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("limit", limit)
                        .mapToBean(Products.class)
                        .list());
    }
    public List<Products> getTopFvouriteProduct(int limit){
        String sql = "Select p.id, p.product_name as productName, " +
                "p.price, p.image_url as imageURL " +
                "FROM products p join products_orders po " +
                "on p.id = po.product_id " +
                "GROUP BY p.id, p.product_name, p.price, p.image_url " +
                "ORDER BY sum(po.quantity) DESC " +
                "LIMIT :limit";

        List<Products> list= getJdbi().withHandle(handle ->
                        handle.createQuery(sql).bind("limit", limit).mapToBean(Products.class)
                        .list());

        //Trường hợp chưa có người mua hàng
        if (list.isEmpty()) {
            String sqlFallback = "select id, product_name AS productName, " +
                    "price, image_url AS imageURL " +
                    "FROM products ORDER BY RAND() LIMIT :limit";
            return getJdbi().withHandle(handle ->
                    handle.createQuery(sqlFallback).bind("limit", limit)
                            .mapToBean(Products.class)
                            .list());
        }
        return list;
    }


    public List<Products> searchByName(String keyword) {
        String sql = """
                    SELECT *
                    FROM products
                    WHERE product_name LIKE :kw
                """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("kw", "%" + keyword + "%")
                        .mapToBean(Products.class)
                        .list()
        );
    }

}
