package org.example.uzum_market.servlet;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "cartRemoveServlet", value = "/cart/remove")
public class CartRemoveServlet extends HttpServlet {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("uzum_market");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Received POST request for /cart/remove at " + new java.util.Date());
        EntityManager em = emf.createEntityManager();
        try {
            // Get cartId from the form
            String cartIdStr = request.getParameter("cartId");
            if (cartIdStr == null || cartIdStr.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cart ID is required");
                return;
            }

            Long cartId = Long.parseLong(cartIdStr);

            // Begin transaction
            em.getTransaction().begin();

            // Find and remove the cart item
            org.example.uzum_market.entity.Cart cartItem = em.find(org.example.uzum_market.entity.Cart.class, cartId);
            if (cartItem != null) {
                em.remove(cartItem);
                em.getTransaction().commit();
                System.out.println("Cart item with ID " + cartId + " removed successfully");
            } else {
                em.getTransaction().rollback();
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Cart item not found");
                return;
            }

            // Redirect back to the cart page
            response.sendRedirect("/cart");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error removing cart item: " + e.getMessage());
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    @Override
    public void destroy() {
        if (emf.isOpen()) {
            emf.close();
        }
    }
}