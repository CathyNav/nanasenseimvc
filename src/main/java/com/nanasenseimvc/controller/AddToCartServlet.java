package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanasenseimvc.model.Cart;



@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddToCartServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()) {
		    int id = Integer.parseInt(request.getParameter("id"));
		    Cart cm = new Cart();
		    cm.setId(id);
		    cm.setQuantity(1);

		    HttpSession session = request.getSession();
		    ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
		    if (cartList == null) {
		        cartList = new ArrayList<>(); 

		        cartList.add(cm);
		    } else {
		        boolean exists = false;
		        for (Cart c : cartList) {
		            if (c.getId() == id) {
		                c.setQuantity(c.getQuantity() + 1);
		                exists = true;
		                break; // Sortir de la boucle dès que le produit est trouvé
		            }
		        }
		        if (!exists) {
		            cartList.add(cm);
		        }
		    }
		    session.setAttribute("cart-list", cartList); // Mettre à jour la session
		    response.sendRedirect("panier.jsp");
		} catch (NumberFormatException e) {
		    // Gérer l'erreur de conversion de l'ID
		    // Par exemple, afficher un message d'erreur à l'utilisateur
		   
		}}}
