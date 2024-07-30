package com.poly.Dao;

import java.util.List;

import com.poly.Storage.ProductLikedInfo;

public interface StatsDAO {
	
	List<ProductLikedInfo> findProductLikedInfo ();
}
