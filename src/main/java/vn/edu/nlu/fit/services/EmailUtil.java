package vn.edu.nlu.fit.services;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;
public class EmailUtil {
    private static final String email = "tuan07072005@gmail.com";
    private static final String add_password = "cdppqifoctcuahml";

    public static void sendResetEmail(String to, String resetLink) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(email, add_password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Quên mật khẩu tài khoản trang web Ngũ Cốc Ngon");

            message.setText(
                    "Xin Chào, Bạn vui lòng nhấn vào link sau để đặt lại mật khẩu:\n" + resetLink
            );

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    private static void sendMail(String to, String subject, String content) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(email, add_password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(content);

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendVerifyEmail(String to, String link) {
        sendMail(
                to,
                "Xác thực tài khoản Ngũ Cốc Ngon",
                "Vui lòng nhấn link sau để xác thực tài khoản:\n" + link
        );
    }


}
