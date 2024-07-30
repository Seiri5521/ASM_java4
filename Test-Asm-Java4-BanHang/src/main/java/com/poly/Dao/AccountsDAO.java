package com.poly.Dao;

import java.util.List;
import java.util.Map;

import com.poly.Entity.Accounts;

public interface AccountsDAO {
	Accounts findByID(String username);
	Accounts findByEmail(String email);
	Accounts findByUsername(String username);
	Accounts findByUsernameAndPassword(String username, String password);
	List<Accounts> findAll();
	List<Accounts> findAll(int pageNumber, int pageSize);
	Accounts create(Accounts entity);
	Accounts update(Accounts entity);
	Accounts delete(Accounts entity);
	List<Accounts> findAccountsLikedByProductsId(Map<String, Object> params);
}
