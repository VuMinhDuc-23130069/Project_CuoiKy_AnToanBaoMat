package vn.edu.nlu.fit.controller.keys;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.google.gson.Gson;
import vn.edu.nlu.fit.model.UserKey;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.fit.services.*;
import vn.edu.nlu.fit.utils.GsonUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * RSA Key Management Controller Servlet
 * Handles all key generation, download, and email endpoints
 * 
 * Endpoints:
 * - POST /generate-key: Generate new RSA-2048 key pair
 * - GET /download-public-key: Download public key in PEM format
 * - GET /download-private-key: Download private key (ONE-TIME ONLY)
 * - POST /send-private-key: Send private key via email
 * - GET /list-keys: List all active keys for current user
 * - POST /revoke-key: Revoke a specific key
 * - GET /key-status: Get current key status for user
 * 
 * Security:
 * - All endpoints require authentication (user session)
 * - Private keys are downloaded only once immediately after generation
 * - Email delivery provides one-time key transmission
 * - All responses are JSON with proper error handling
 */
@WebServlet(urlPatterns = {
        "/generate-key",
        "/download-public-key",
        "/download-private-key",
        "/send-private-key",
        "/list-keys",
        "/revoke-key",
        "/key-status"
})
public class KeyController extends HttpServlet {

    private KeyManagementService keyManagementService = new KeyManagementService();
    private Gson gson = GsonUtil.getGson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getRequestURI();

