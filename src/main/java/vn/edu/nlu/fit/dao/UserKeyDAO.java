package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.UserKey;

public class UserKeyDAO extends BaseDao {

    // Hàm lấy thông tin khoá đang hoạt động
    public UserKey getActiveKeyByUserId(int userId) {
        String sql = " SELECT * FROM user_keys WHERE user_id = :userId AND is_active = 1 LIMIT 1";

        return getJdbi().withHandle(h -> h.createQuery(sql)
                .bind("userId", userId)
                .mapToBean(UserKey.class)
                .findOne()
                .orElse(null)
        );
    }

    // Hàm báo mất khoá
    public void revokeKey(int userId) {
        String sql = """
                UPDATE user_keys
                SET is_active = 0, revoked_at = NOW()
                WHERE user_id = :userId AND is_active = 1
                """;

        getJdbi().withHandle(h -> h.createUpdate(sql)
                .bind("userId", userId)
                .execute()
        );
    }
}