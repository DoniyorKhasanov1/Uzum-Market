package org.example.uzum_market.servlet;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.uzum_market.entity.Cart;
import org.example.uzum_market.entity.Product;
import org.example.uzum_market.repository.CartRepository;
import org.example.uzum_market.repository.ProductRepository;

import java.io.IOException;

@WebServlet(name = "cartServlet", value = "/cart/add")
public class CartServlet extends HttpServlet {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("uzum_market");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Received POST request for /cart/add at " + new java.util.Date());
        EntityManager em = emf.createEntityManager(); // Fresh EntityManager per request
        try {
            ProductRepository productRepository = new ProductRepository(em);
            CartRepository cartRepository = new CartRepository(em);
            HttpSession session = request.getSession();

            // Temporary bypass of login check - using a default userId for testing
            Long userId = (Long) session.getAttribute("userId");
            if (userId == null) {
                userId = 1L; // Default user ID for testing
                System.out.println("No userId found, using default userId: " + userId);
            }

            String productId = request.getParameter("productId");
            if (productId == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is required");
                return;
            }

            // Begin transaction
            em.getTransaction().begin();

            Product product = productRepository.findById(Long.parseLong(productId));
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                em.getTransaction().rollback();
                return;
            }

            // Check if the item already exists in the cart for this user
            Cart existingCartItem = cartRepository.findByUserIdAndProductId(userId, product.getId());
            if (existingCartItem != null) {
                existingCartItem.setQuantity(existingCartItem.getQuantity() + 1);
                em.merge(existingCartItem); // Update existing entity
            } else {
                Cart cartItem = Cart.builder()
                        .userId(userId)
                        .productId(product.getId())
                        .quantity(1)
                        .build();
                em.persist(cartItem); // Persist new cart item
            }

            // Commit transaction
            em.getTransaction().commit();

            response.sendRedirect("/cart"); // Redirect to CartPageServlet
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding to cart: " + e.getMessage());
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    @Override
    public void destroy() {
        if (emf.isOpen()) {
            emf.close(); // Close EntityManagerFactory when servlet is destroyed
        }
    }
}