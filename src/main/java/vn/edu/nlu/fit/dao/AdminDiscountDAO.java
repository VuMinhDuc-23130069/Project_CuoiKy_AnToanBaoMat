package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Discounts;

import java.util.List;

public class AdminDiscountDAO extends BaseDao{
    public List<Discounts> getAll() {
        return getJdbi().withHandle(handle ->
                handle.createQuery("select * from discounts order by id DESC")
                        .mapToBean(Discounts.class)
                        .list()
        );
    }

    // 2. Thêm mới
    public int insert(Discounts d) {
        String sql = "insert into discounts (discount_name, percent_discount, quantity, discount_status) " +
                "values (:name, :percent, :qty, :status)";
        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("name", d.getDiscountName())
                        .bind("percent", d.getPercentDiscount())
                        .bind("qty", d.getQuantity())
                        .bind("status", d.getDiscountStatus())
                        .execute()
        );
    }

    public Discounts getDiscountById(int id) {
        return getJdbi().withHandle(handle ->
                handle.createQuery("select * from discounts where id = :id")
                        .bind("id", id)
                        .mapToBean(Discounts.class)
                        .one()
        );
    }

    public int update(Discounts d) {
        String sql = "update discounts set discount_name=:name, percent_discount=:percent, " +
                "quantity=:qty, discount_status=:status where id=:id";
        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("name", d.getDiscountName())
                        .bind("percent", d.getPercentDiscount())
                        .bind("qty", d.getQuantity())
                        .bind("status", d.getDiscountStatus())
                        .bind("id", d.getId())
                        .execute()
        );
    }

    public int delete(int id) {
        return getJdbi().withHandle(handle ->
                handle.createUpdate("delete from discounts where id = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}
