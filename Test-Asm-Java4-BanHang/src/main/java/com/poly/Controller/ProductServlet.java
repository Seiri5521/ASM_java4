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
import com.poly.Entity.Order;
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
            if (id != null) {
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
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
        }
    }

    private void doGetView(HttpSession session, String id, HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(id);
            Product product = productService.findByID(productId);
            if (product != null) {
                req.setAttribute("product", product);
                Accounts currentAccounts = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);
                if (currentAccounts != null) {
                    // User-related operations
                }
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/product-detail.jsp");
                requestDispatcher.forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format");
        }
    }

    private void doGetOrder(HttpSession session, String id, HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(id);
            Accounts currentAccounts = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);

            if (currentAccounts == null) {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }

            boolean result = orderService.create(currentAccounts.getUsername(), orderId) != null;
            if (result) {
                resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order creation failed");
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID format");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    handleAddProduct(req, resp);
                    break;
                case "edit":
                    handleEditProduct(req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
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
        } catch (IllegalArgumentException | NullPointerException e) {
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
        } catch (IllegalArgumentException | NullPointerException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        }
    }
}
