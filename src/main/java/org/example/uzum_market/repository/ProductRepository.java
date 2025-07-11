package org.example.uzum_market.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import org.example.uzum_market.entity.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;

public class ProductRepository {
    private static final Logger logger = LoggerFactory.getLogger(ProductRepository.class);
    private final EntityManager entityManager;

    public ProductRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Product> findAll(int page, int size) {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p ORDER BY p.id DESC", Product.class);
            query.setFirstResult(page * size);
            query.setMaxResults(size);
            return query.getResultList();
        } catch (Exception e) {
            logger.error("Xatolik findAll metodida (page: {}, size: {}): {}", page, size, e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public List<Product> findAllWithoutPagination() {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p ORDER BY p.id DESC", Product.class);
            return query.getResultList();
        } catch (Exception e) {
            logger.error("Xatolik findAllWithoutPagination metodida: {}", e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public Product findById(Long id) {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p WHERE p.id = :id", Product.class);
            query.setParameter("id", id);
            return query.getSingleResult();
        } catch (NoResultException e) {
            logger.warn("Mahsulot topilmadi, id: {}", id);
            return null;
        } catch (Exception e) {
            logger.error("Xatolik findById metodida (id: {}): {}", id, e.getMessage(), e);
            throw e;
        }
    }

    public List<Product> findRecommendedProducts() {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p WHERE p.isRecommended = true ORDER BY p.rating DESC",
                    Product.class);
            return query.getResultList();
        } catch (Exception e) {
            logger.error("Xatolik findRecommendedProducts metodida: {}", e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public List<Product> findDiscountedProducts() {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p WHERE p.oldPrice IS NOT NULL AND p.price < p.oldPrice ORDER BY p.id DESC",
                    Product.class);
            return query.getResultList();
        } catch (Exception e) {
            logger.error("Xatolik findDiscountedProducts metodida: {}", e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public List<Product> findByCategory(String category) {
        try {
            TypedQuery<Product> query = entityManager.createQuery(
                    "SELECT p FROM Product p WHERE LOWER(p.category) = LOWER(:category) ORDER BY p.id DESC",
                    Product.class);
            query.setParameter("category", category);
            return query.getResultList();
        } catch (Exception e) {
            logger.error("Xatolik findByCategory metodida (category: {}): {}", category, e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public List<String> findDistinctCategories() {
        try {
            TypedQuery<String> query = entityManager.createQuery(
                    "SELECT DISTINCT p.category FROM Product p WHERE p.category IS NOT NULL", String.class);
            return query.getResultList();
        } catch (Exception e) {
            logger.error("Xatolik findDistinctCategories metodida: {}", e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public List<Product> searchProducts(String query) {
        try {
            TypedQuery<Product> queryObj = entityManager.createQuery(
                    "SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(:query) OR LOWER(p.category) LIKE LOWER(:query) ORDER BY p.id DESC",
                    Product.class);
            queryObj.setParameter("query", "%" + query + "%");
            return queryObj.getResultList();
        } catch (Exception e) {
            logger.error("Xatolik searchProducts metodida (query: {}): {}", query, e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public void save(Product product) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(product);
            entityManager.getTransaction().commit();
            logger.info("Mahsulot saqlandi: {}", product.getName());
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            logger.error("Mahsulotni saqlashda xatolik: {}", e.getMessage(), e);
            throw new RuntimeException("Saqlashda xatolik: " + e.getMessage(), e);
        }
    }

    public void update(Product product) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(product);
            entityManager.getTransaction().commit();
            logger.info("Mahsulot yangilandi: {}", product.getName());
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            logger.error("Mahsulotni yangilashda xatolik: {}", e.getMessage(), e);
            throw new RuntimeException("Yangilashda xatolik: " + e.getMessage(), e);
        }
    }
}