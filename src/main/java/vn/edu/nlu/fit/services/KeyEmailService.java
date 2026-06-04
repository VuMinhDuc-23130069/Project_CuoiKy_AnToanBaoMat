package vn.edu.nlu.fit.services;

import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

/**
 * Email Service for sending RSA keys and important notifications
 * Supports sending private keys as secure email attachments
 * Uses Jakarta Mail API
 */
public class KeyEmailService {

    // Email configuration
    private static final String SENDER_EMAIL = "tuan07072005@gmail.com";
    private static final String SENDER_PASSWORD = "cdppqifoctcuahml";
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";

    /**
     * Send private key to user via email as attachment
     * SECURITY: This is a ONE-TIME delivery mechanism
     * The private key is NOT stored on the server after this
     * @param userEmail Recipient email address
     * @param privateKeyPem Private key in PEM format
     * @param username Username of the recipient
     * @throws MessagingException if email sending fails
     */
    public static void sendPrivateKeyViaEmail(String userEmail, String privateKeyPem,
                                               String username) throws MessagingException {
        try {
            Session session = createMailSession();

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject("Your RSA Private Key - Secure Delivery");

            // Create multipart message for text + attachment
            MimeMultipart multipart = new MimeMultipart();

            // Text part with instructions
            MimeBodyPart textPart = new MimeBodyPart();
            String emailBody = createPrivateKeyEmailBody(username);
            textPart.setText(emailBody, StandardCharsets.UTF_8.name(), "plain");

            // Attachment part - private key file
            MimeBodyPart attachmentPart = new MimeBodyPart();
            String filename = FileExportService.generatePrivateKeyFilename(hashEmail(userEmail));
            attachmentPart.setDataHandler(
                    new DataHandler(new ByteArrayDataSource(
                            privateKeyPem.getBytes(StandardCharsets.UTF_8),
                            "application/octet-stream",
                            filename))
            );
            attachmentPart.setFileName(filename);

            multipart.addBodyPart(textPart);
            multipart.addBodyPart(attachmentPart);

            message.setContent(multipart);
            Transport.send(message);

        } catch (MessagingException e) {
            throw new MessagingException("Failed to send private key email: " + e.getMessage(), e);
        } finally {
            // Try to clear sensitive data
            RSAService.clearKey(privateKeyPem);
        }
    }

    /**
     * Send key generation confirmation email
     * @param userEmail Recipient email address
     * @param username Username
     * @throws MessagingException if email sending fails
     */
    public static void sendKeyGenerationConfirmation(String userEmail, String username)
                                                      throws MessagingException {
        try {
            Session session = createMailSession();

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject("RSA Key Generated Successfully - Action Required");

            String body = "Xin chào " + username + ",\n\n" +
                    "Your RSA-2048 key pair has been generated successfully!\n\n" +
                    "IMPORTANT INFORMATION:\n" +
                    "- Your private key has been created and is ready for download\n" +
                    "- Private key is NOT stored on our servers for security reasons\n" +
                    "- You have ONE opportunity to download it\n" +
                    "- After you leave this page, the private key will not be available\n\n" +
                    "NEXT STEPS:\n" +
                    "1. Download your private key immediately and store it securely\n" +
                    "2. Download your public key for distribution if needed\n" +
                    "3. Back up your private key in a secure location\n" +
                    "4. Consider using a password manager to store sensitive information\n\n" +
                    "For questions, please contact our support team.\n\n" +
                    "Best regards,\n" +
                    "Security Team";

            message.setText(body);
            Transport.send(message);

        } catch (MessagingException e) {
            throw new MessagingException("Failed to send key generation confirmation: " + e.getMessage(), e);
        }
    }

    /**
     * Send key revocation notification
     * @param userEmail Recipient email address
     * @param username Username
     * @param reason Reason for revocation
     * @throws MessagingException if email sending fails
     */
    public static void sendKeyRevocationNotice(String userEmail, String username,
                                               String reason) throws MessagingException {
        try {
            Session session = createMailSession();

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject("RSA Key Revoked - Please Generate New Key");

            String body = "Xin chào " + username + ",\n\n" +
                    "Your RSA public key has been revoked from our system.\n\n" +
                    "Reason: " + reason + "\n\n" +
                    "Please generate a new key pair to continue using encryption services.\n" +
                    "Visit your account settings to generate a new key.\n\n" +
                    "If you did not request this change, please contact our support team immediately.\n\n" +
                    "Best regards,\n" +
                    "Security Team";

            message.setText(body);
            Transport.send(message);

        } catch (MessagingException e) {
            throw new MessagingException("Failed to send revocation notice: " + e.getMessage(), e);
        }
    }

    /**
     * Create Mail Session with SMTP configuration
     * @return Configured Session
     */
    private static Session createMailSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.connectiontimeout", "5000");
        props.put("mail.smtp.timeout", "5000");

        return Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });
    }

    /**
     * Create email body for private key delivery
     * @param username User's username
     * @return Email body text
     */
    private static String createPrivateKeyEmailBody(String username) {
        return "Xin chào " + username + ",\n\n" +
               "SECURITY ALERT: Private Key Attached\n" +
               "====================================\n\n" +
               "Your RSA-2048 private key is attached to this email.\n\n" +
               "⚠️ CRITICAL SECURITY INSTRUCTIONS ⚠️\n" +
               "1. Save this email in a SECURE location immediately\n" +
               "2. Do NOT forward this email to anyone\n" +
               "3. Consider encrypting this email with a password\n" +
               "4. Delete this email permanently from trash after backing up the key\n" +
               "5. Never share the private key with anyone\n\n" +
               "USE CASES:\n" +
               "- Decrypt messages encrypted with your public key\n" +
               "- Digital signatures and authentication\n" +
               "- Secure key management\n\n" +
               "EXPIRATION:\n" +
               "This is a one-time delivery. The private key is NOT stored on our servers.\n\n" +
               "If you have questions or concerns, contact support immediately.\n\n" +
               "Best regards,\n" +
               "Security Team\n" +
               "Do not reply to this email.";
    }

    /**
     * Hash email address for filename generation
     * @param email Email address
     * @return Hash code
     */
    private static int hashEmail(String email) {
        return Math.abs(email.hashCode());
    }

    /**
     * Inner class for handling byte array as data source for email attachments
     */
    public static class ByteArrayDataSource implements DataSource {
        private final byte[] data;
        private final String type;
        private final String name;

        public ByteArrayDataSource(byte[] data, String type, String name) {
            this.data = data;
            this.type = type;
            this.name = name;
        }

        @Override
        public InputStream getInputStream() {
            return new ByteArrayInputStream(data);
        }

        @Override
        public OutputStream getOutputStream() {
            throw new UnsupportedOperationException("Not supported");
        }

        @Override
        public String getContentType() {
            return type;
        }

        @Override
        public String getName() {
            return name;
        }
    }
}



