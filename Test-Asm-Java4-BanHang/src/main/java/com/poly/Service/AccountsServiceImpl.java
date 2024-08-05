package com.poly.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poly.Dao.AbstractDao;
import com.poly.Dao.AccountsDAO;
import com.poly.Dao.Implement.AccountsDaoImpl;
import com.poly.Entity.Accounts;

public class AccountsServiceImpl implements AccountsService {
    private AccountsDAO dao;

    public AccountsServiceImpl() {
        dao = new AccountsDaoImpl();
    }

    @Override
    public Accounts findByID(String username) {
        // Sử dụng phương thức tìm kiếm theo username
        return dao.findByUsername(username);
    }

    @Override
    public Accounts findByEmail(String email) {
        return dao.findByEmail(email);
    }

    @Override
    public Accounts findByUsername(String username) {
        return dao.findByUsername(username);
    }

    @Override
    public Accounts login(String username, String password) {
        // Sử dụng phương thức tìm kiếm theo username và password
        return dao.findByUsernameAndPassword(username, password);
    }

    @Override
    public Accounts resetPassword(String email) {
        Accounts existUser = findByEmail(email); // Tìm xem đã tồn tại User với Email này chưa
        if (existUser != null) {
            // Tạo mật khẩu mới ngẫu nhiên
            String newPass = String.valueOf((int) (Math.random() * ((9999 - 1000) + 1)) + 1000);
            existUser.setPassword(newPass);
            return dao.update(existUser);
        }
        return null;
    }

    @Override
    public List<Accounts> findAll() {
        return dao.findAll();
    }

    @Override
    public List<Accounts> findAll(int pageNumber, int pageSize) {
        return dao.findAll(pageNumber, pageSize);
    }

    @Override
    public Accounts create(String username, String password, String fullname, String email, String photo) {
        Accounts newAccounts = new Accounts();
        newAccounts.setUsername(username);
        newAccounts.setPassword(password);
        newAccounts.setEmail(email);
        newAccounts.setFullname(fullname); // Thêm thông tin fullname
        newAccounts.setPhoto(photo); // Thêm thông tin photo
        newAccounts.setAdmin(Boolean.FALSE);
        newAccounts.setActivated(Boolean.TRUE);
        return dao.create(newAccounts);
    }

    @Override
    public Accounts update(Accounts entity) {
        return dao.update(entity);
    }

    @Override
    public Accounts delete(String username) {
        Accounts user = dao.findByUsername(username);
        if (user != null) {
            user.setActivated(Boolean.FALSE);
            return dao.update(user);
        }
        return null;
    }

    @Override
    public List<Accounts> findUsersBoughtByProductId(int productId) {
        Map<String, Object> params = new HashMap<>();
        params.put("ProductId", productId);
        // Thay đổi phương thức gọi stored procedure cho phù hợp
        return  ((AbstractDao<Accounts>) dao).callStoredProcedure("sp_selectUsersBoughtProductById", params);
    }
    
    @Override
	public void updatePassword(Accounts account, String newPassword) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String generateNewPassword() {
		// TODO Auto-generated method stub
		return null;
	}
}
