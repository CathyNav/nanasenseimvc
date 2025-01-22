package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// This annotation maps the servlet to the URL "/logout"
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    // Unique identifier for serialization
    private static final long serialVersionUID = 1L;       
    // Constructor
    public LogoutServlet() {
        super();
    }
    // This method handles GET requests to the "/logout" URL
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // Check if the user is authenticated (has an "auth" attribute in the session)
            if (request.getSession().getAttribute("auth") != null) {
                // If authenticated, remove the "auth" attribute from the session
                request.getSession().removeAttribute("auth");
                // Redirect the user to the login page
                response.sendRedirect("login.jsp");
            } else {
                // If not authenticated, redirect the user to the index page
                response.sendRedirect("index.jsp");
            }
        }
    }
}