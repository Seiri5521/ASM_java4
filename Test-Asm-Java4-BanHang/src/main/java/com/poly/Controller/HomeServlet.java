package com.poly.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.Constant.SessionAtt;
import com.poly.DTO.CartDto;
import com.poly.Entity.Accounts;
import com.poly.Entity.Order;
import com.poly.Entity.Product;
import com.poly.Service.CartService;
import com.poly.Service.OrderService;
import com.poly.Service.OrderServiceImpl;
import com.poly.Service.ProductService;
import com.poly.Service.ProductServiceImpl;

@WebServlet(urlPatterns = { "/index", "/favorites", "/history", "/cart", "/products", "/addCart" })
public class HomeServlet extends HttpServlet {
	public static final int PRODUCT_MAX_PAGE_SIZE = 4;
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductServiceImpl();
	private OrderService orderService = new OrderServiceImpl();
	CartService cartService = new CartService();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/index":
			doGetIndex(req, res);
			break;
		case "/favorites":
			doGetFavorites(session, req, res);
			break;
		case "/history":
			doGetHistory(session, req, res);
			break;
		case "/cart":
			doViewCart(req, res);
			break;
		case "/products":
			doGetProducts(req, res);
			break;
		case "/addCart":
			doAddToCart(req, res, session);
			break;
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    String path = req.getServletPath();
	    HttpSession session = req.getSession();
	    if ("/addCart".equals(path)) {
	        doAddToCart(req, res, session);
	        session.removeAttribute("cart");
	    }
	}


	private void doGetIndex(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Product> countProduct = productService.findAll();
		int maxPage = (int) Math.ceil(countProduct.size() / (double) PRODUCT_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);

		List<Product> products;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null || Integer.valueOf(pageNumber) > maxPage) {
			products = productService.findAll(1, PRODUCT_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			products = productService.findAll(Integer.valueOf(pageNumber), PRODUCT_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		req.setAttribute("products", products);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/index.jsp");
		requestDispatcher.forward(req, res);
	}

	private void doGetFavorites(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Accounts user = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);
		List<Order> orders = orderService.findAll();
		List<Product> products = new ArrayList<>();

		orders.forEach(order -> {
			if (order.getProducts() != null) {
				products.addAll(order.getProducts());
			}
		});

		req.setAttribute("products", products);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/favorites.jsp");
		requestDispatcher.forward(req, res);
	}

	private void doGetHistory(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Accounts user = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);
		List<Order> orders = orderService.findAll();
		List<Product> products = new ArrayList<>();

		orders.forEach(order -> {
			if (order.getProducts() != null) {
				products.addAll(order.getProducts());
			}
		});

		req.setAttribute("products", products);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/history.jsp");
		requestDispatcher.forward(req, res);
	}

//    Show sản phẩm
	private void doGetProducts(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		List<Product> products = productService.findAll();
		req.setAttribute("products", products);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/products.jsp");
		requestDispatcher.forward(req, res);
	}

//    Show giỏ hàng
	private void doViewCart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/cart.jsp");
		requestDispatcher.forward(req, res);
	}

//    Add sản phẩm vào giỏ hàng
//	private void doAddToCart(HttpServletRequest req, HttpServletResponse resp, HttpSession session, int masp,
//			int soluong) throws ServletException, IOException {
//		CartDto cart = (CartDto) session.getAttribute("cart");
//		boolean isUpdate = req.getParameter("isUpdate").equals("1");
//		cartService.updateCart(cart, masp, soluong, isUpdate);
//		ObjectMapper mapper = new ObjectMapper();
//		String cartToJsonString = mapper.writeValueAsString(cart);
//		resp.setContentType("application/json");
//		PrintWriter out = resp.getWriter();
//		out.print(cartToJsonString);
//		out.flush();
//	}
	
	private void doAddToCart(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws ServletException, IOException {
	    int productId = Integer.parseInt(req.getParameter("productId"));
	    int quantity = Integer.parseInt(req.getParameter("quantity"));
	    CartDto cart = (CartDto) session.getAttribute("cart");
	    
	    // Nếu giỏ hàng chưa tồn tại, khởi tạo mới
	    if (cart == null) {
	        cart = new CartDto();
	        session.setAttribute("cart", cart);
	    }
	    
	    boolean isUpdate = req.getParameter("isUpdate") != null && req.getParameter("isUpdate").equals("1");
	    cartService.updateCart(cart, productId, quantity, isUpdate);
	    ObjectMapper mapper = new ObjectMapper();
	    String cartToJsonString = mapper.writeValueAsString(cart);
	    resp.setContentType("application/json");
	    PrintWriter out = resp.getWriter();
	    out.print(cartToJsonString);
	    out.flush();
	}

}
