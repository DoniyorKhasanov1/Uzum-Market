package org.example.uzum_market.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("uzum_market");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}
