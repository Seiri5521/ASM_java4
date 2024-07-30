package com.poly.Dao.Implement;

import java.util.ArrayList;
import java.util.List;

import com.poly.Dao.AbstractDao;
import com.poly.Dao.StatsDAO;
import com.poly.Storage.ProductLikedInfo;

public class StatsDAOImpl extends AbstractDao<Object[]> implements StatsDAO {

    @Override
    public List<ProductLikedInfo> findProductLikedInfo() {
        // Viết câu query để lấy thông tin về sản phẩm và số lượng đơn hàng
        String sql = "SELECT p.Id, p.Name, p.Image, p.Price, p.CreateDate, p.Available, p.CategoryId, "
                   + "COUNT(od.Id) AS totalOrders "
                   + "FROM Products p LEFT JOIN OrderDetails od ON od.ProductId = p.Id "
                   + "WHERE p.Available = 1 "
                   + "GROUP BY p.Id, p.Name, p.Image, p.Price, p.CreateDate, p.Available, p.CategoryId "
                   + "ORDER BY totalOrders DESC";
        List<Object[]> objects = super.findManyByNativeQuery(sql, null); // Null vì không có tham số
        List<ProductLikedInfo> result = new ArrayList<>();
        // Duyệt list objects
        for (Object[] object : objects) {
            ProductLikedInfo productLikedInfo = setDataProductLikedInfo(object);
            result.add(productLikedInfo);
        }
        return result;
    }

    private ProductLikedInfo setDataProductLikedInfo(Object[] object) {
        ProductLikedInfo productLikedInfo = new ProductLikedInfo();
        // Ánh xạ dữ liệu từ Object[]
        productLikedInfo.setId((Integer) object[0]);
        productLikedInfo.setName((String) object[1]);
        productLikedInfo.setImage((String) object[2]);
        productLikedInfo.setPrice((Double) object[3]);
        productLikedInfo.setCreateDate((java.sql.Date) object[4]); // Chuyển đổi kiểu dữ liệu
        productLikedInfo.setAvailable((Boolean) object[5]);
        productLikedInfo.setCategoryId((String) object[6]); 
        return productLikedInfo;
    }
}
