package org.example.uzum_market.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

@WebServlet(name = "sendCodeServlet", value = "/send-code")
public class SendCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        HttpSession session = request.getSession();

        // Tasodifiy 6 xonali kod generatsiyasi
        String code = String.format("%06d", new Random().nextInt(999999));
        session.setAttribute("otpCode", code);
        session.setAttribute("email", email);

        // JavaMail bilan email yuborish
        String host = "smtp.gmail.com"; // Sizning email xizmatingiz
        String username = "your-email@gmail.com"; // Sizning email
        String password = "your-app-password"; // App password (agar 2FA ishlatilsa)

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        Session mailSession = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Uzum Market Kirish Kodi");
            message.setText("Sizning kirish kodingiz: " + code + "\nKod 5 daqiqa ichida amal qiladi.");

            Transport.send(message);
            response.sendRedirect(request.getContextPath() + "/index.jsp?step=code");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=email");
        }
    }
}