package com.poly.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.Constant.SessionAtt;
import com.poly.Entity.Accounts;
import com.poly.Entity.Order;
import com.poly.Entity.Product;
import com.poly.Service.OrderService;
import com.poly.Service.OrderServiceImpl;
import com.poly.Service.ProductService;
import com.poly.Service.ProductServiceImpl;

@WebServlet(urlPatterns = { "/index", "/favorites", "/history" })
public class HomeServlet extends HttpServlet {
    public static final int PRODUCT_MAX_PAGE_SIZE = 4;
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private OrderService orderService = new OrderServiceImpl();

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
}
