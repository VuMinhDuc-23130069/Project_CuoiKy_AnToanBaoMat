package vn.edu.nlu.fit.model;

import java.time.LocalDateTime;

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
    private String publicKey; // PEM encoded public key
    private boolean active; // Column name: is_active
    private LocalDateTime createdAt;
    private LocalDateTime revokedAt;

    public UserKey() {
    }

    public UserKey(int userId, String publicKey, LocalDateTime createdAt) {
        this.userId = userId;
        this.publicKey = publicKey;
        this.createdAt = createdAt;
        this.active = true;
        this.revokedAt = null;
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public LocalDateTime getRevokedAt() {
        return revokedAt;
    }

    public void setRevokedAt(LocalDateTime revokedAt) {
        this.revokedAt = revokedAt;
    }

    @Override
    public String toString() {
        return "UserKey{" +
                "id=" + id +
                ", userId=" + userId +
                ", active=" + active +
                ", createdAt=" + createdAt +
                ", revokedAt=" + revokedAt +
                '}';
    }
}

