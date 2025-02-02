package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import sit.int202.classicmodels.entities.Environment;

public class EntityMangerBuilder {
    private final static EntityManagerFactory emf =
            Persistence.createEntityManagerFactory(Environment.PU_NAME);

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}
