package com.poly.Service;


import java.util.List;

import com.poly.Entity.Product;


public interface ProductService {
	Product findByID(Integer id);
	Product findByHref(String image);
	List<Product> findAll();
	List<Product> findAll(int pageNumber, int pageSize);
	Product create(Product entity);
	Product update(Product entity);
	Product delete(Integer id);
	
}
