package com.poly.Dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import com.poly.Entity.Accounts;
import com.poly.Util.JPAUtils;

public class StaffDAO {

	    private EntityManager em = JPAUtils.getEntityManager();

	    public Accounts create(Accounts entity) {
	        try {
	            em.getTransaction().begin();
	            em.persist(entity); // add
	            em.getTransaction().commit();
	            return entity;
	        } catch (Exception e) {
	            em.getTransaction().rollback();
	            throw new RuntimeException("Failed to create user", e);
	        }
	    }

	    public Accounts update(Accounts entity) {
	        try {
	            em.getTransaction().begin();
	            em.merge(entity); // update
	            em.getTransaction().commit();
	            return entity;
	        } catch (Exception e) {
	            em.getTransaction().rollback();
	            throw new RuntimeException("Failed to update user", e);
	        }
	    }

	    public Accounts remove(String username) {
	        try {
	            em.getTransaction().begin();
	            Accounts entity = this.findById(username);
	            if (entity != null) {
	                em.remove(entity);
	                em.getTransaction().commit();
	                return entity;
	            } else {
	                em.getTransaction().rollback();
	                throw new RuntimeException("User not found: " + username);
	            }
	        } catch (Exception e) {
	            em.getTransaction().rollback();
	            throw new RuntimeException("Failed to delete user", e);
	        }
	    }

	    public Accounts findById(String username) {
	        return em.find(Accounts.class, username);
	    }

	    public List<Accounts> findByRole(boolean role) {
	        String jpql = "Select o from Accounts o where o.admin = :role1";
	        TypedQuery<Accounts> query = em.createQuery(jpql, Accounts.class);
	        query.setParameter("role1", role);
	        return query.getResultList();
	    }

	    public List<Accounts> findByKeyWord(String keyword) {
	        String jpql = "Select o from Accounts o where o.fullname like :keyword";
	        TypedQuery<Accounts> query = em.createQuery(jpql, Accounts.class);
	        query.setParameter("keyword", "%" + keyword + "%");
	        return query.getResultList();
	    }

	    public Accounts findOne(String username, String password) {
	        String jpql = "Select o from Accounts o where o.username = :username and o.password = :password";
	        TypedQuery<Accounts> query = em.createQuery(jpql, Accounts.class);
	        query.setParameter("username", username);
	        query.setParameter("password", password);
	        return query.getSingleResult();
	    }

	    public Accounts findByEmail(String email) {
	        String jpql = "Select o from Accounts o where o.email = :email";
	        TypedQuery<Accounts> query = em.createQuery(jpql, Accounts.class);
	        query.setParameter("email", email);
	        return query.getSingleResult();
	    }

	    public List<Accounts> findPage(int page, int size) {
	        String jpql = "Select o from Accounts o";
	        TypedQuery<Accounts> query = em.createQuery(jpql, Accounts.class);
	        query.setFirstResult(page * size);
	        query.setMaxResults(size);
	        return query.getResultList();
	    }

	    public List<Accounts> findAll() {
	        String jpql = "Select o from Accounts o";
	        TypedQuery<Accounts> query = em.createQuery(jpql, Accounts.class);
	        return query.getResultList();
	    }
	}
