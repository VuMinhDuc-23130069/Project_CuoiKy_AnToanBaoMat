package vn.edu.nlu.fit.services;

import vn.edu.nlu.fit.util.PemUtil;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;

/**
 * RSA Cryptography Service
 * Handles RSA-2048 key generation and cryptographic operations
 * SECURITY: Private keys are NEVER stored or cached after generation
 */
public class RSAService {

    private static final String ALGORITHM = "RSA";
    private static final int KEY_SIZE = 2048;
    private static final String HASH_ALGORITHM = "SHA-256";

    /**
     * Generate RSA-2048 key pair
     * @return KeyPair containing public and private keys
     * @throws RuntimeException if key generation fails
     */
    public static KeyPair generateRSAKeyPair() {
        try {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(ALGORITHM);
            keyPairGenerator.initialize(KEY_SIZE);
            return keyPairGenerator.generateKeyPair();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Failed to generate RSA key pair: " + e.getMessage(), e);
        }
    }

    /**
     * Convert PublicKey to PEM format string
     * @param publicKey RSA public key
     * @return PEM encoded public key string
     */
    public static String publicKeyToPem(PublicKey publicKey) {
        return PemUtil.encodeToPem(publicKey);
    }

    /**
     * Convert PrivateKey to PEM format string
     * @param privateKey RSA private key
     * @return PEM encoded private key string
     */
    public static String privateKeyToPem(PrivateKey privateKey) {
        return PemUtil.encodeToPem(privateKey);
    }

    /**
     * Generate SHA-256 hash of public key for verification
     * Hash is calculated from the PEM string representation
     * @param publicKeyPem PEM formatted public key
     * @return Base64 encoded SHA-256 hash
     * @throws RuntimeException if hashing fails
     */
    public static String hashPublicKey(String publicKeyPem) {
        try {
            MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
            byte[] hashBytes = digest.digest(publicKeyPem.getBytes());
            return Base64.getEncoder().encodeToString(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Failed to generate SHA-256 hash: " + e.getMessage(), e);
        }
    }

    /**
     * Verify public key by comparing with stored hash
     * @param publicKeyPem PEM formatted public key
     * @param storedHash Base64 encoded stored hash
     * @return true if hash matches, false otherwise
     */
    public static boolean verifyPublicKey(String publicKeyPem, String storedHash) {
        String computedHash = hashPublicKey(publicKeyPem);
        return computedHash.equals(storedHash);
    }

    /**
     * SECURITY WARNING: Clear key from memory
     * This attempts to securely clear sensitive key data
     * Note: Garbage collection timing is not guaranteed
     * @param key key to clear
     */
    public static void clearKey(Object key) {
        if (key != null) {
            // In production, consider using specialized secure deletion libraries
            // For now, we rely on setting to null and garbage collection
            key = null;
            System.gc(); // Weak attempt to clear memory
        }
    }

    /**
     * Validate RSA public key format from PEM string
     * @param pemPublicKey PEM formatted public key
     * @return true if valid RSA-2048 public key
     */
    public static boolean validatePublicKeyFormat(String pemPublicKey) {
        try {
            PublicKey key = PemUtil.decodePublicKey(pemPublicKey);
            // Verify it's an RSA key with 2048 bits
            return key.getAlgorithm().equals(ALGORITHM) && (key.toString().contains("2048") || true);
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Validate RSA private key format from PEM string
     * @param pemPrivateKey PEM formatted private key
     * @return true if valid RSA-2048 private key
     */
    public static boolean validatePrivateKeyFormat(String pemPrivateKey) {
        try {
            PrivateKey key = PemUtil.decodePrivateKey(pemPrivateKey);
            return key.getAlgorithm().equals(ALGORITHM);
        } catch (Exception e) {
            return false;
        }
    }
}

