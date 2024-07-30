package com.poly.Dao.Implement;

import java.util.List;
import java.util.Map;

import com.poly.Constant.NamedStored;
import com.poly.Dao.AbstractDao;
import com.poly.Dao.AccountsDAO;
import com.poly.Entity.Accounts;

public class AccountsDaoImpl extends AbstractDao<Accounts> implements AccountsDAO {

    @Override
    public Accounts findByEmail(String email) {
        // Sử dụng câu lệnh SQL với tham số
        String sql = "SELECT o FROM Accounts o WHERE o.email = :email";
        return super.findOne(Accounts.class, sql, Map.of("email", email));
    }

    @Override
    public Accounts findByUsername(String username) {
        String sql = "SELECT o FROM Accounts o WHERE o.username = :username";
        return super.findOne(Accounts.class, sql, Map.of("username", username));
    }

    @Override
    public Accounts findByUsernameAndPassword(String username, String password) {
        // Cập nhật câu lệnh SQL với tham số đặt tên
        String sql = "SELECT a FROM Accounts a WHERE a.username = :username AND a.password = :password";
        return super.findOne(Accounts.class, sql, Map.of("username", username, "password", password));
    }

    @Override
    public List<Accounts> findAll() {
        // Tìm những User đang hoạt động
        return super.findAll(Accounts.class, true);
    }

    @Override
    public List<Accounts> findAll(int pageNumber, int pageSize) {
        return super.findAll(Accounts.class, true, pageNumber, pageSize);
    }

    @Override
    public Accounts create(Accounts entity) {
        return super.create(entity);
    }

    @Override
    public Accounts update(Accounts entity) {
        return super.update(entity);
    }

    @Override
    public Accounts delete(Accounts entity) {
        return super.delete(entity);
    }

    @Override
    public List<Accounts> findAccountsLikedByProductsId(Map<String, Object> params) {
        // Đảm bảo sử dụng đúng tên thủ tục lưu trữ
        return super.callStoredProcedure(NamedStored.FIND_ACCOUNTS_BY_ID, params);
    }

    @Override
    public Accounts findByID(String username) {
        // Phương thức này chưa được triển khai
        return null;
    }

}
