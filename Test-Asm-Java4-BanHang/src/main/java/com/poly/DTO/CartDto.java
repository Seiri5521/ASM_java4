package com.poly.DTO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class CartDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String userId;
	private double tongtien = 0;
	private int tongsl = 0;
	private HashMap<Integer, CartDetailDto> detail = new HashMap<>();
	private List<CartItems> items = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public double getTongtien() {
		return tongtien;
	}

	public void setTongtien(double tongtien) {
		this.tongtien = tongtien;
	}

	public int getTongsl() {
		return tongsl;
	}

	public void setTongsl(int tongsl) {
		this.tongsl = tongsl;
	}
	

	public HashMap<Integer, CartDetailDto> getDetail() {
		return detail;
	}

	public void setDetail(HashMap<Integer, CartDetailDto> detail) {
		this.detail = detail;
	}
	
	public List<CartItems> getItems() {
		return items;
	}

	public void setItems(List<CartItems> items) {
		this.items = items;
	}

}

