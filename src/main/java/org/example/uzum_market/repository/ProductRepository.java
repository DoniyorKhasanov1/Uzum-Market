package org.example.uzum_market.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.uzum_market.entity.Product;

import java.util.List;

public class ProductRepository {

    private EntityManager entityManager;

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Product> findAll() {
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is not set for ProductRepository.");
        }
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p", Product.class);
        return query.getResultList();
    }

    public List<Product> findRecommendedProducts() {
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is not set for ProductRepository.");
        }
        // Eng yangi yoki eng yuqori reytingli mahsulotlarni tavsiya etish
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p ORDER BY p.id DESC", Product.class);
        query.setMaxResults(8); // Misol uchun, 8 ta tavsiya etilgan mahsulot
        return query.getResultList();
    }

    public List<Product> findDiscountedProducts() {
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is not set for ProductRepository.");
        }
        // Chegirmali mahsulotlar (oldPrice mavjud va price < oldPrice)
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p WHERE p.oldPrice IS NOT NULL AND p.price < p.oldPrice ORDER BY p.id DESC", Product.class);
        query.setMaxResults(8); // Misol uchun, 8 ta chegirmali mahsulot
        return query.getResultList();
    }

    // Saqlash metodi (MainPageServlet.init() da ishlatish uchun)
    public void save(Product product) {
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is not set for ProductRepository.");
        }
        // Tranzaktsiya bu yerda boshlanmaydi va tugamaydi, chunki u init() metodida boshqariladi.
        // Agar alohida chaqirilsa, tranzaktsiya boshqaruvini qo'shish kerak.
        entityManager.persist(product);
    }
}