        // Check authentication
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Authentication required");
            return;
        }

        Users currentUser = (Users) session.getAttribute("user");

        try {
            if (path.endsWith("/generate-key")) {
                handleGenerateKey(request, response, currentUser);
            } else if (path.endsWith("/send-private-key")) {
                handleSendPrivateKey(request, response, currentUser);
            } else if (path.endsWith("/revoke-key")) {
                handleRevokeKey(request, response, currentUser);
            } else {
                sendError(response, HttpServletResponse.SC_NOT_FOUND, "Endpoint not found");
            }
        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getRequestURI();

        // Check authentication
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Authentication required");
            return;
        }

        Users currentUser = (Users) session.getAttribute("user");

        try {
            if (path.endsWith("/download-public-key")) {
                handleDownloadPublicKey(request, response, currentUser);
            } else if (path.endsWith("/download-private-key")) {
                handleDownloadPrivateKey(request, response, currentUser);
            } else if (path.endsWith("/list-keys")) {
                handleListKeys(request, response, currentUser);
            } else if (path.endsWith("/key-status")) {
                handleKeyStatus(request, response, currentUser);
            } else {
                sendError(response, HttpServletResponse.SC_NOT_FOUND, "Endpoint not found");
            }
        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error: " + e.getMessage());
        }
    }

    /**
     * POST /generate-key
     * Generate new RSA-2048 key pair
     * Request params: label (optional)
     * Response: public key (PEM), private key (IMMEDIATE), hash, expiration
     */
    private void handleGenerateKey(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        String label = request.getParameter("label");
        String emailTo = request.getParameter("email");
        boolean sendEmail = emailTo != null && !emailTo.trim().isEmpty();

        if (label == null || label.trim().isEmpty()) {
            label = "Default Key - " + System.currentTimeMillis();
        }
        // Generate RSA key pair locally and stream the private key back to client immediately
        try {
            java.security.KeyPair keyPair = RSAService.generateRSAKeyPair();

            // Convert keys to PEM
            String publicKeyPem = RSAService.publicKeyToPem(keyPair.getPublic());
            String privateKeyPem = RSAService.privateKeyToPem(keyPair.getPrivate());

            // Persist only the public key
            int keyId = keyManagementService.storePublicKey(currentUser.getId(), publicKeyPem, label);

            // Send confirmation email (no private key included)
            try {
                if (sendEmail) {
                    // Send private key via email if requested
                    KeyEmailService.sendPrivateKeyViaEmail(emailTo, privateKeyPem, currentUser.getFullName());
                } else {
                    // Send regular confirmation notice
                    KeyEmailService.sendKeyGenerationConfirmation(
                            currentUser.getEmail(),
                            currentUser.getFullName()
                    );
                }
            } catch (Exception e) {
                // Log but don't fail the request
                System.err.println("Failed to send key email: " + e.getMessage());
            }

            // Stream the private key as a downloadable PEM file in this response (one-time)
            String filename = FileExportService.generatePrivateKeyFilename(currentUser.getId());
            FileExportService.downloadFile(response, filename, privateKeyPem);

            // Best-effort clear sensitive references
            RSAService.clearKey(keyPair.getPrivate());
            RSAService.clearKey(privateKeyPem);

        } catch (Exception e) {
            // If streaming failed, return JSON error
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to generate and deliver key: " + e.getMessage());
        }
    }

    /**
     * GET /download-public-key
     * Download public key in PEM format
     * Query params: keyId (optional - defaults to most recent)
     */
    private void handleDownloadPublicKey(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        String keyIdParam = request.getParameter("keyId");
        UserKey userKey;

        if (keyIdParam != null && !keyIdParam.isEmpty()) {
            int keyId = Integer.parseInt(keyIdParam);
            userKey = keyManagementService.getMostRecentPublicKey(currentUser.getId());
            if (userKey == null || userKey.getId() != keyId) {
                sendError(response, HttpServletResponse.SC_FORBIDDEN, "Access denied to this key");
                return;
            }
        } else {
            userKey = keyManagementService.getMostRecentPublicKey(currentUser.getId());
        }

        if (userKey == null) {
            sendError(response, HttpServletResponse.SC_NOT_FOUND, "No public keys found for this user");
            return;
        }

        String filename = FileExportService.generatePublicKeyFilename(currentUser.getId());
        FileExportService.downloadFile(response, filename, userKey.getPublicKey());
    }

    /**
     * GET /download-private-key
     * Download private key in PEM format
     * SECURITY: Private key is only available immediately after generation (one-time)
     * This endpoint should only work if private key is stored in session
     * Query params: none
     */
    private void handleDownloadPrivateKey(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        // This endpoint is deprecated/disabled to avoid server-side storage of private keys.
        // Private keys are delivered immediately by POST /generate-key as a downloadable file.
        sendError(response, HttpServletResponse.SC_GONE,
                "Endpoint disabled: private keys are no longer stored on the server. Use POST /generate-key to generate and download your private key immediately.");
    }

    /**
     * POST /send-private-key
     * Send private key via email as attachment
     * SECURITY: Email is secure one-time delivery
     * Request params: sendEmail (true/false)
     */
    private void handleSendPrivateKey(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        // This endpoint was legacy and redirected to the new secure flow.
        // For backwards compatibility or direct calls, we could implement a limited version 
        // that informs the user to use the generation flow.
        sendError(response, HttpServletResponse.SC_METHOD_NOT_ALLOWED,
                "Directly sending keys from storage is not supported. Please use the Generate Key flow to email your key.");
    }

    /**
     * GET /list-keys
     * List all active keys for current user
     */
    private void handleListKeys(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        try {
            Map<String, Object> result = keyManagementService.getUserKeyStatus(currentUser.getId());
            sendSuccess(response, result);
        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to list keys: " + e.getMessage());
        }
    }

    /**
     * POST /revoke-key
     * Revoke a specific key
     * Request params: keyId
     */
    private void handleRevokeKey(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        String keyIdParam = request.getParameter("keyId");
        if (keyIdParam == null || keyIdParam.isEmpty()) {
            sendError(response, HttpServletResponse.SC_BAD_REQUEST, "Missing keyId parameter");
            return;
        }

        int keyId = Integer.parseInt(keyIdParam);

        // Verify key belongs to user
        UserKey userKey = keyManagementService.getMostRecentPublicKey(currentUser.getId());
        if (userKey == null || userKey.getId() != keyId) {
            sendError(response, HttpServletResponse.SC_FORBIDDEN, "Cannot access this key");
            return;
        }

        try {
            keyManagementService.revokeKey(keyId);

            // Send revocation notice
            try {
                KeyEmailService.sendKeyRevocationNotice(
                        currentUser.getEmail(),
                        currentUser.getFullName(),
                        "User initiated revocation"
                );
            } catch (Exception e) {
                System.err.println("Failed to send revocation notice: " + e.getMessage());
            }

            Map<String, Object> result = new HashMap<>();
            result.put("success", true);
            result.put("message", "Key revoked successfully");
            result.put("keyId", keyId);

            sendSuccess(response, result);

        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to revoke key: " + e.getMessage());
        }
    }

    /**
     * GET /key-status
     * Get current key management status for user
     */
    private void handleKeyStatus(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        try {
            Map<String, Object> status = keyManagementService.getUserKeyStatus(currentUser.getId());
            sendSuccess(response, status);
        } catch (Exception e) {
            sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to get status: " + e.getMessage());
        }
    }

    /**
     * Send JSON success response
     */
    private void sendSuccess(HttpServletResponse response, Object data) throws IOException {
        response.setContentType("application/json; charset=UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);

        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("data", data);

        PrintWriter out = response.getWriter();
        out.print(gson.toJson(result));
        out.flush();
    }

    /**
     * Send JSON error response
     */
    private void sendError(HttpServletResponse response, int status, String message) throws IOException {
        response.setContentType("application/json; charset=UTF-8");
        response.setStatus(status);

        Map<String, Object> error = new HashMap<>();
        error.put("success", false);
        error.put("error", message);
        error.put("status", status);

        PrintWriter out = response.getWriter();
        out.print(gson.toJson(error));
        out.flush();
    }
}

