package vn.edu.nlu.fit.services;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Service for handling file exports and downloads
 * Manages PEM file downloads with proper HTTP headers
 */
public class FileExportService {

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd_HHmmss");

    /**
     * Prepare response for file download
     * @param response HttpServletResponse object
     * @param filename Name of the file to download
     * @param content File content
     * @throws IOException if writing to response fails
     */
    public static void downloadFile(HttpServletResponse response, String filename, String content) throws IOException {
        // Set response headers
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        response.setContentLength(content.getBytes(StandardCharsets.UTF_8).length);
        response.setCharacterEncoding("UTF-8");

        // Write content to output stream
        try (OutputStream out = response.getOutputStream()) {
            out.write(content.getBytes(StandardCharsets.UTF_8));
            out.flush();
        }
    }

    /**
     * Generate filename for public key PEM file with timestamp
     * @param userId User ID
     * @return Filename like "public_key_user_123_2024-05-23_143025.pem"
     */
    public static String generatePublicKeyFilename(int userId) {
        String timestamp = LocalDateTime.now().format(DATE_FORMATTER);
        return String.format("public_key_user_%d_%s.pem", userId, timestamp);
    }

    /**
     * Generate filename for private key PEM file with timestamp
     * @param userId User ID
     * @return Filename like "private_key_user_123_2024-05-23_143025.pem"
     */
    public static String generatePrivateKeyFilename(int userId) {
        String timestamp = LocalDateTime.now().format(DATE_FORMATTER);
        return String.format("private_key_user_%d_%s.pem", userId, timestamp);
    }

    /**
     * Generate filename for private key backup file
     * @param userId User ID
     * @param label Key label
     * @return Filename like "rsa_backup_user_123_main_key.pem"
     */
    public static String generateBackupFilename(int userId, String label) {
        String safeLabel = label != null ? label.replaceAll("[^a-zA-Z0-9_-]", "_") : "main_key";
        return String.format("rsa_backup_user_%d_%s.pem", userId, safeLabel);
    }

    /**
     * Create downloadable key bundle (public + private keys in one file for immediate use)
     * SECURITY: Should only be used immediately after generation, not for storage
     * @param publicKeyPem Public key in PEM format
     * @param privateKeyPem Private key in PEM format
     * @param label Key label/description
     * @return Combined content ready for download
     */
    public static String createKeyBundle(String publicKeyPem, String privateKeyPem, String label) {
        StringBuilder bundle = new StringBuilder();
        bundle.append("# RSA Key Bundle Generated: ").append(LocalDateTime.now()).append("\n");
        bundle.append("# Label: ").append(label != null ? label : "Default Key").append("\n");
        bundle.append("# IMPORTANT: Keep the private key secure. Never share it!\n");
        bundle.append("# Delete this file after securing it.\n\n");

        bundle.append("# ===== PUBLIC KEY =====\n");
        bundle.append(publicKeyPem).append("\n");

        bundle.append("# ===== PRIVATE KEY =====\n");
        bundle.append(privateKeyPem).append("\n");

        bundle.append("# ===== END OF KEY BUNDLE =====\n");

        return bundle.toString();
    }

    /**
     * Create a secure text file with key recovery instructions
     * @param publicKeyHash SHA-256 hash of the public key
     * @return Instructions text
     */
    public static String createKeyRecoveryInstructions(String publicKeyHash) {
        return "KEY RECOVERY INSTRUCTIONS\n" +
               "==========================\n\n" +
               "Public Key Hash (for verification): " + publicKeyHash + "\n\n" +
               "IMPORTANT SECURITY NOTES:\n" +
               "1. The private key is NOT stored on our servers\n" +
               "2. This is your only opportunity to download the private key\n" +
               "3. Store the private key in a secure location\n" +
               "4. Never share the private key with anyone\n" +
               "5. For maximum security, encrypt this file before storing it\n\n" +
               "NEXT STEPS:\n" +
               "1. Download and save the private key securely\n" +
               "2. Download the public key for distribution\n" +
               "3. Test your keys with our encryption tool\n" +
               "4. Consider setting up two-factor authentication\n";
    }
}

