package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Customer;

import java.util.List;

public class CustomerRepository {
    private EntityManager entityManager;

    public EntityManager getEntityManager() {
        if
        (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityMangerBuilder.getEntityManager();
        }
        return entityManager;
    } //ต้องใช้


    public Customer findByName(String name) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("CUSTOMER.FIND_USER");
        query.setParameter("user_account", name);
        try {
            return (Customer) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Customer> findAll() {
        return getEntityManager().createNamedQuery("CUSTOMER.FIND_ALL").getResultList();
    }
}
