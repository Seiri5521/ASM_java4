package com.poly.Util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtils {
    private static final EntityManagerFactory emf;
    
    static {
        try {
            emf = Persistence.createEntityManagerFactory("JAVA4_BANHANG");
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}
