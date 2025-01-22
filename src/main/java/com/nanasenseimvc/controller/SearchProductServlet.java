package com.nanasenseimvc.controller;

// Import necessary Java and Servlet libraries
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import custom classes
import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.model.Product;

// Define the servlet mapping URL
@WebServlet("/searchproduct")
public class SearchProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    // Constructor
    public SearchProductServlet() {
        super();
    }

    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
    	// Set response content type
    	response.setContentType("text/html; charset=UTF-8");
    	
    	// Use try-with-resources to automatically close the PrintWriter
    	try (PrintWriter out = response.getWriter()) { 
          // Get the search term from the request parameters
          String search = request.getParameter("search");
          
          // Create a list to store search results
          List<Product> searchResults = new ArrayList<Product>();
          
          // SQL query to search for products
          String query = "SELECT * FROM produit WHERE nomProduit LIKE ? OR descriptionProduit LIKE ?";
          
          // Establish database connection and execute query
          Connection con = DbCon.getConnection();
          PreparedStatement pst = con.prepareStatement(query);
          
          // Set search parameters for the query
          pst.setString(1, "%" + search + "%");
          pst.setString(2, "%" + search + "%");
          
          // Execute the query and process results
          ResultSet rs = pst.executeQuery();
          while (rs.next()) {
              // Create a new Product object for each result
              Product row = new Product();
              row.setId(rs.getInt("idproduit"));
              row.setImage(rs.getString("photoProduit"));
              row.setName(rs.getString("nomProduit"));
              row.setCategory(rs.getString("descriptionProduit"));
              row.setPrice(rs.getDouble("prixUnitaireProduit"));
              row.setStock(rs.getInt("stock"));
              row.setTags(rs.getString("tags"));
              
              // Add the product to the search results list
              searchResults.add(row);
          }
          
          // Set attributes for the JSP page
          request.setAttribute("searchResults", searchResults);
          request.setAttribute("searchTerm", search);
          
          // Forward the request to the boutique.jsp page
          request.getRequestDispatcher("boutique.jsp").forward(request, response);
          
        } catch (SQLException | ClassNotFoundException e) {
          // Log any errors that occur during the search process
          getServletContext().log("Erreur lors de la recherche de produits", e);
          
          // Redirect to the boutique page with an error parameter
          response.sendRedirect("boutique.jsp?error=search_error");
          return;
        }
    }    
}
