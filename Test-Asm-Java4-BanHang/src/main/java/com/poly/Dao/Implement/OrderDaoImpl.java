package com.poly.Dao.Implement;

import java.math.BigInteger;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.poly.Dao.OrderDAO;
import com.poly.Entity.Order;
import com.poly.Util.JPAUtils;

public class OrderDaoImpl implements OrderDAO {

    private EntityManager em = JPAUtils.getEntityManager();

    @Override
    public Order findByID(BigInteger id) {
        return em.find(Order.class, id);
    }

    @Override
    public List<Order> findAll() {
        TypedQuery<Order> query = em.createQuery("SELECT o FROM Order o", Order.class);
        return query.getResultList();
    }

    @Override
    public List<Order> findAll(int pageNumber, int pageSize) {
        TypedQuery<Order> query = em.createQuery("SELECT o FROM Order o", Order.class);
        query.setFirstResult((pageNumber - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    @Override
    public Order create(Order entity) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(entity);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        }
    }

    @Override
    public Order update(Order entity) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            entity = em.merge(entity);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        }
    }

    @Override
    public void delete(BigInteger id) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Order entity = em.find(Order.class, id);
            if (entity != null) {
                em.remove(entity);
            }
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        }
    }
}
