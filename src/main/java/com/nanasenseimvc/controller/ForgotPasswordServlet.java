package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.dao.UserDao;
import com.nanasenseimvc.model.Encryption;
import com.nanasenseimvc.model.User;

@WebServlet ("/forgotpassword")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ForgotPasswordServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html; charset=UTF-8");
		
		try (PrintWriter out=response.getWriter()){
			
		//out.print("this is forgot password servlet");
		
		String email= request.getParameter("email");
		String securityQuestion= request.getParameter("securityQuestion");
		String answer= request.getParameter("answer");
		String newPassword = request.getParameter("newPassword");
		String userPassword = Encryption.getSHA1(newPassword);
		
		//je me connecte à la base de donnée
		UserDao udao = new UserDao(DbCon.getConnection());
		
		User user = udao.userForgotPassword(email, securityQuestion, answer, userPassword);
		System.out.print("User : "+ email+ " password changed !");
		response.sendRedirect("login.jsp");
		
		} catch (Exception e) {
			
			System.out.print("No user register!");
			response.sendRedirect("singup.jsp?msg=invalid");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
