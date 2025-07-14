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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "cartPageServlet", value = "/cart")
public class CartPageServlet extends HttpServlet {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("uzum_market");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Loading cart page at " + new java.util.Date());
        EntityManager em = emf.createEntityManager();
        try {
            CartRepository cartRepository = new CartRepository(em);
            ProductRepository productRepository = new ProductRepository(em);
            HttpSession session = request.getSession();

            // Temporary bypass of login check - using default userId
            Long userId = (Long) session.getAttribute("userId");
            if (userId == null) {
                userId = 1L; // Default user ID for testing
                System.out.println("No userId found, using default userId: " + userId);
            }

            // Fetch cart items for the user
            List<Cart> cartItems = cartRepository.findByUserId(userId);

            // Fetch associated products and create a map
            Map<Long, Product> productMap = new HashMap<>();
            for (Cart cartItem : cartItems) {
                Product product = productRepository.findById(cartItem.getProductId());
                if (product != null) {
                    productMap.put(cartItem.getProductId(), product);
                }
            }

            request.setAttribute("cartItems", cartItems);
            session.setAttribute("productMap", productMap); // Store for JSP access

            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading cart: " + e.getMessage());
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