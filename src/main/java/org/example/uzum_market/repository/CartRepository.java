package org.example.uzum_market.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import org.example.uzum_market.entity.Cart;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;

public class CartRepository {
    private static final Logger logger = LoggerFactory.getLogger(CartRepository.class);
    private final EntityManager entityManager;

    public CartRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void save(Cart cart) {
        try {
            entityManager.getTransaction().begin();
            Cart existingCart = findByUserIdAndProductId(cart.getUserId(), cart.getProductId());
            if (existingCart != null) {
                existingCart.setQuantity(existingCart.getQuantity() + cart.getQuantity());
                entityManager.merge(existingCart);
            } else {
                entityManager.persist(cart);
            }
            entityManager.getTransaction().commit();
            logger.info("Cart item saved for user: {}, product: {}", cart.getUserId(), cart.getProductId());
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            logger.error("Error saving cart item: {}", e.getMessage(), e);
            throw new RuntimeException("Failed to save cart item: " + e.getMessage(), e);
        }
    }

    public void update(Cart cart) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(cart);
            entityManager.getTransaction().commit();
            logger.info("Cart item updated for user: {}, product: {}", cart.getUserId(), cart.getProductId());
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            logger.error("Error updating cart item: {}", e.getMessage(), e);
            throw new RuntimeException("Failed to update cart item: " + e.getMessage(), e);
        }
    }

    public void delete(Long id) {
        try {
            entityManager.getTransaction().begin();
            Cart cart = entityManager.find(Cart.class, id);
            if (cart != null) {
                entityManager.remove(cart);
                logger.info("Cart item deleted: {}", id);
            }
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            logger.error("Error deleting cart item: {}", e.getMessage(), e);
            throw new RuntimeException("Failed to delete cart item: " + e.getMessage(), e);
        }
    }

    public Cart findById(Long id) {
        try {
            TypedQuery<Cart> query = entityManager.createQuery(
                    "SELECT c FROM Cart c WHERE c.id = :id", Cart.class);
            query.setParameter("id", id);
            return query.getSingleResult();
        } catch (NoResultException e) {
            logger.warn("Cart item not found, id: {}", id);
            return null;
        } catch (Exception e) {
            logger.error("Error finding cart item by id: {}", e.getMessage(), e);
            throw new RuntimeException("Failed to find cart item: " + e.getMessage(), e);
        }
    }

    public Cart findByUserIdAndProductId(Long userId, Long productId) {
        try {
            TypedQuery<Cart> query = entityManager.createQuery(
                    "SELECT c FROM Cart c WHERE c.userId = :userId AND c.productId = :productId", Cart.class);
            query.setParameter("userId", userId);
            query.setParameter("productId", productId);
            return query.getSingleResult();
        } catch (NoResultException e) {
            logger.warn("Cart item not found for user: {}, product: {}", userId, productId);
            return null;
        } catch (Exception e) {
            logger.error("Error finding cart item: {}", e.getMessage(), e);
            throw new RuntimeException("Failed to find cart item: " + e.getMessage(), e);
        }
    }

    public List<Cart> findByUserId(Long userId) {
        try {
            TypedQuery<Cart> query = entityManager.createQuery(
                    "SELECT c FROM Cart c WHERE c.userId = :userId ORDER BY c.id DESC", Cart.class);
            query.setParameter("userId", userId);
            return query.getResultList();
        } catch (Exception e) {
            logger.error("Error finding cart items for user: {}", e.getMessage(), e);
            return Collections.emptyList();
        }
    }
}