package com.poly.Dao;


import java.util.List;

import com.poly.Entity.Product;

public interface ProductDAO {
    Product findByID(Integer id);
    Product findByName(String name);
    List<Product> findAll();
    List<Product> findAll(int pageNumber, int pageSize);
    Product create(Product entity);
    Product update(Product entity);
    Product delete(Product entity);
}
