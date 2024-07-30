package com.poly.Dao.Implement;

import java.util.List;
import java.util.Map;

import com.poly.Dao.AbstractDao;
import com.poly.Dao.OrderDetailsDAO;
import com.poly.Entity.OrderDetails;

public class OrderDetailsDaoImpl extends AbstractDao<OrderDetails> implements OrderDetailsDAO {

    @Override
    public List<OrderDetails> findByOrder(Long orderId) {
        // Cập nhật HQL để lấy danh sách OrderDetails dựa vào OrderId
        String hql = "SELECT od FROM OrderDetails od WHERE od.orderId = :orderId";
        return super.findMany(OrderDetails.class, hql, Map.of("orderId", orderId));
    }

    @Override
    public List<OrderDetails> findByOrderAndIsLiked(Long orderId) {
        // Cập nhật HQL nếu cần điều kiện `isLiked` và thuộc tính là phần của OrderDetails
        // Trong trường hợp này, bảng OrderDetails không có thuộc tính `isLiked`
        // Do đó, phương thức này có thể bị loại bỏ hoặc bạn có thể thêm thuộc tính `isLiked` vào bảng OrderDetails
        // Hoặc, thay đổi truy vấn để phù hợp với cấu trúc hiện tại của bảng
        return null; // Bạn cần điều chỉnh tùy thuộc vào yêu cầu của bạn
    }

    @Override
    public OrderDetails findByOrderIdAndProductId(Long orderId, Integer productId) {
        // Cập nhật HQL để tìm OrderDetails dựa vào OrderId và ProductId
        String hql = "SELECT od FROM OrderDetails od WHERE od.orderId = :orderId AND od.productId = :productId";
        return super.findOne(OrderDetails.class, hql, Map.of("orderId", orderId, "productId", productId));
    }

    @Override
    public OrderDetails create(OrderDetails entity) {
        // Tạo mới OrderDetails và lưu vào cơ sở dữ liệu
        return super.create(entity);
    }

    @Override
    public OrderDetails update(OrderDetails entity) {
        // Cập nhật OrderDetails và lưu vào cơ sở dữ liệu
        return super.update(entity);
    }
}
