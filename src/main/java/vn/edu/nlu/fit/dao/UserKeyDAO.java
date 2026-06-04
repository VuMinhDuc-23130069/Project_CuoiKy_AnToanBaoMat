package vn.edu.nlu.fit.dao;

import vn.edu.nlu.fit.model.UserKey;
import java.util.List;

/**
 * DAO for UserKey entity
 * Handles database operations for RSA public key storage
 * Maps to: user_keys table
 * Columns: id, user_id, public_key, is_active, created_at, revoked_at
 * 
 * IMPORTANT: Private keys are NEVER stored in database
 */
public class UserKeyDAO extends BaseDao {

    /**
     * Insert a new public key for a user
     * @param userKey UserKey object containing public key data
     * @return Generated key ID
     */
    public int insert(UserKey userKey) {
        String sql = """
                INSERT INTO user_keys (
                    user_id, public_key,
                    is_active, created_at
                ) VALUES (
                    :userId, :publicKey,
                    :active, :createdAt
                )
                """;

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(userKey)
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(Integer.class)
                        .one()
        );
    }

    /**
     * Find all active keys for a user
     * @param userId User ID
     * @return List of active UserKey objects
     */
    public List<UserKey> findByUserId(int userId) {
        String sql = """
                SELECT id,
                       user_id AS userId,
                       public_key AS publicKey,
                       is_active AS active,
                       created_at AS createdAt,
                       revoked_at AS revokedAt
                FROM user_keys
                WHERE user_id = :userId AND is_active = 1
                ORDER BY created_at DESC
                """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .mapToBean(UserKey.class)
                        .list()
        );
    }

    /**
     * Find a specific key by ID
     * @param keyId Key ID
     * @return UserKey object or null if not found
     */
    public UserKey findById(int keyId) {
        String sql = """
                SELECT id,
                       user_id AS userId,
                       public_key AS publicKey,
                       is_active AS active,
                       created_at AS createdAt,
                       revoked_at AS revokedAt
                FROM user_keys
                WHERE id = :id
                """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", keyId)
                        .mapToBean(UserKey.class)
                        .findOne()
                        .orElse(null)
        );
    }

    /**
     * Find the most recent active key for a user
     * @param userId User ID
     * @return Most recent UserKey or null if none exists
     */
    public UserKey findMostRecentKey(int userId) {
        String sql = """
                SELECT id,
                       user_id AS userId,
                       public_key AS publicKey,
                       is_active AS active,
                       created_at AS createdAt,
                       revoked_at AS revokedAt
                FROM user_keys
                WHERE user_id = :userId AND is_active = 1
                ORDER BY created_at DESC
                LIMIT 1
                """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .mapToBean(UserKey.class)
                        .findOne()
                        .orElse(null)
        );
    }

    /**
     * Revoke (deactivate) a key
     * Sets is_active = false and revoked_at = NOW()
     * @param keyId Key ID
     * @return Number of rows updated
     */
    public int revokeKey(int keyId) {
        String sql = """
                UPDATE user_keys 
                SET is_active = false, revoked_at = NOW()
                WHERE id = :id
                """;

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", keyId)
                        .execute()
        );
    }

    /**
     * Deactivate all keys for a user
     * @param userId User ID
     * @return Number of rows updated
     */
    public int revokeAllUserKeys(int userId) {
        String sql = """
                UPDATE user_keys 
                SET is_active = false, revoked_at = NOW()
                WHERE user_id = :userId
                """;

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("userId", userId)
                        .execute()
        );
    }

    /**
     * Count active keys for a user
     * @param userId User ID
     * @return Number of active keys
     */
    public int countActiveKeys(int userId) {
        String sql = """
                SELECT COUNT(*) FROM user_keys
                WHERE user_id = :userId AND is_active = 1
                """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .mapTo(Integer.class)
                        .one()
        );
    }
}
