package org.example.uzum_market.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.uzum_market.entity.Product;

import java.util.Collections;
import java.util.List;

public class ProductRepository {
    private final EntityManager entityManager;

    public ProductRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Product> findAll() {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p ORDER BY p.id DESC", Product.class);
            return query.getResultList();
        } catch (Exception e) {
            System.err.println("Xatolik findAll(): " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public List<Product> findRecommendedProducts() {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p WHERE p.isRecommended = true ORDER BY p.rating DESC",
                    Product.class);
            return query.getResultList();
        } catch (Exception e) {
            System.err.println("Xatolik findRecommendedProducts(): " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public List<Product> findDiscountedProducts() {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p WHERE p.oldPrice IS NOT NULL AND p.price < p.oldPrice " +
                    "ORDER BY (p.oldPrice - p.price) DESC",
                    Product.class);
            return query.getResultList();
        } catch (Exception e) {
            System.err.println("Xatolik findDiscountedProducts(): " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public void save(Product product) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(product);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw new RuntimeException("Saqlashda xatolik: " + e.getMessage(), e);
        }
    }
}
