package com.poly.Service;

import java.util.List;

import com.poly.Entity.Order;
import com.poly.Entity.OrderDetails;
import com.poly.Entity.Product;	

public interface OrderDetailsService {
    List<OrderDetails> findByOrder(Long orderId);
    List<OrderDetails> findByOrderAndIsLiked(Long orderId);
    OrderDetails findByOrderIdAndProductId(Long orderId, Integer productId);
    OrderDetails create(Order order, Product product);
//    boolean updateLikeOrUnlike(Order order, String productHref);
}
