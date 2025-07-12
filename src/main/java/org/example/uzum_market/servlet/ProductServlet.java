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
import java.util.List;

@WebServlet(name = "productServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            ProductRepository productRepository = new ProductRepository(em);
            String category = request.getParameter("category");
            List<Product> categoryProducts;

            em.getTransaction().begin();
            if (category == null || category.isEmpty() || category.equals("all")) {
                categoryProducts = productRepository.findAll(0, 10); // Default to first page, 10 items
            } else {
                categoryProducts = productRepository.findByCategory(category);
            }
            em.getTransaction().commit();

            request.setAttribute("categoryProducts", categoryProducts);
            request.setAttribute("selectedCategory", category != null ? category : "all");
            request.setAttribute("uniqueCategories", productRepository.findDistinctCategories());

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