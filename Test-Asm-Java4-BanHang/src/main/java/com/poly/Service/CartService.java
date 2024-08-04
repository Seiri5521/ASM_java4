package com.poly.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.poly.DTO.CartDetailDto;
import com.poly.DTO.CartDto;
import com.poly.Dao.AccountsDAO;
import com.poly.Dao.CartDAO;
import com.poly.Dao.ProductDAO;
import com.poly.Dao.Implement.AccountsDaoImpl;
import com.poly.Dao.Implement.ProductDaoImpl;
import com.poly.Entity.Accounts;
import com.poly.Entity.Order;
import com.poly.Entity.OrderDetails;
import com.poly.Entity.Product;



public class CartService {
	
	ProductDAO productDao = new ProductDaoImpl();
	AccountsDAO accountsDao = new AccountsDaoImpl();
	CartDAO cartDao = new CartDAO();
	
	public boolean checkBeforeInsert(CartDto cart) {
		// kiem tra cart co ton tai sp hay khong, neu khong ton tai thi ko insert
		if (cart.getTongsl() == 0) {
			return false;
		}
		return insertHoaDon(cart);
	}
	
	public boolean insertHoaDon(CartDto cartDto) {
		Order hoadon = mappingDtoToOrderEntity(cartDto);
		List<OrderDetails> listHDCT = mappingDtoToOrderDetailEntity(cartDto.getDetail(), hoadon);
		return cartDao.insertCart(hoadon, listHDCT);
	}
	
	public CartDto updateCart(CartDto cart, Integer masp, int soLuong, boolean isUpdate) {
		Product product = productDao.findByID(masp);
		
		HashMap<Integer, CartDetailDto> cartDetail = cart.getDetail();
		
		if (cartDetail.containsKey(masp)) {
			if (soLuong < 1) {
				cartDetail.remove(masp);
			} else {
				if (isUpdate) {
					cartDetail.get(masp).setSlMua(soLuong);
				} else {
					int slCu = cartDetail.get(masp).getSlMua();
					cartDetail.get(masp).setSlMua(slCu + soLuong);
				}
			}
		} else {
			CartDetailDto cartDetailDto = new CartDetailDto();
			cartDetailDto.setTensp(product.getName());
			cartDetailDto.setGiasp(product.getPrice());
			cartDetailDto.setMasp(product.getId());
			cartDetailDto.setHinh(product.getImage());
			cartDetailDto.setSlMua(soLuong);
			cartDetail.put(masp, cartDetailDto);
		}
		
		cart.setTongsl(this.getTongSL(cart));
		cart.setTongtien(this.getTongTien(cart));
		
		return cart;
	}
	
	public double getTongTien(CartDto cart) {
		HashMap<Integer, CartDetailDto> cartDetail = cart.getDetail();
		Double tongTien = 0D;
		for (CartDetailDto cartDetailDto : cartDetail.values()) {
			Product product = productDao.findByID(cartDetailDto.getMasp());
			tongTien += product.getPrice() * cartDetailDto.getSlMua();
		}
		return tongTien;
	}
	
	public int getTongSL(CartDto cart) {
		HashMap<Integer, CartDetailDto> cartDetail = cart.getDetail();
		int tongSL = 0;
		for (CartDetailDto productDto : cartDetail.values()) {
			tongSL += productDto.getSlMua();
		}
		return tongSL;
	}
	
	private Order mappingDtoToOrderEntity(CartDto cartDto) {
		Order hoadon = new Order();
		hoadon.setAddress(cartDto.getDiachi());
		//hoadon.setDienthoai(cartDto.getDienthoai());
		//hoadon.setTongtien(cartDto.getTongtien());
		Accounts accounts = accountsDao.findByID(cartDto.getUserId());
		hoadon.setUser(accounts);
		return hoadon;
	}
	
	private List<OrderDetails> mappingDtoToOrderDetailEntity(HashMap<Integer, CartDetailDto> details, Order hoadon) {
		List<OrderDetails> result = new ArrayList<>();
		details.forEach((key, hdct) -> {
			OrderDetails hoadonchitiet = new OrderDetails();
			Product sanpham = productDao.findByID(hdct.getMasp());
			hoadonchitiet.setProduct(sanpham);
			hoadonchitiet.setPrice(hdct.getGiasp());
			hoadonchitiet.setQuantity(hdct.getSlMua());
			hoadonchitiet.setOrder(hoadon);
			result.add(hoadonchitiet);
		});
		return result;
	}
}
