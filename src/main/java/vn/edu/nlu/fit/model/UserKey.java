package vn.edu.nlu.fit.model;

import java.sql.Timestamp;

/**
 * Model representing user RSA public key storage
 * Maps to user_keys table
 * Private keys are NEVER stored - only used immediately for download/email
 *
 * Database Mapping:
 * - id → id
 * - user_id → userId
 * - public_key → publicKey
 * - is_active → active
 * - created_at → createdAt
 * - revoked_at → revokedAt
 */
public class UserKey {
    private int id;
    private int userId;
    private String publicKey;
    private boolean isActive;
    private Timestamp createdAt;
    private Timestamp revokedAt;

    public UserKey() {
    }

    public UserKey(int id, int userId, String publicKey, boolean isActive, Timestamp createdAt, Timestamp revokedAt) {
        this.id = id;
        this.userId = userId;
        this.publicKey = publicKey;
        this.isActive = isActive;
        this.createdAt = createdAt;
        this.revokedAt = revokedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getRevokedAt() {
        return revokedAt;
    }

    public void setRevokedAt(Timestamp revokedAt) {
        this.revokedAt = revokedAt;
    }

    @Override
    public String toString() {
        return "UserKey{" +
                "id=" + id +
                ", userId=" + userId +
                ", active=" + isActive +
                ", createdAt=" + createdAt +
                ", revokedAt=" + revokedAt +
                '}';
    }
}
