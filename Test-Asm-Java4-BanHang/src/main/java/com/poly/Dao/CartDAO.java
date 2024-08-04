package com.poly.Dao;

import java.util.List;
import javax.persistence.EntityManager;
import com.poly.Entity.Order;
import com.poly.Entity.OrderDetails;
import com.poly.Util.JPAUtils;

public class CartDAO {
    public boolean insertCart(Order hoadon, List<OrderDetails> listHDCT) {
        final EntityManager entityManager = JPAUtils.getEntityManager();;
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(hoadon);
            Long maHDVuaInsert = hoadon.getId();
            if (maHDVuaInsert > 0) {
                // neu insert thanh cong thi insert tiep HDCT
                hoadon.setId(maHDVuaInsert);
                listHDCT.forEach(hdct -> entityManager.persist(hdct));
            } else {
                return false;
            }
            entityManager.getTransaction().commit();
            System.out.println("Create succeed");
            return true;
        } catch (Exception e) {
            if (entityManager != null) {
                entityManager.getTransaction().rollback();
            }
            System.out.println("Cannot insert entity");
            e.printStackTrace();
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
}
