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


@WebServlet("/addnewproduct")
public class AddNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddNewProductServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html ; charset:UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			String reference = request.getParameter("reference");
			String image = request.getParameter("image");
			String name = request.getParameter("nom");
			String category = request.getParameter("description");
			double price = Double.parseDouble(request.getParameter("prix"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String tags = request.getParameter("tags");
			
			
			ProductDao pdao= new ProductDao(DbCon.getConnection());
			Product product = pdao.addProduct(reference, image, name, category, price, 0, tags);
			
			System.out.println("Product added");
			response.sendRedirect("admin/adminboutique.jsp?msg=done");
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("No product added");
			response.sendRedirect("addNewProduct.jsp?msg=wrong");
		
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
