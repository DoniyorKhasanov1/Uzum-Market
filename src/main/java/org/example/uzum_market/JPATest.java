package org.example.uzum_market;

import jakarta.persistence.EntityManager;
import org.example.uzum_market.config.JPAUtil;
import org.example.uzum_market.entity.Product;

import java.util.List;

public class JPATest {
    public static void main(String[] args) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Long count = em.createQuery("SELECT COUNT(p) FROM Product p", Long.class)
                    .getSingleResult();
            System.out.println("Total products: " + count);

            List<Product> products = em.createQuery("SELECT p FROM Product p", Product.class)
                    .getResultList();
            System.out.println("Products: " + products);
        } finally {
            em.close();
            JPAUtil.close();
        }
    }
}