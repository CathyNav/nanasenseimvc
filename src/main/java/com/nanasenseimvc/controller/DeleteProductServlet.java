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


@WebServlet ("/deleteproduct")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html ; charset:UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			
			if (id !=null) {
				ProductDao productDao = new ProductDao(DbCon.getConnection());
				productDao.deleteProduct(Integer.parseInt(id));
				
				System.out.println("Product deleted");
				response.sendRedirect("admin/adminboutique.jsp?msg=done");
			}else {
				System.out.println("Product did'nt delete");
				response.sendRedirect("admin/adminboutique.jsp?msg=wrong");
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
