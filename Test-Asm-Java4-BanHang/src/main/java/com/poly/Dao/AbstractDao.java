package com.poly.Dao;

import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import com.poly.Util.JPAUtils;

public class AbstractDao<T> {
    protected static final EntityManager entityManager = JPAUtils.getEntityManager();

    @Override
    protected void finalize() throws Throwable {
        if (entityManager.isOpen()) {
            entityManager.close();
        }
        super.finalize();
    }

    public T findById(Class<T> clazz, Integer id) {
        return entityManager.find(clazz, id);
    }

    public List<T> findAll(Class<T> clazz, boolean existActivated) {
        String entityName = clazz.getSimpleName();
        StringBuilder sql = new StringBuilder("SELECT o FROM ").append(entityName).append(" o");
        if (existActivated) {
            sql.append(" WHERE o.available = true");
        }
        TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
        return query.getResultList();
    }

    public List<T> findAll(Class<T> clazz, boolean existActivated, int pageNumber, int pageSize) {
        String entityName = clazz.getSimpleName();
        StringBuilder sql = new StringBuilder("SELECT o FROM ").append(entityName).append(" o");
        if (existActivated) {
            sql.append(" WHERE o.available = true");
        }
        TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
        query.setFirstResult((pageNumber - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public T findOne(Class<T> clazz, String sql, Map<String, Object> params) {
        TypedQuery<T> query = entityManager.createQuery(sql, clazz);
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        List<T> result = query.getResultList();
        return result.isEmpty() ? null : result.get(0);
    }

    public List<T> findMany(Class<T> clazz, String sql, Map<String, Object> params) {
        TypedQuery<T> query = entityManager.createQuery(sql, clazz);
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        return query.getResultList();
    }

    public List<Object[]> findManyByNativeQuery(String sql, Map<String, Object> params) {
        Query query = entityManager.createNativeQuery(sql);
        if (params != null) {
            for (Map.Entry<String, Object> entry : params.entrySet()) {
                query.setParameter(entry.getKey(), entry.getValue());
            }
        }
        return query.getResultList();
    }

    public T create(T entity) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(entity);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error creating entity", e);
        }
    }

    public T update(T entity) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entity = entityManager.merge(entity);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error updating entity", e);
        }
    }

    public T delete(T entity) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.remove(entity);
            transaction.commit();
            return entity;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error deleting entity", e);
        }
    }

    public List<T> callStoredProcedure(String namedStore, Map<String, Object> params) {
        StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery(namedStore);
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        return query.getResultList();
    }
}
