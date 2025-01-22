package com.nanasenseimvc.controller;

// Import necessary Java and Servlet libraries
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.dao.ProductDao;

// Servlet mapping for "/deleteproduct" URL
@WebServlet("/deleteproduct")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    // Constructor
    public DeleteProductServlet() {
        super();
    }

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html ; charset:UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            // Get the product ID from the request parameters
            String id = request.getParameter("id");
            
            // Check if ID is not null
            if (id != null) {
                // Create ProductDao instance with database connection
                ProductDao productDao = new ProductDao(DbCon.getConnection());
                // Delete the product using the provided ID
                productDao.deleteProduct(Integer.parseInt(id));
                
                // Log successful deletion
                System.out.println("Product deleted");
                // Redirect to admin page with success message
                response.sendRedirect("admin/adminboutique.jsp?msg=done");
            } else {
                // Log failed deletion due to null ID
                System.out.println("Product didn't delete");
                // Redirect to admin page with error message
                response.sendRedirect("admin/adminboutique.jsp?msg=wrong");
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Print stack trace and error message for exceptions
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}
