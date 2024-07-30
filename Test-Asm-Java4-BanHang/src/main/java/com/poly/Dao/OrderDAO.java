package com.poly.Dao;

import java.math.BigInteger;
import java.util.List;
import com.poly.Entity.Order;

public interface OrderDAO {
    Order findByID(BigInteger id);
    List<Order> findAll();
    List<Order> findAll(int pageNumber, int pageSize);
    Order create(Order entity);
    Order update(Order entity);
    void delete(BigInteger id);
}
