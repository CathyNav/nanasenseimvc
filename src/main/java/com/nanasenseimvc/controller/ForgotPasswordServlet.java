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

// This servlet is mapped to the "/forgotpassword" URL
@WebServlet("/forgotpassword")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    // Constructor
    public ForgotPasswordServlet() {
        super();       
    }

    // This method handles GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");        
        try (PrintWriter out = response.getWriter()) {
            // Get parameters from the request
            String email = request.getParameter("email");
            String securityQuestion = request.getParameter("securityQuestion");
            String answer = request.getParameter("answer");
            String newPassword = request.getParameter("newPassword");
            
            // Encrypt the new password
            String userPassword = Encryption.getSHA1(newPassword);
            
            // Connect to the database
            UserDao udao = new UserDao(DbCon.getConnection());
            
            // Attempt to change the user's password
            boolean user = udao.userForgotPassword(email, securityQuestion, answer,userPassword);
            
            System.out.print("User : " + email + " password changed!");
            response.sendRedirect("login.jsp");
            
        } catch (Exception e) {
            System.out.print("No user registered!");
            response.sendRedirect("singup.jsp?msg=invalid");
        }
    }

    // This method handles POST requests by calling doGet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
