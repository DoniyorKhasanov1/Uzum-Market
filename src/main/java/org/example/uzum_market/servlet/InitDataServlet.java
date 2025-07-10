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

@WebServlet(name = "initDataServlet", value = "/init-data")
public class InitDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        ProductRepository productRepository = new ProductRepository(em);
        response.setContentType("text/plain; charset=UTF-8");

        try {
            em.getTransaction().begin();

            // Test mahsulotlarini qo‘shish
            Product product1 = Product.builder()
                    .name("Smartfon Samsung Galaxy")
                    .imageUrl("https://images.uzum.uz/product-1.jpg")
                    .price(3000000)
                    .oldPrice(3500000)
                    .rating(4.5)
                    .reviewCount(120)
                    .creditPricePerMonth(250000)
                    .hasCredit(true)
                    .isSuperPrice(true)
                    .isRecommended(true)
                    .build();

            Product product2 = Product.builder()
                    .name("Noutbuk Lenovo IdeaPad")
                    .imageUrl("https://images.uzum.uz/product-2.jpg")
                    .price(5000000)
                    .oldPrice(0)
                    .rating(4.0)
                    .reviewCount(85)
                    .creditPricePerMonth(416666)
                    .hasCredit(true)
                    .isSuperPrice(false)
                    .isRecommended(true)
                    .build();

            Product product3 = Product.builder()
                    .name("Televizor LG 4K")
                    .imageUrl("https://images.uzum.uz/product-3.jpg")
                    .price(7000000)
                    .oldPrice(8000000)
                    .rating(4.8)
                    .reviewCount(200)
                    .creditPricePerMonth(583333)
                    .hasCredit(true)
                    .isSuperPrice(true)
                    .isRecommended(false)
                    .build();

            // Mahsulotlarni saqlash
            productRepository.save(product1);
            productRepository.save(product2);
            productRepository.save(product3);

            em.getTransaction().commit();
            response.getWriter().write("Test ma'lumotlari muvaffaqiyatli qo'shildi!");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Xato yuz berdi: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}