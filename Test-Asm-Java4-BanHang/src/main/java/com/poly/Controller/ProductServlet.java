package com.poly.Controller;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.Constant.SessionAtt;
import com.poly.Entity.Accounts;
import com.poly.Entity.Product;
import com.poly.Service.OrderService;
import com.poly.Service.OrderServiceImpl;
import com.poly.Service.ProductService;
import com.poly.Service.ProductServiceImpl;

@WebServlet(urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String id = req.getParameter("id");
        HttpSession session = req.getSession();
        
        if (action != null) {
            switch (action) {
                case "view":
                    doGetView(session, id, req, resp);
                    break;
                case "order":
                    doGetOrder(session, id, req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
        }
    }

    private void doGetView(HttpSession session, String id, HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(id); // Convert to int for Product
            Product product = productService.findByID(productId);
            req.setAttribute("product", product);
            Accounts currentAccounts = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);

            // If logged in, you may want to handle user-related logic here
            if (currentAccounts != null) {
                // User-related operations
            }

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/product-detail.jsp");
            requestDispatcher.forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format");
        }
    }

    private void doGetOrder(HttpSession session, String id, HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            BigInteger orderId = new BigInteger(id); // Convert to BigInteger for Order
            Accounts currentAccounts = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);

            if (currentAccounts == null) {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // User not logged in
                return;
            }

            boolean result = orderService.createOrder(currentAccounts.getUsername(), orderId);
            if (result) {
                resp.setStatus(HttpServletResponse.SC_NO_CONTENT); // Success but no data returned
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Error
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID format");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            handleAddProduct(req, resp);
        } else if ("edit".equals(action)) {
            handleEditProduct(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void handleAddProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Product product = new Product();
            product.setName(req.getParameter("name"));
            product.setPrice(Double.parseDouble(req.getParameter("price")));
            product.setCategoryId(req.getParameter("categoryId"));
            product.setImage(req.getParameter("image"));
            product.setCreateDate(java.sql.Date.valueOf(req.getParameter("createDate")));
            product.setAvailable(Boolean.parseBoolean(req.getParameter("available")));

            productService.create(product);

            resp.sendRedirect(req.getContextPath() + "/product?action=view&id=" + product.getId());
        } catch (IllegalArgumentException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        }
    }

    private void handleEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findByID(productId);
            if (product != null) {
                product.setName(req.getParameter("name"));
                product.setPrice(Double.parseDouble(req.getParameter("price")));
                product.setCategoryId(req.getParameter("categoryId"));
                product.setImage(req.getParameter("image"));
                product.setCreateDate(java.sql.Date.valueOf(req.getParameter("createDate")));
                product.setAvailable(Boolean.parseBoolean(req.getParameter("available")));

                productService.update(product);

                resp.sendRedirect(req.getContextPath() + "/product?action=view&id=" + productId);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            }
        } catch (IllegalArgumentException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        }
    }
}
