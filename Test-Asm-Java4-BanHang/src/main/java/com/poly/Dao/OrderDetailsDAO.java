package com.poly.Dao;

import java.util.List;

import com.poly.Entity.Order;
import com.poly.Entity.OrderDetails;
import com.poly.Entity.Product;

public interface OrderDetailsDAO {
    // Khai báo các phương thức
    List<OrderDetails> findByOrder(Long orderId);
    List<OrderDetails> findByOrderAndIsLiked(Long orderId);
    OrderDetails findByOrderIdAndProductId(Long orderId, Integer productId);
    OrderDetails create(OrderDetails entity);
    OrderDetails update(OrderDetails entity);
}
