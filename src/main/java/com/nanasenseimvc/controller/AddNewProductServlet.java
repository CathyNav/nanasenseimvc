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
import com.nanasenseimvc.dao.ProductDao;
import com.nanasenseimvc.model.Product;

// This servlet handles requests to add a new product to the database
@WebServlet("/addnewproduct")
public class AddNewProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public AddNewProductServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html ; charset:UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            // Retrieve product details from request parameters
            String id = request.getParameter("id");
            String reference = request.getParameter("reference");
            String image = request.getParameter("image");
            String name = request.getParameter("nom");
            String category = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("prix"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String tags = request.getParameter("tags");
                    
            // Create a ProductDao instance and establish a database connection
            ProductDao pdao = new ProductDao(DbCon.getConnection());
            
            // Add the new product to the database
            Product product = pdao.addProduct(reference, image, name, category, price, 0, tags);
            
            // Log success message
            System.out.println("Product added");
            
            // Redirect to the admin boutique page with a success message
            response.sendRedirect("admin/adminboutique.jsp?msg=done");
            
        } catch (ClassNotFoundException | SQLException e) {
            // Log error message if product addition fails
            System.out.println("No product added");
            
            // Redirect to the add new product page with an error message
            response.sendRedirect("addNewProduct.jsp?msg=wrong");        
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
