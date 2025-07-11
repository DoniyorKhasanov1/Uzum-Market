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

            // Test mahsulotlari
            Product product1 = Product.builder()
                    .name("MacBook Pro M4 14 inch (variant)")
                    .imageUrl("https://example.com/macbook_pro_m4.jpg")
                    .price(7000000)
                    .oldPrice(0)
                    .rating(4.7)
                    .reviewCount(150)
                    .creditPricePerMonth(583333)
                    .hasCredit(true)
                    .isSuperPrice(false)
                    .isRecommended(true)
                    .category("Elektronika")
                    .build();

            Product product2 = Product.builder()
                    .name("iPhone 16 e")
                    .imageUrl("https://example.com/iphone_16e.jpg")
                    .price(10000000)
                    .oldPrice(11000000)
                    .rating(4.8)
                    .reviewCount(200)
                    .creditPricePerMonth(833333)
                    .hasCredit(true)
                    .isSuperPrice(true)
                    .isRecommended(false)
                    .category("Elektronika")
                    .build();

            Product product3 = Product.builder()
                    .name("MacBook Pro M4 14 inch")
                    .imageUrl("https://example.com/macbook_pro_m4_14.jpg")
                    .price(21069000)
                    .oldPrice(0)
                    .rating(4.9)
                    .reviewCount(180)
                    .creditPricePerMonth(1755750)
                    .hasCredit(true)
                    .isSuperPrice(false)
                    .isRecommended(true)
                    .category("Elektronika")
                    .build();

            Product product4 = Product.builder()
                    .name("iPhone 16")
                    .imageUrl("https://example.com/iphone_16.jpg")
                    .price(12000000)
                    .oldPrice(13000000)
                    .rating(4.6)
                    .reviewCount(220)
                    .creditPricePerMonth(1000000)
                    .hasCredit(true)
                    .isSuperPrice(true)
                    .isRecommended(false)
                    .category("Elektronika")
                    .build();

            Product product5 = Product.builder()
                    .name("Apple Watch Series 10")
                    .imageUrl("https://example.com/apple_watch_10.jpg")
                    .price(5000000)
                    .oldPrice(5500000)
                    .rating(4.5)
                    .reviewCount(130)
                    .creditPricePerMonth(416666)
                    .hasCredit(true)
                    .isSuperPrice(false)
                    .isRecommended(true)
                    .category("Aksessuarlar")
                    .build();

            // Mahsulotlarni saqlash
            productRepository.save(product1);
            productRepository.save(product2);
            productRepository.save(product3);
            productRepository.save(product4);
            productRepository.save(product5);

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