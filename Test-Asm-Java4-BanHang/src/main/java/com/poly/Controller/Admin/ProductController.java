package com.poly.Controller.Admin;

import java.io.IOException;
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
import com.poly.Entity.Product;
import com.poly.Service.ProductService;
import com.poly.Service.ProductServiceImpl;

@WebServlet(urlPatterns = {"/admin/product"}, name = "ProductControllerOfAdmin")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Accounts currentUser = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);

        if (currentUser != null && Boolean.TRUE.equals(currentUser.getAdmin())) {
            String action = req.getParameter("action");

            if (action != null) {
                switch (action) {
                    case "view":
                        doGetOverview(req, resp);
                        break;
                    case "delete":
                        doGetDelete(req, resp);
                        break;
                    case "add":
                        req.setAttribute("isEdit", "false");
                        doGetAdd(req, resp);
                        break;
                    case "edit":
                        req.setAttribute("isEdit", "true");
                        doGetEdit(req, resp);
                        break;
                    default:
                        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                        break;
                }
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Accounts currentUser = (Accounts) session.getAttribute(SessionAtt.CURRENT_ACCOUNTS);

        if (currentUser != null && Boolean.TRUE.equals(currentUser.getAdmin())) {
            String action = req.getParameter("action");

            if (action != null) {
                switch (action) {
                    case "add":
                        doPostAdd(req, resp);
                        break;
                    case "edit":
                        doPostEdit(req, resp);
                        break;
                    default:
                        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                        break;
                }
            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/index");
        }
    }

    private void doGetOverview(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAll();
        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/product-overview.jsp");
        dispatcher.forward(req, resp);
    }

    private void doGetDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Integer id = Integer.parseInt(req.getParameter("id"));
            boolean result = productService.delete(id) != null;
            if (result) {
                resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format");
        }
    }

    private void doGetEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findByID(id);
            if (product != null) {
                req.setAttribute("product", product);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/product-edit.jsp");
                dispatcher.forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID format");
        }
    }

    private void doGetAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/product-edit.jsp");
        dispatcher.forward(req, resp);
    }

    private void doPostAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String image = req.getParameter("image");
            Float price = Float.parseFloat(req.getParameter("price"));
            String categoryId = req.getParameter("categoryId");

            Product product = new Product();
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setCategoryId(categoryId);
            product.setCreateDate(new java.util.Date());
            product.setAvailable(true);

            Product createdProduct = productService.create(product);
            if (createdProduct != null) {
                resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        }
    }

    private void doPostEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Integer id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String image = req.getParameter("image");
            Float price = Float.parseFloat(req.getParameter("price"));
            String categoryId = req.getParameter("categoryId");

            Product product = productService.findByID(id);
            if (product != null) {
                product.setName(name);
                product.setImage(image);
                product.setPrice(price);
                product.setCategoryId(categoryId);

                Product updatedProduct = productService.update(product);
                if (updatedProduct != null) {
                    resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
                } else {
                    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
        }
    }
}
