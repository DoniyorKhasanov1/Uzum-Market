package org.example.uzum_market.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.uzum_market.entity.Product;

import java.util.Collections;
import java.util.List;

public class ProductRepository {
    private EntityManager entityManager;

    public ProductRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Product> findAll() {
        try {
            return entityManager.createQuery("SELECT p FROM Product p", Product.class)
                    .getResultList();
        } catch (Exception e) {
            System.err.println("Error in findAll(): " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public List<Product> findRecommendedProducts() {
        try {
            return entityManager.createQuery(
                            "SELECT p FROM Product p WHERE p.isRecommended = true ORDER BY p.rating DESC",
                            Product.class)
                    .setMaxResults(8)
                    .getResultList();
        } catch (Exception e) {
            System.err.println("Error in findRecommendedProducts(): " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public List<Product> findDiscountedProducts() {
        try {
            return entityManager.createQuery(
                            "SELECT p FROM Product p WHERE p.oldPrice > 0 AND p.price < p.oldPrice " +
                            "ORDER BY (p.oldPrice - p.price) DESC",
                            Product.class)
                    .setMaxResults(8)
                    .getResultList();
        } catch (Exception e) {
            System.err.println("Error in findDiscountedProducts(): " + e.getMessage());
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
            throw new RuntimeException("Error saving product: " + e.getMessage(), e);
        }
    }
}