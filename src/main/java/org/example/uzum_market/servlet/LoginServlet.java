package org.example.uzum_market.servlet;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.uzum_market.config.JPAUtil;
import org.example.uzum_market.entity.UserEntity;
import org.example.uzum_market.server.MailService;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    EntityManager emf = JPAUtil.getEntityManager();
    private final MailService service = new MailService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullname");// Get email parameter
        String password = req.getParameter("password"); //
        // Get password parameter
        service.sendVerificationCode(email);
        emf.getTransaction().begin();
        UserEntity user = UserEntity.builder()
                .fullName(fullName)
                .email(email)
                .password(password)
                .build();
        emf.persist(user);
        System.out.println("User has successfully registered: " + user.getFullName() + " (" + user.getEmail() + ")");
        emf.getTransaction().commit();
        resp.sendRedirect("/main");


    }
}
