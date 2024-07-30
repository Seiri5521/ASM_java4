package com.poly.Service;

import java.util.List;

import com.poly.Dao.OrderDetailsDAO;
import com.poly.Dao.Implement.OrderDetailsDaoImpl;
import com.poly.Entity.Order;
import com.poly.Entity.OrderDetails;
import com.poly.Entity.Product;

public class OrderDetailsServiceImpl implements OrderDetailsService {
    private OrderDetailsDAO dao;
    private ProductService productService;

    public OrderDetailsServiceImpl() {
        dao = new OrderDetailsDaoImpl();
        productService = new ProductServiceImpl(); // Khởi tạo ProductServiceImpl
    }

    @Override
    public List<OrderDetails> findByOrder(Long orderId) {
        return dao.findByOrder(orderId);
    }

    @Override
    public List<OrderDetails> findByOrderAndIsLiked(Long orderId) {
        // Phương thức này không phù hợp vì bảng OrderDetails không có thuộc tính isLiked
        return null; // Hoặc thực hiện một hành động khác nếu cần
    }

    @Override
    public OrderDetails findByOrderIdAndProductId(Long orderId, Integer productId) {
        return dao.findByOrderIdAndProductId(orderId, productId);
    }

    @Override
    public OrderDetails create(Order order, Product product) {
        OrderDetails existHistory = findByOrderIdAndProductId(order.getId(), product.getId());
        if (existHistory == null) {
            existHistory = new OrderDetails();
            existHistory.setOrder(order); // Sử dụng OrderId trực tiếp
            existHistory.setProduct(product); // Sử dụng ProductId trực tiếp
            existHistory.setPrice(null); // Set giá sản phẩm từ đối tượng Product
            existHistory.setQuantity(1); // Đặt số lượng mặc định là 1
            return dao.create(existHistory);
        }
        return existHistory;
    }

}
