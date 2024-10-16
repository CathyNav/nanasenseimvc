package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.dao.UserDao;
import com.nanasenseimvc.model.Encryption;
import com.nanasenseimvc.model.User;


@WebServlet ("/userlogin")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		try (PrintWriter out=response.getWriter()){
			String email= request.getParameter("login-email");
			String password = request.getParameter("login-password");
			String userPassword = Encryption.getSHA1(password);
			
			//out.print("This infos servlet : " + email + " "+ password);
			
				UserDao udao= new UserDao(DbCon.getConnection());
				User user= udao.userLogin(email,userPassword);
				
				if (user != null) {
				if (user.getRoles().equals("admin")) {
					request.getSession().setAttribute("auth", user);
					session.setAttribute("email", email);

					System.out.print(" ADMIN Login: ");
					System.out.print(" Admin: " + email + " logged in");
					response.sendRedirect("admin/adminHome.jsp");
				} else {
					request.getSession().setAttribute("auth", user);
					
					response.sendRedirect("index.jsp");
					System.out.print("CLIENT login");
					System.out.print(" Client: " + email + " logged in");

				}

			} else {
				response.sendRedirect("index.jsp?msg=WrongPasswordOrEmail");
				System.out.print("erreur MDP ou em@il");
			}

			} catch (ClassNotFoundException | SQLException |NoSuchAlgorithmException  e) {
				e.printStackTrace();
			}
		
	}

}

