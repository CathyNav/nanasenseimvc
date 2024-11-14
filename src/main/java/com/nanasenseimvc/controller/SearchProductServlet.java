package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.model.Product;

@WebServlet("/searchproduct")
public class SearchProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public SearchProductServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String search = request.getParameter("search");
            
            if (search == null || search.trim().isEmpty()) {
                out.println("<p>Veuillez entrer un terme de recherche valide.</p>");
                return;                
            }response.sendRedirect("boutique.jsp");

            String query = "SELECT * FROM produit WHERE nomProduit LIKE ? OR descriptionProduit LIKE ?";
            try (Connection con = DbCon.getConnection();
                 PreparedStatement pst = con.prepareStatement(query)) {
                
                pst.setString(1, "%" + search + "%");
                pst.setString(2, "%" + search + "%");
                
                try (ResultSet rs = pst.executeQuery()) {
                    boolean resultsFound = false;
                                       
                    while (rs.next()) {
                        resultsFound = true;
                        Product row = new Product();
						row.setId(rs.getInt("idproduit"));
						row.setImage(rs.getString("photoProduit"));
						row.setName(rs.getString("nomProduit"));
						row.setCategory(rs.getString("descriptionProduit"));
						row.setPrice(rs.getDouble("prixUnitaireProduit"));
						row.setStock(rs.getInt("stock"));
						row.setTags(rs.getString("tags"));
                    }
                   
                    
                    if (!resultsFound) {
                       response.sendRedirect("boutique.jsp");
                    }
                }
            } catch (SQLException | ClassNotFoundException e) {
                out.println("<p>Une erreur s'est produite lors de la recherche. Veuillez réessayer plus tard.</p>");
                getServletContext().log("Erreur lors de la recherche de produits", e);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

	