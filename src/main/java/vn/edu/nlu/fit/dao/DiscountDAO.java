package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Discounts;
import java.util.List;

public class DiscountDAO extends BaseDao {

    // Lấy danh sách các mã giảm giá còn lượt sử dụng và native
    public List<Discounts> getAvailableDiscounts() {
        String sql = "SELECT * FROM discounts WHERE quantity > 0 AND discount_status = 1";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Discounts.class)
                        .list()
        );
    }

    // Lấy chi tiết 1 mã giảm giá theo ID
    public Discounts getDiscountById(int id) {
        String sql = "SELECT * FROM discounts WHERE id = :id";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Discounts.class)
                        .findOne()
                        .orElse(null)
        );
    }
}
