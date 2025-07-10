package org.example.uzum_market.servlet;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.uzum_market.config.JPAUtil;
import org.example.uzum_market.entity.Cart;
import org.example.uzum_market.entity.Product;
import org.example.uzum_market.repository.CartRepository;
import org.example.uzum_market.repository.ProductRepository;

import java.io.IOException;

@WebServlet(name = "cartServlet", value = "/cart/add")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            ProductRepository productRepository = new ProductRepository(em);
            CartRepository cartRepository = new CartRepository(em);
            HttpSession session = request.getSession();
            Long userId = (Long) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("/login");
                return;
            }

            String productId = request.getParameter("productId");
            if (productId == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is required");
                return;
            }

            em.getTransaction().begin();
            Product product = productRepository.findById(Long.parseLong(productId));
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                em.getTransaction().rollback();
                return;
            }

            Cart cartItem = Cart.builder()
                    .userId(userId)
                    .productId(product.getId())
                    .quantity(1)
                    .build();
            cartRepository.save(cartItem);
            em.getTransaction().commit();

            response.sendRedirect("/main");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding to cart: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}