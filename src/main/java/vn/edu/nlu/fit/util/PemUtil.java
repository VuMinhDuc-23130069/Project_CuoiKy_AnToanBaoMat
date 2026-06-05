package vn.edu.nlu.fit.util;

import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

/**
 * Utility class for PEM (Privacy Enhanced Mail) format conversion
 * Handles encoding/decoding of RSA keys to/from PEM format
 */
public class PemUtil {

    private static final String PUBLIC_KEY_BEGIN = "-----BEGIN PUBLIC KEY-----";
    private static final String PUBLIC_KEY_END = "-----END PUBLIC KEY-----";
    private static final String PRIVATE_KEY_BEGIN = "-----BEGIN PRIVATE KEY-----";
    private static final String PRIVATE_KEY_END = "-----END PRIVATE KEY-----";
    private static final int LINE_LENGTH = 64;

    /**
     * Encode PublicKey to PEM format string
     * @param publicKey RSA public key
     * @return PEM formatted public key string
     */
    public static String encodeToPem(PublicKey publicKey) {
        byte[] encodedKey = publicKey.getEncoded();
        String base64Encoded = Base64.getEncoder().encodeToString(encodedKey);
        return formatPem(base64Encoded, PUBLIC_KEY_BEGIN, PUBLIC_KEY_END);
    }

    /**
     * Encode PrivateKey to PEM format string
     * @param privateKey RSA private key
     * @return PEM formatted private key string
     */
    public static String encodeToPem(PrivateKey privateKey) {
        byte[] encodedKey = privateKey.getEncoded();
        String base64Encoded = Base64.getEncoder().encodeToString(encodedKey);
        return formatPem(base64Encoded, PRIVATE_KEY_BEGIN, PRIVATE_KEY_END);
    }

    /**
     * Decode PEM formatted public key string to PublicKey object
     * @param pemPublicKey PEM formatted public key string
     * @return PublicKey object
     * @throws NoSuchAlgorithmException if RSA algorithm is not available
     * @throws InvalidKeySpecException if key spec is invalid
     */
    public static PublicKey decodePublicKey(String pemPublicKey)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        String base64Public = extractBase64(pemPublicKey, PUBLIC_KEY_BEGIN, PUBLIC_KEY_END);
        byte[] decodedKey = Base64.getDecoder().decode(base64Public);
        X509EncodedKeySpec spec = new X509EncodedKeySpec(decodedKey);
        KeyFactory factory = KeyFactory.getInstance("RSA");
        return factory.generatePublic(spec);
    }

    /**
     * Decode PEM formatted private key string to PrivateKey object
     * @param pemPrivateKey PEM formatted private key string
     * @return PrivateKey object
     * @throws NoSuchAlgorithmException if RSA algorithm is not available
     * @throws InvalidKeySpecException if key spec is invalid
     */
    public static PrivateKey decodePrivateKey(String pemPrivateKey)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        String base64Private = extractBase64(pemPrivateKey, PRIVATE_KEY_BEGIN, PRIVATE_KEY_END);
        byte[] decodedKey = Base64.getDecoder().decode(base64Private);
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(decodedKey);
        KeyFactory factory = KeyFactory.getInstance("RSA");
        return factory.generatePrivate(spec);
    }

    /**
     * Format base64 string with PEM headers and line breaks
     * @param base64Content base64 encoded key
     * @param begin PEM begin marker
     * @param end PEM end marker
     * @return PEM formatted string
     */
    private static String formatPem(String base64Content, String begin, String end) {
        StringBuilder sb = new StringBuilder();
        sb.append(begin).append("\n");

        // Add line breaks every LINE_LENGTH characters
        int index = 0;
        while (index < base64Content.length()) {
            int endIndex = Math.min(index + LINE_LENGTH, base64Content.length());
            sb.append(base64Content, index, endIndex).append("\n");
            index = endIndex;
        }

        sb.append(end).append("\n");
        return sb.toString();
    }

    /**
     * Extract base64 content from PEM formatted string
     * @param pem PEM formatted string
     * @param begin PEM begin marker
     * @param end PEM end marker
     * @return base64 decoded content
     */
    private static String extractBase64(String pem, String begin, String end) {
        String content = pem
                .replace(begin, "")
                .replace(end, "")
                .replaceAll("\\s+", "");
        return content;
    }
}

