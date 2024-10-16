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
import com.nanasenseimvc.model.Client;

@WebServlet("/clientupdatedata")
public class ClientUpdateDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClientUpdateDataServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html ; charset:UTF-8");
		request.setCharacterEncoding("UTF-8");
		try (PrintWriter out = response.getWriter()){
			
			int id = Integer.parseInt(request.getParameter("id"));
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String mail = request.getParameter("mail");
			String adressePostale = request.getParameter("adresse");
			String cp = request.getParameter("cp");
			String ville = request.getParameter("ville");
			String pays = request.getParameter("pays");
			String telephone = request.getParameter("tel");
		
			ClientDao cdao = new ClientDao(DbCon.getConnection());
			Client clients = cdao.clientDataUpdate(id, nom, prenom, mail, adressePostale, cp, ville, pays, telephone);
			
			response.sendRedirect("account.jsp?msg=done");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Account not updated");
			response.sendRedirect("account.jsp?msg=wrong");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
