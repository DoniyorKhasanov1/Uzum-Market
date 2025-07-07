package org.example.uzum_market.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    private static final EntityManagerFactory emf;

    static {
        try {
            emf = Persistence.createEntityManagerFactory("uzum_market");
            System.out.println("EntityManagerFactory created successfully");
        } catch (Throwable ex) {
            System.err.println("Initial EntityManagerFactory creation failed: " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    public static void testConnection() {
        EntityManager em = null;
        try {
            em = getEntityManager();
            System.out.println("Database connection test successful!");
        } catch (Exception e) {
            System.err.println("Database connection test failed: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }
}