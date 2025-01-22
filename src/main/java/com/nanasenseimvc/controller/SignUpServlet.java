package com.nanasenseimvc.controller;

// Import necessary Java and Servlet libraries
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import custom classes for database connection and encryption
import com.nanasenseimvc.connection.DbCon;
import com.nanasenseimvc.model.Encryption;

// Servlet mapping for the signup process
@WebServlet ("/signup")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;          
    // Constructor
    public SignUpServlet() {
        super();
    }
    // Handle GET requests (redirect to login page)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                response.sendRedirect("login.jsp");
    }    
    // Handle POST requests (process signup form)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try{
            // Set default role as "client"
            String roles= "client";
            // Retrieve form data
            String email = request.getParameter("email");
            String pseudo = request.getParameter("pseudo");
            String password = request.getParameter("password");
            String securityQuestion = request.getParameter("securityQuestion");
            String answer = request.getParameter("answer");
            // Encrypt the password
            String userPassword=Encryption.getSHA1(password);     
            // Establish database connection
            Connection con = DbCon.getConnection();
            // Prepare SQL statement for inserting new user
            PreparedStatement pst = con.prepareStatement("INSERT INTO users(roles, email, pseudo, motDePasse, questionDeSecurite, reponse) values ( ?, ?, ?, ?, ?,?); ");
            // Set parameters for the prepared statement
            pst.setString(1, roles);
            pst.setString(2, email);
            pst.setString(3, pseudo);
            pst.setString(4, userPassword);
            pst.setString(5, securityQuestion);
            pst.setString(6, answer);
            // Execute the insert statement
            pst.executeUpdate();
            // Redirect to login page after successful signup
            response.sendRedirect("login.jsp");
            }
        catch(Exception e)
        {
            // Handle exceptions
            e.printStackTrace();
            e.getMessage();
            System.out.print("No user register!");
            // Redirect back to signup page with error message
            response.sendRedirect("signup.jsp?msg=invalid");
        }
    }
}