package org.example.uzum_market.servlet;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.uzum_market.config.JPAUtil;
import org.example.uzum_market.entity.Product;
import org.example.uzum_market.repository.ProductRepository;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "mainPageServlet", value = "/main")
public class MainPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            ProductRepository productRepository = new ProductRepository(em);

            em.getTransaction().begin();
            List<Product> allProducts = productRepository.findAll(0, Integer.MAX_VALUE);
            List<Product> recommendedProducts = productRepository.findRecommendedProducts();
            List<Product> discountedProducts = productRepository.findDiscountedProducts();
            em.getTransaction().commit();

            Map<String, List<Product>> productsByCategory = new LinkedHashMap<>();
            for (Product product : allProducts) {
                String category = product.getCategory() != null ? product.getCategory() : "Other";
                productsByCategory.computeIfAbsent(category, k -> new ArrayList<>()).add(product);
            }

            request.setAttribute("recommendedProducts", recommendedProducts);
            request.setAttribute("discountedProducts", discountedProducts);
            request.setAttribute("productsByCategory", productsByCategory);

            request.getRequestDispatcher("/main.jsp").forward(request, response);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            request.setAttribute("errorMessage", "Mahsulotlarni yuklashda xato: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }
}