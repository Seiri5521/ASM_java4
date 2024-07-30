package com.poly.Service;

import java.math.BigInteger;
import java.util.List;

import com.poly.Dao.ProductDAO;
import com.poly.Dao.Implement.ProductDaoImpl;
import com.poly.Entity.Product;

//Lop DAO va Controller k xu li Logic ma lop Servide se xu li no!
public class ProductServiceImpl implements ProductService {

	private ProductDAO dao;

	// New hàm tạo để có the goi no
	public ProductServiceImpl() {
		dao = new ProductDaoImpl();
	}

	@Override
	public Product findByID(Integer id) {
		//
		return dao.findByID(id);
	}

	@Override
	public List<Product> findAll() {
		//
		return dao.findAll();
	}

	@Override
	public List<Product> findAll(int pageNumber, int pageSize) {
		//
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public Product create(Product entity) {
		//
		entity.setAvailable(Boolean.TRUE);
//		entity.setCategoryId(0);
//		entity.setPrice(0);
		return dao.create(entity);
	}
	@Override
	public Product update(Product entity) {
		//
		return dao.update(entity);
	}


	@Override
	public Product findByHref(String image) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product delete(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
}
