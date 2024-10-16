package com.nanasenseimvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.model.Encryption;

@WebServlet ("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SignUpServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		try{
			String roles= "client";
			String email = request.getParameter("email");
			String pseudo = request.getParameter("pseudo");
			String password = request.getParameter("password");
			String securityQuestion = request.getParameter("securityQuestion");
			String answer = request.getParameter("answer");
			//pour encrypter le mot de passe
			String userPassword=Encryption.getSHA1(password);
			
			
			Connection con = DbCon.getConnection();
			PreparedStatement pst = con.prepareStatement("INSERT INTO users(roles, email, pseudo, motDePasse, questionDeSecurite, reponse) values ( ?, ?, ?, ?, ?,?); ");
			
			pst.setString(1, roles);
			pst.setString(2, email);
			pst.setString(3, pseudo);
			pst.setString(4, userPassword);
			pst.setString(5, securityQuestion);
			pst.setString(6, answer);
			
			pst.executeUpdate();
			
			response.sendRedirect("login.jsp");
			
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			e.getMessage();
			System.out.print("No user register!");
		response.sendRedirect("signup.jsp?msg=invalid");

	}

	}

}
