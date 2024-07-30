package com.poly.Service;

import java.math.BigInteger;
import java.util.List;

import com.poly.Dao.OrderDAO;
import com.poly.Dao.Implement.OrderDaoImpl;
import com.poly.Entity.Order;

// Lop DAO va Controller khong xu li Logic ma lop Service se xu li no!
public class OrderServiceImpl implements OrderService {

    private OrderDAO dao;

    // New hàm tạo để có thể gọi nó
    public OrderServiceImpl() {
        dao = new OrderDaoImpl();
    }

    @Override
    public Order findByID(BigInteger id) {
        return dao.findByID(id);
    }

    @Override
    public List<Order> findAll() {
        return dao.findAll();
    }

    @Override
    public List<Order> findAll(int pageNumber, int pageSize) {
        return dao.findAll(pageNumber, pageSize);
    }

//    @Override
//    public Order create(Order entity) {
//        entity.setStatus("NEW"); // Example: set default status
//        return dao.create(entity);
//    }

    @Override
    public Order update(Order entity) {
        return dao.update(entity);
    }

    @Override
    public Order delete(BigInteger id) {
        Order order = dao.findByID(id);
        if (order != null) {
            dao.delete(id);
        }
        return order;
    }

    @Override
    public boolean createOrder(String username, BigInteger id) {
        // Implement logic to create an order
        return false;
    }

	@Override
	public Order create(Order entity) {
		// TODO Auto-generated method stub
		return null;
	}
}
