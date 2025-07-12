package org.example.uzum_market.server;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;

public class MailService {
    private final Map<String, String> verificationCode = new HashMap<>();
    String USERNAME = ResourceBundle.getBundle("emailinfo").getString("EMAIL");
    String PASSWORD = ResourceBundle.getBundle("emailinfo").getString("PASSWORD");

    public void sendVerificationCode(String recipientEmail) {
        String code = generateCode();
        verificationCode.put(recipientEmail, code);

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(recipientEmail)
            );
            message.setSubject("<h1 style=\"color: black; font-weight: revert-layer\">Your verification code: </h1>");
            message.setText("Your verification code is: " + code);

            Transport.send(message);

            System.out.println("Verification code sent to " + recipientEmail);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean verifyCode(String email, String code) {
        String correctCode = verificationCode.get(email);
        return correctCode != null && correctCode.equals(code);
    }

    private String generateCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }
}
