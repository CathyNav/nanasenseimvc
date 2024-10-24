package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;



@WebServlet ("/editproduct")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public EditProductServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html ; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String reference = request.getParameter("reference");
		String image = request.getParameter("image");
		String name = request.getParameter("nom");
		String category = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("prix"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String tags = request.getParameter("tags");
		
		try (PrintWriter out = response.getWriter()) {
			
			Connection con = DbCon.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("UPDATE produit SET reference='"+reference+"', nomProduit='"+name+"', descriptionProduit='"+category+"', prixUnitaireProduit='"+price+"', photoProduit='"+image+"', stock='"+stock+"', tags='"+tags+"'WHERE idProduit='"+id+"';");
			
					response.sendRedirect("admin/adminboutique.jsp?msg=done");
			
		} catch (Exception e) {
			System.out.println("the product " +id+ " "+reference+" "+name+" didn't update");
			response.sendRedirect("admin/adminboutique.jsp?msg=wrong");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
