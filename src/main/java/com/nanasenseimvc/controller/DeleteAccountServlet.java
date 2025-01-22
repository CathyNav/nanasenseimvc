package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.dao.ClientDao;
import com.nanasenseimvc.dao.UserDao;

// Servlet mapping for "/deleteaccount"
@WebServlet ("/deleteaccount")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public DeleteAccountServlet() {
        super();
    }
    
    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html ; charset:UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Get the user ID from the request parameters
            String id = request.getParameter("id");
            if (id != null) {
                // Delete user from the database
                UserDao userDao = new UserDao(DbCon.getConnection());
                userDao.deleteUser(Integer.parseInt(id));
                
                // Delete client from the database
                ClientDao clientDao = new ClientDao(DbCon.getConnection());
                clientDao.deleteClient(Integer.parseInt(id));
                
                System.out.println("User deleted");
                
                // Remove user authentication and redirect to home page
                request.getSession().removeAttribute("auth");
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("User didn't delete");
                response.sendRedirect("account.jsp?msg=wrong");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
    
    // Handle POST requests (currently just calls doGet)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
