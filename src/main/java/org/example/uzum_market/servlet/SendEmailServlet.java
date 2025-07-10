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

import java.io.IOException;
import java.util.Random;

@WebServlet("/sendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        StringBuilder sb = new StringBuilder();
        String line;
        try (var reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        Gson gson = new Gson();
        LoginData data = gson.fromJson(sb.toString(), LoginData.class);

        String name = data.getName();
        String email = data.getEmail();
        HttpSession session = request.getSession();
        session.setAttribute("name", name);

        boolean emailSent = sendEmail(email);

    }

    private boolean sendEmail(String email) {


        System.out.println("Email verification code was sent: " + email);
        return true;
    }
}
@Getter
class LoginData {
    @Setter
    private String name;
    private String email;

}
