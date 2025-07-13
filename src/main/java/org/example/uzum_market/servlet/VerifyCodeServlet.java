package org.example.uzum_market.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Serial;

@WebServlet("/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String storedCode = (String) session.getAttribute("otpCode");
        String email = (String) session.getAttribute("email");

        String inputCode = request.getParameter("code1") + request.getParameter("code2") +
                request.getParameter("code3") + request.getParameter("code4") +
                request.getParameter("code5") + request.getParameter("code6");

        if (storedCode != null && storedCode.equals(inputCode)) {
            session.removeAttribute("otpCode");
            response.sendRedirect(request.getContextPath() + "/main.jsp?success=login");
        } else {
            response.sendRedirect(request.getContextPath() + "/main.jsp?error=code");
        }
    }
}