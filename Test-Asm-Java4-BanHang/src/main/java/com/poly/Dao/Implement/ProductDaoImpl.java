package com.poly.Dao.Implement;

import java.util.List;
import java.util.Map;

import com.poly.Dao.AbstractDao;
import com.poly.Dao.ProductDAO;
import com.poly.Entity.Product;

public class ProductDaoImpl extends AbstractDao<Product> implements ProductDAO {

    @Override
    public Product findByID(Integer id) {
        return super.findById(Product.class, id);
    }

    @Override
    public Product findByName(String name) {
        String hql = "SELECT p FROM Product p WHERE p.name = :name";
        // Sử dụng :name để đặt tham số
        return super.findOne(Product.class, hql, Map.of("name", name));
    }

    @Override
    public List<Product> findAll() {
        return super.findAll(Product.class, true);
    }

    @Override
    public List<Product> findAll(int pageNumber, int pageSize) {
        return super.findAll(Product.class, true, pageNumber, pageSize);
    }

    @Override
    public Product create(Product entity) {
        return super.create(entity);
    }

    @Override
    public Product update(Product entity) {
        return super.update(entity);
    }

    @Override
    public Product delete(Product entity) {
        return super.delete(entity);
    }
}
