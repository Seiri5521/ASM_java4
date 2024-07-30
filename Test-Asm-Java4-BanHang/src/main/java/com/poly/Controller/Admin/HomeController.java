package com.poly.Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
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
import com.poly.Entity.Accounts;
import com.poly.Service.StatsService;
import com.poly.Service.StatsServiceImpl;
import com.poly.Service.AccountsService;
import com.poly.Service.AccountsServiceImpl;
import com.poly.Storage.ProductLikedInfo;

@WebServlet(urlPatterns = { "/admin", "/admin/favorites" }, name = "HomeControllerOfAdmin")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StatsService statsService = new StatsServiceImpl();
	private AccountsService accountsService = new AccountsServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Accounts currentAccounts = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);
		if (currentAccounts != null && currentAccounts.getAdmin() == true) {

			String path = req.getServletPath(); //localhost/Asm-Java4/login - Path trả về sau tên Project
			switch (path) {
			case "/admin":
				doGetHome(req, resp);
				break;
			case "/admin/favorites":
				doGetFavorites(req, resp);
				break;
			default:
				resp.sendRedirect("index");
				break;
			}

		} else {
			resp.sendRedirect("index");
		}

	}

	private void doGetHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Thống kê tất cả video và lượt
		List<ProductLikedInfo> videos = statsService.findProductLikedInfo();
		req.setAttribute("videos", videos);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/home.jsp");
		dispatcher.forward(req, resp);
	}

	// localhost:8080/asm-java4/admin/favorites?productId={productId}
	private void doGetFavorites(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json"); // Set kiểu trả về là JSON

		String productIdParam = req.getParameter("productId");

		if (productIdParam == null) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Trả về lỗi 400 nếu thiếu tham số
			out.print("{\"error\": \"Missing productId parameter\"}");
			out.flush();
			return;
		}

		int productId;
		try {
			productId = Integer.parseInt(productIdParam);
		} catch (NumberFormatException e) {
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Trả về lỗi 400 nếu tham số không hợp lệ
			out.print("{\"error\": \"Invalid productId parameter\"}");
			out.flush();
			return;
		}

		// Gọi dịch vụ để lấy dữ liệu
		List<Accounts> accounts;
		try {
			accounts = accountsService.findUsersBoughtByProductId(productId);
		} catch (Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Trả về lỗi 500 nếu có lỗi khi gọi dịch vụ
			out.print("{\"error\": \"Internal server error\"}");
			out.flush();
			return;
		}

		if (accounts.isEmpty()) {
			resp.setStatus(HttpServletResponse.SC_NO_CONTENT); // Trả về lỗi 204 nếu không có dữ liệu
		} else {
			// Phải map User từ Object sang Json
			ObjectMapper mapper = new ObjectMapper();
			String dataResponse = mapper.writeValueAsString(accounts);

			resp.setStatus(HttpServletResponse.SC_OK); // Trả về mã 200 OK và dữ liệu JSON
			out.print(dataResponse); // In ra danh sách Users đã được convert sang Json
		}

		out.flush(); // Xả stream - đẩy ra
	}
}
