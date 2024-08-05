package com.poly.Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.Dao.StaffDAO;
import com.poly.Entity.Accounts;

/**
 * Servlet implementation class UserServlet
 */

@WebServlet({
		  "/admin/user.jsp", "/admin/create", "/admin/update", "/admin/delete",
		  "/admin/reset", "/admin/edit/*"
})

public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public StaffServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        request.setCharacterEncoding("utf-8");
        StaffDAO dao = new StaffDAO();
        Accounts user = new Accounts();

        if (url.contains("delete")) {
            String username = request.getParameter("username");
            if (username != null) {
                dao.remove(username);
                request.setAttribute("message", "Delete success!");
            } else {
                request.setAttribute("error", "Username is required for delete!");
            }
        } else if (url.contains("edit")) {
            String username = request.getParameter("username");
            if (username != null) {
                user = dao.findById(username);
                request.setAttribute("user", user);
            } else {
                request.setAttribute("error", "Username is required for edit!");
            }
        }

        findAll(request, response);
        request.getRequestDispatcher("/views/admin/user.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        request.setCharacterEncoding("utf-8");

        if (url.contains("create")) {
            create(request, response);
        } else if (url.contains("update")) {
            update(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
        } else if (url.contains("reset")) {
            request.setAttribute("user", new Accounts());
        }

        findAll(request, response);
        request.getRequestDispatcher("/views/admin/user.jsp").forward(request, response);
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Accounts user = new Accounts();
            BeanUtils.populate(user, request.getParameterMap());
            StaffDAO dao = new StaffDAO();
            dao.create(user);
            request.setAttribute("message", "Create success!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Accounts user = new Accounts();
            BeanUtils.populate(user, request.getParameterMap());
            StaffDAO dao = new StaffDAO();
            dao.update(user);
            request.setAttribute("message", "Update success!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            StaffDAO dao = new StaffDAO();
            if (username != null) {
                dao.remove(username);
                request.setAttribute("message", "Delete success!");
            } else {
                request.setAttribute("error", "Username is required for delete!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	StaffDAO dao = new StaffDAO();
            List<Accounts> list = dao.findAll();
            request.setAttribute("users", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}