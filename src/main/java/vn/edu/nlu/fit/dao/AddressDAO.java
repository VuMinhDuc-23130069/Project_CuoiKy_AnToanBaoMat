package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.Address;

import java.util.List;

public class AddressDAO extends BaseDao {


    public List<Address> findByUserId(int userId) {
        String sql = "SELECT * FROM addresses WHERE user_id = ?";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, userId)
                        .mapToBean(Address.class)
                        .list()
        );
    }

    //    public void insert(Address a) {
//        String sql = """
//                    INSERT INTO addresses(user_id, recipient_name, phone_number,
//                    province, district, ward, street, is_default)
//                    VALUES (:userId, :recipientName, :phoneNumber,
//                    :province, :district, :ward, :street, :isDefault)
//                """;
//
//        getJdbi().useHandle(handle ->
//                handle.createUpdate(sql)
//                        .bindBean(a)
//                        .execute()
//        );
//    }
    public void insert(Address a) {
        String sql = """
                    INSERT INTO addresses
                    (user_id, recipient_name, phone_number,
                     province, district, ward, street, is_default)
                    VALUES
                    (:userId, :recipientName, :phoneNumber,
                     :province, :district, :ward, :street, :isDefault)
                """;

        getJdbi().useHandle(h ->
                h.createUpdate(sql)
                        .bind("userId", a.getUserId())
                        .bind("recipientName", a.getRecipientName())
                        .bind("phoneNumber", a.getPhoneNumber())
                        .bind("province", a.getProvince())
                        .bind("district", a.getDistrict())
                        .bind("ward", a.getWard())
                        .bind("street", a.getStreet())
                        .bind("isDefault", a.getIsDefault())
                        .execute()
        );
    }

    public void update(Address a) {
        String sql = """
                    UPDATE addresses
                    SET recipient_name = :recipientName,
                        phone_number = :phoneNumber,
                        province = :province,
                        district = :district,
                        ward = :ward,
                        street = :street,
                        is_default = :isDefault
                    WHERE id = :id AND user_id = :userId
                """;

        getJdbi().useHandle(h ->
                h.createUpdate(sql)
                        .bind("id", a.getId())
                        .bind("userId", a.getUserId())
                        .bind("recipientName", a.getRecipientName())
                        .bind("phoneNumber", a.getPhoneNumber())
                        .bind("province", a.getProvince())
                        .bind("district", a.getDistrict())
                        .bind("ward", a.getWard())
                        .bind("street", a.getStreet())
                        .bind("isDefault", a.getIsDefault())
                        .execute()
        );
    }
    public void deleteByIdAndUser(int id, int userId) {
        String sql = """
        DELETE FROM addresses
        WHERE id = :id AND user_id = :userId
    """;

        getJdbi().useHandle(h ->
                h.createUpdate(sql)
                        .bind("id", id)
                        .bind("userId", userId)
                        .execute()
        );
    }



    public void unsetDefault(int userId) {
        String sql = "UPDATE addresses SET is_default = 0 WHERE user_id = ?";
        getJdbi().useHandle(h -> h.createUpdate(sql).bind(0, userId).execute());
    }

}
