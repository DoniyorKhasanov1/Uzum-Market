package org.example.uzum_market.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.example.uzum_market.config.JPAUtil;
import org.example.uzum_market.entity.Product;

import java.util.List;

public class ProductRepository {

    public List<Product> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Product> query = em.createQuery("FROM Product", Product.class);
        return query.getResultList();
    }
}
