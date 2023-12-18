package com.example.starterpack.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityMangerBuilder {
    private final static EntityManagerFactory emf =
            Persistence.createEntityManagerFactory(Environment.PU_NAME);

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}
