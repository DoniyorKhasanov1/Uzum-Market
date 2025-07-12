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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "mainPageServlet", value = "/main")
public class MainPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            ProductRepository productRepository = new ProductRepository(em);

            int page = 0;
            int size = 10;
            try {
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    page = Integer.parseInt(pageParam);
                }
            } catch (NumberFormatException e) {
                page = 0;
            }

            String category = request.getParameter("category");

            // Barcha mahsulotlarni yuklash (paginatsiyasiz)
            List<Product> allProducts = productRepository.findAllWithoutPagination();
            List<Product> recommendedProducts = productRepository.findRecommendedProducts();
            List<Product> discountedProducts = productRepository.findDiscountedProducts();
            List<String> uniqueCategories = productRepository.findDistinctCategories();

            // Har bir kategoriya uchun mahsulotlarni xaritaga joylash
            Map<String, List<Product>> categoryProductsMap = new HashMap<>();
            for (String cat : uniqueCategories) {
                categoryProductsMap.put(cat, productRepository.findByCategory(cat));
            }

            // Tanlangan kategoriya uchun paginatsiyali mahsulotlar
            List<Product> products;
            if (category != null && !category.isEmpty() && !category.equals("all")) {
                products = productRepository.findByCategory(category);
            } else {
                products = productRepository.findAll(page, size);
            }

            request.setAttribute("allProducts", allProducts);
            request.setAttribute("recommendedProducts", recommendedProducts);
            request.setAttribute("discountedProducts", discountedProducts);
            request.setAttribute("categoryProductsMap", categoryProductsMap);
            request.setAttribute("uniqueCategories", uniqueCategories);
            request.setAttribute("currentPage", page);
            request.setAttribute("selectedCategory", category != null ? category : "all");

            request.getRequestDispatcher("/main.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Mahsulotlarni yuklashda xato: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }
}