package com.nanasenseimvc.controller;

// Import necessary Java and Servlet libraries
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;

// Servlet mapping for the "/editproduct" URL
@WebServlet("/editproduct")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Constructor
    public EditProductServlet() {
        super();
    }

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type and character encoding to handle UTF-8 characters
        response.setContentType("text/html ; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Retrieve product details from HTTP request parameters
        String id = request.getParameter("id"); // Product ID
        String reference = request.getParameter("reference"); // Product reference
        String image = request.getParameter("image"); // Product image URL or path
        String name = request.getParameter("nom"); // Product name
        String category = request.getParameter("description"); // Product description or category
        double price = Double.parseDouble(request.getParameter("prix")); // Product price (converted to double)
        int stock = Integer.parseInt(request.getParameter("stock")); // Product stock quantity (converted to integer)
        String tags = request.getParameter("tags"); // Tags associated with the product

        try (PrintWriter out = response.getWriter()) {
            // SQL query to update product details in the database using placeholders for parameters
            String query = "UPDATE produit SET reference=?, nomProduit=?, descriptionProduit=?, " +
                           "prixUnitaireProduit=?, photoProduit=?, stock=?, tags=? WHERE idProduit=?";

            // Establish database connection using a utility class (DbCon)
            Connection con = DbCon.getConnection();

            // Create a PreparedStatement to safely execute the SQL query with parameterized inputs
            PreparedStatement pstmt = con.prepareStatement(query);

            // Set the values for each placeholder in the SQL query
            pstmt.setString(1, reference);  // Set reference value
            pstmt.setString(2, name);       // Set product name value
            pstmt.setString(3, category);   // Set description/category value
            pstmt.setDouble(4, price);      // Set price value
            pstmt.setString(5, image);      // Set image URL/path value
            pstmt.setInt(6, stock);         // Set stock quantity value
            pstmt.setString(7, tags);       // Set tags value
            pstmt.setString(8, id);         // Set product ID value

            // Execute the update query and get the number of affected rows
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // If at least one row is updated, redirect to admin page with success message
                response.sendRedirect("admin/adminboutique.jsp?msg=done");
            }
        } catch (Exception e) {
            // Log error message if the update fails for any reason
            System.out.println("The product " + id + " " + reference + " " + name + " didn't update");

            // Redirect to admin page with an error message in case of failure
            response.sendRedirect("admin/adminboutique.jsp?msg=wrong");
        }
    }

    // Handle POST requests by delegating them to the doGet method for processing
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
