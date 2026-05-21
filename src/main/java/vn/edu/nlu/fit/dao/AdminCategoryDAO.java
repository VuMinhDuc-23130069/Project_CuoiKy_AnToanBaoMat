package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Categories;

import java.util.List;

public class AdminCategoryDAO extends BaseDao{
    public List<Categories> getAll() {
        return getJdbi().withHandle(h ->
                h.createQuery("select * from categories")
                        .mapToBean(Categories.class)
                        .list()
        );
    }

    public int countProductByCategoryID(int categoryID) {
        return getJdbi().withHandle(handle ->
                handle.createQuery("select count(*) from products_categories where category_id = :categoryID")
                        .bind("categoryID", categoryID)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    // insert
    public int insertCategory(String name, int status) {
        String sql = "insert into categories (category_name, is_actived) values (:name, :status)";

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("name", name)
                        .bind("status", status)
                        .execute()
        );
    }

    // delete
    public int deleteCategory(int id) {
        String sql = "delete from categories where id = :id";
        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute()
        );
    }

    // lấy thông tin qua trang edit
    public Categories getCategoryById(int id) {
        return getJdbi().withHandle(handle ->
                handle.createQuery("select * from categories where id = :id")
                        .bind("id", id)
                        .mapToBean(Categories.class)
                        .one()
        );
    }

    // update
    public int updateCategory(int id, String newName, int newStatus) {
        String sql = "update categories set category_name = :name, is_actived = :status where id = :id";
        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .bind("name", newName)
                        .bind("status", newStatus)
                        .execute()
        );
    }
}
