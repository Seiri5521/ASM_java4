package com.poly.DTO;

import com.poly.Entity.Product;

public class CartItems {
	private Product product;
	private int quantity;

	// Getters and setters
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
