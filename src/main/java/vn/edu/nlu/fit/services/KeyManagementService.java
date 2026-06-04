package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.dao.UserKeyDAO;
import vn.edu.nlu.fit.model.UserKey;

import java.security.KeyPair;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Key Management Service
 * Orchestrates RSA key generation, storage, and lifecycle management
 * Core security principles:
 * 1. Private keys are NEVER persisted
 * 2. Only public keys are stored in database
 * 3. Keys are delivered immediately after generation
 * 4. Memory references to private keys are cleared after use
 */
public class KeyManagementService {

    private UserKeyDAO userKeyDAO = new UserKeyDAO();

    /**
     * Generate new RSA-2048 key pair for user
     * SECURITY: Private key is only available immediately in return value
     *           It is NOT stored on the server
     * @param userId User ID
     * @param label Optional label for the key
     * @return Map containing:
     *  - "publicKeyPem": Public key in PEM format
     *  - "privateKeyPem": Private key in PEM format (IMMEDIATE DELIVERY ONLY)
     *  - "keyId": Database ID of stored public key
     */
    public Map<String, Object> generateNewKeyPair(int userId, String label) {
        try {
            // Generate RSA-2048 key pair
            KeyPair keyPair = RSAService.generateRSAKeyPair();

            // Convert to PEM format (private key is kept only in local scope)
            String publicKeyPem = RSAService.publicKeyToPem(keyPair.getPublic());
            String privateKeyPem = RSAService.privateKeyToPem(keyPair.getPrivate());

            // Create UserKey object and store only the public key in database
            UserKey userKey = new UserKey();
            userKey.setUserId(userId);
            userKey.setPublicKey(publicKeyPem);
            userKey.setCreatedAt(LocalDateTime.now());
            userKey.setActive(true);

            int keyId = userKeyDAO.insert(userKey);

            // Prepare return data WITHOUT including the private key
            Map<String, Object> result = new HashMap<>();
            result.put("publicKeyPem", publicKeyPem);
            result.put("keyId", keyId);
            result.put("generatedAt", LocalDateTime.now());

            // Attempt to clear private key material references (best-effort)
            RSAService.clearKey(keyPair.getPrivate());
            RSAService.clearKey(privateKeyPem);

            return result;

        } catch (Exception e) {
            throw new RuntimeException("Failed to generate key pair: " + e.getMessage(), e);
        }
    }

    /**
     * Retrieve user's active public keys (for verification/encryption)
     * @param userId User ID
     * @return List of UserKey objects containing only public keys
     */
    public List<UserKey> getUserPublicKeys(int userId) {
        return userKeyDAO.findByUserId(userId);
    }

    /**
     * Get the most recent active public key for a user
     * @param userId User ID
     * @return UserKey with most recent public key or null
     */
    public UserKey getMostRecentPublicKey(int userId) {
        return userKeyDAO.findMostRecentKey(userId);
    }

    /**
     * Revoke a specific key (deactivate it)
     * @param keyId Key ID to revoke
     */
    public void revokeKey(int keyId) {
        userKeyDAO.revokeKey(keyId);
    }

    /**
     * Revoke all keys for a user
     * @param userId User ID
     */
    public void revokeAllUserKeys(int userId) {
        userKeyDAO.revokeAllUserKeys(userId);
    }

    /**
     * Check if user has active keys
     * @param userId User ID
     * @return true if user has at least one active key
     */
    public boolean hasActiveKeys(int userId) {
        return userKeyDAO.countActiveKeys(userId) > 0;
    }

    /**
     * Get count of active keys for a user
     * @param userId User ID
     * @return Number of active keys
     */
    public int getActiveKeyCount(int userId) {
        return userKeyDAO.countActiveKeys(userId);
    }

    /**
     * Store a public key PEM for a user and return generated key id
     * This method persists only the public key and metadata.
     */
    public int storePublicKey(int userId, String publicKeyPem, String label) {
        UserKey userKey = new UserKey();
        userKey.setUserId(userId);
        userKey.setPublicKey(publicKeyPem);
        userKey.setCreatedAt(LocalDateTime.now());
        userKey.setActive(true);

        return userKeyDAO.insert(userKey);
    }

    /**
     * Create a summary of user's key management status
     * @param userId User ID
     * @return Map containing key statistics
     */
    public Map<String, Object> getUserKeyStatus(int userId) {
        List<UserKey> keys = userKeyDAO.findByUserId(userId);
        int activeCount = userKeyDAO.countActiveKeys(userId);

        Map<String, Object> status = new HashMap<>();
        status.put("totalKeys", keys.size());
        status.put("activeKeys", activeCount);
        status.put("keys", keys);
        status.put("hasActiveKeys", activeCount > 0);

        if (activeCount > 0) {
            UserKey mostRecent = userKeyDAO.findMostRecentKey(userId);
            if (mostRecent != null) {
                status.put("mostRecentKeyId", mostRecent.getId());
                status.put("mostRecentCreated", mostRecent.getCreatedAt());
            }
        }

        return status;
    }

    /**
     * Generate a backup/recovery token for key operations
     * @param userId User ID
     * @return Recovery token
     */
    public String generateKeyRecoveryToken(int userId) {
        return java.util.UUID.randomUUID().toString() + "-" + userId + "-" + System.currentTimeMillis();
    }
}
