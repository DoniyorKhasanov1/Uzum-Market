package org.example.uzum_market.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;
import org.example.uzum_market.server.MailService;

import java.io.IOException;
import java.util.Random;

@WebServlet("/sendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    private final MailService service = new MailService();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        service.sendVerificationCode(email);
    }
}

@Getter
class LoginData {
    @Setter
    private String name;
    private String email;

}
