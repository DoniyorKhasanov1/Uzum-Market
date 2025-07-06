package org.example.uzum_market.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import org.example.uzum_market.config.JPAUtil;
import org.example.uzum_market.entity.Product;
import org.example.uzum_market.repository.ProductRepository;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "mainPageServlet", value = "/main")
public class MainPageServlet extends HttpServlet {

    private ProductRepository productRepository;

    @Override
    public void init() throws ServletException {
        super.init();
        productRepository = new ProductRepository();

        EntityManager em = null;
        try {
            em = JPAUtil.getEntityManager();
            productRepository.setEntityManager(em);

            if (productRepository.findAll().isEmpty()) {
                System.out.println("Database bo'sh. Test ma'lumotlari qo'shilmoqda...");

                // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                // HAR BIR MAHSULOT UCHUN TO'G'RI RASM URL'LARINI VA O'ZBEKCHA NOMULARNI KIRITDIM
                // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

                Product p1 = Product.builder()
                        .name("Smartfon Samsung Galaxy A54 5G 8/128GB Qora")
                        .imageUrl("https://images.uzum.uz/cnq30j0jvf2g0311f440/original.jpg") // Realistik smartfon rasmi
                        .price(3500000)
                        .oldPrice(4000000)
                        .rating(4.7)
                        .reviewCount(125)
                        .creditPricePerMonth(350000)
                        .hasCredit(true)
                        .isSuperPrice(false)
                        .build();

                Product p2 = Product.builder()
                        .name("Noutbuk HP Pavilion 15-eg0000 P/N: 472L7EA")
                        .imageUrl("https://images.uzum.uz/cn3f7l125sglf04h2m5g/original.jpg") // Realistik noutbuk rasmi
                        .price(7800000)
                        .oldPrice(8500000)
                        .rating(4.5)
                        .reviewCount(80)
                        .creditPricePerMonth(780000)
                        .hasCredit(true)
                        .isSuperPrice(true)
                        .build();

                Product p3 = Product.builder()
                        .name("Simsiz quloqchinlar Xiaomi Redmi Buds 3 Lite Oq")
                        .imageUrl("https://images.uzum.uz/cgoj09v0jvf2g0313f80g/original.jpg") // Realistik quloqchin rasmi
                        .price(250000)
                        .oldPrice(0)
                        .rating(4.8)
                        .reviewCount(300)
                        .creditPricePerMonth(0)
                        .hasCredit(false)
                        .isSuperPrice(false)
                        .build();

                Product p4 = Product.builder()
                        .name("Kir yuvish mashinasi Beko WRE 6511 BWW")
                        .imageUrl("https://images.uzum.uz/cpv9gqnhgiov1qig2c9g/original.jpg") // Realistik kir yuvish mashinasi rasmi
                        .price(4200000)
                        .oldPrice(4500000)
                        .rating(4.6)
                        .reviewCount(60)
                        .creditPricePerMonth(420000)
                        .hasCredit(true)
                        .isSuperPrice(false)
                        .build();

                Product p5 = Product.builder()
                        .name("Bolalar velosipedi Stels Pilot 210")
                        .imageUrl("https://images.uzum.uz/cgsm823hgiov1qigdt8g/original.jpg") // Realistik velosiped rasmi
                        .price(1200000)
                        .oldPrice(1500000)
                        .rating(4.0)
                        .reviewCount(30)
                        .creditPricePerMonth(0)
                        .hasCredit(false)
                        .isSuperPrice(true)
                        .build();

                Product p6 = Product.builder()
                        .name("Muzlatgich Indesit ITS 4200 W")
                        .imageUrl("https://images.uzum.uz/cgqu8r0jvf2g0313q4hg/original.jpg") // Realistik muzlatgich rasmi
                        .price(6174050)
                        .oldPrice(6399000)
                        .rating(5.0)
                        .reviewCount(3)
                        .creditPricePerMonth(460345)
                        .hasCredit(true)
                        .isSuperPrice(false)
                        .build();

                Product p7 = Product.builder()
                        .name("Avtomobil uchun tonirovka 70%")
                        .imageUrl("https://images.uzum.uz/cgp792nhgiov1qigb400/original.jpg") // Realistik tonirovka rasmi
                        .price(97000)
                        .oldPrice(200000)
                        .rating(3.8)
                        .reviewCount(63)
                        .creditPricePerMonth(7083)
                        .hasCredit(true)
                        .isSuperPrice(false)
                        .build();

                Product p8 = Product.builder()
                        .name("Muzlatgich Raixon RHWG RD33")
                        .imageUrl("https://images.uzum.uz/cg9a8kfhj8j9g69a2ro0/original.jpg") // Realistik muzlatgich rasmi
                        .price(4647675)
                        .oldPrice(0) // Chegirmasiz
                        .rating(4.9)
                        .reviewCount(15)
                        .creditPricePerMonth(346552)
                        .hasCredit(true)
                        .isSuperPrice(false)
                        .build();

                // Ma'lumotlarni saqlash
                em.getTransaction().begin();
                em.persist(p1);
                em.persist(p2);
                em.persist(p3);
                em.persist(p4);
                em.persist(p5);
                em.persist(p6);
                em.persist(p7);
                em.persist(p8);
                em.getTransaction().commit();

                System.out.println("Test mahsulotlari database'ga muvaffaqiyatli qo'shildi!");
            } else {
                System.out.println("Database'da mahsulotlar mavjud. Test ma'lumotlari qo'shilmadi.");
            }
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("TEST MA'LUMOTLARINI QO'SHISHDA XATO YUZ BERDI: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager entityManager = null;
        List<Product> recommendedProducts = Collections.emptyList();
        List<Product> discountedProducts = Collections.emptyList();
        String errorMessage = null;

        try {
            entityManager = JPAUtil.getEntityManager();
            productRepository.setEntityManager(entityManager);

            // Tavsiya etilgan mahsulotlar (barcha mahsulotlarni olib, keyin filtrlash yoki alohida so'rov yozish mumkin)
            // Hozircha barcha mahsulotlarni recommendedProducts sifatida olyapmiz
            recommendedProducts = productRepository.findAll();

            // Chegirmali mahsulotlarni olish uchun alohida metod chaqirish kerak
            // Agar ProductRepository'da findDiscountedProducts() metodi bo'lsa, uni chaqiring
            discountedProducts = productRepository.findDiscountedProducts(); // Bu metodni ProductRepository'da yaratishingiz kerak!

            if (recommendedProducts.isEmpty() && discountedProducts.isEmpty()) {
                errorMessage = "Database'da mahsulotlar topilmadi. Iltimos, server loglarini tekshiring.";
            }

        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "Mahsulotlarni yuklashda kutilmagan xatolik yuz berdi: " + e.getMessage();
        } finally {
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }

        request.setAttribute("recommendedProducts", recommendedProducts);
        request.setAttribute("discountedProducts", discountedProducts);
        request.setAttribute("errorMessage", errorMessage);

        request.getRequestDispatcher("main.jsp").forward(request, response);
    }
}