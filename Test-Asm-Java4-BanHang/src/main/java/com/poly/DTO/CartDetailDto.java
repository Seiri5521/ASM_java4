package com.poly.DTO;

import java.io.Serializable;

public class CartDetailDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer masp;
	private String tensp;
	private float giasp;
	private String hinh;
	private int slMua;

	public Integer getMasp() {
		return masp;
	}

	public void setMasp(Integer masp) {
		this.masp = masp;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public float getGiasp() {
		return giasp;
	}

	public void setGiasp(float giasp) {
		this.giasp = giasp;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public int getSlMua() {
		return slMua;
	}

	public void setSlMua(int slMua) {
		this.slMua = slMua;
	}
}
