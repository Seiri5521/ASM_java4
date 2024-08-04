package com.poly.DTO;

import java.io.Serializable;
import java.util.HashMap;

public class CartDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String userId;
	private double tongtien = 0;
	private int tongsl = 0;
	private String dienthoai;
	private String diachi;
	private HashMap<Integer, CartDetailDto> detail = new HashMap<>();

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
	
	public String getDienthoai() {
		return dienthoai;
	}

	public void setDienthoai(String dienthoai) {
		this.dienthoai = dienthoai;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public HashMap<Integer, CartDetailDto> getDetail() {
		return detail;
	}

	public void setDetail(HashMap<Integer, CartDetailDto> detail) {
		this.detail = detail;
	}
}
