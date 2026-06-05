package vn.edu.nlu.fit.util;

import java.security.SecureRandom;
import java.util.Base64;

/**
 * AES Encryption Utility (Optional Companion to RSA)
 * Handles symmetric encryption for actual message content
 * RSA is used for key exchange, AES-256 for data encryption
 */
public class EncryptionUtil {

    /**
     * Generate a secure random encryption key
     * @return Base64-encoded key
     */
    public static String generateRandomKey() {
        SecureRandom random = new SecureRandom();
        byte[] key = new byte[32]; // 256-bit key
        random.nextBytes(key);
        return Base64.getEncoder().encodeToString(key);
    }

    /**
     * Generate initialization vector for AES
     * @return Base64-encoded IV
     */
    public static String generateIV() {
        SecureRandom random = new SecureRandom();
        byte[] iv = new byte[16]; // 128-bit IV
        random.nextBytes(iv);
        return Base64.getEncoder().encodeToString(iv);
    }

    /**
     * Get random bytes
     * @param length Length in bytes
     * @return Random bytes encoded in Base64
     */
    public static String getRandomBytes(int length) {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[length];
        random.nextBytes(bytes);
        return Base64.getEncoder().encodeToString(bytes);
    }

    /**
     * Create a session key for message encryption
     * This key would normally be encrypted with recipient's public key
     * @return Session key info
     */
    public static String createSessionKey() {
        return generateRandomKey();
    }
}

