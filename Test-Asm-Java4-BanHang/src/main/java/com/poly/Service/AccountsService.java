package com.poly.Service;

import java.util.List;

import com.poly.Entity.Accounts;

public interface AccountsService {
    Accounts findByID(String username);
    Accounts findByEmail(String email);
    Accounts findByUsername(String username);
    Accounts login(String username, String password);
    Accounts resetPassword(String email);
    List<Accounts> findAll();
    List<Accounts> findAll(int pageNumber, int pageSize);
    Accounts create(String username, String password, String fullname, String email, String photo);
    Accounts update(Accounts entity);
    Accounts delete(String username);
    // Thêm phương thức mới
    List<Accounts> findUsersBoughtByProductId(int productId); // Tìm người dùng đã mua sản phẩm theo productId
}
