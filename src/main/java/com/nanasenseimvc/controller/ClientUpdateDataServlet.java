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
import com.nanasenseimvc.model.User;

// Servlet mapping for "/clientupdatedata"
@WebServlet("/clientupdatedata")
public class ClientUpdateDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public ClientUpdateDataServlet() {
        super();        
    }
    
    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html ; charset:UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            // Retrieve the ID of the connected user
            User auth = (User) request.getSession().getAttribute("auth");
            if (auth != null) {
                int userId = auth.getId();
            
                // Retrieve client data from the database
                ClientDao cdao = new ClientDao(DbCon.getConnection());
                Client client = cdao.getClientById(userId);
                
                if (client != null) {
                    // Store client data in the request
                    request.setAttribute("clientData", client);
                }
            }
            
            // Redirect to the form page
            request.getRequestDispatcher("account.jsp").forward(request, response);
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("account.jsp?msg=error");
        }
    }
        
    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doGet(request, response);
        try (PrintWriter out = response.getWriter()){
            
            // Retrieve form data
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String mail = request.getParameter("mail");
            String adressePostale = request.getParameter("adresse");
            String cp = request.getParameter("cp");
            String ville = request.getParameter("ville");
            String pays = request.getParameter("pays");
            String telephone = request.getParameter("tel");
        
            // Update client data in the database
            ClientDao cdao = new ClientDao(DbCon.getConnection());
            Client clients = cdao.clientDataUpdate(id, nom, prenom, mail, adressePostale, cp, ville, pays, telephone);
            
            // Redirect to account page with success message
            response.sendRedirect("account.jsp?msg=done");
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Account not updated");
            // Redirect to account page with error message
            response.sendRedirect("account.jsp?msg=wrong");
        }
    }
}
