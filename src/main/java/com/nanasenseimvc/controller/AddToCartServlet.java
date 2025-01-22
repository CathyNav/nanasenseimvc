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

// Servlet mapping for "/addtocart" URL
@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
           
    public AddToCartServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Get the product ID from the request parameters
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Create a new Cart item with the given ID and quantity 1
            Cart cm = new Cart();
            cm.setId(id);
            cm.setQuantity(1);
            
            // Get the current session
            HttpSession session = request.getSession();
            
            // Retrieve the existing cart list from the session
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
            
            if (cartList == null) {
                // If the cart doesn't exist, create a new one and add the item
                cartList = new ArrayList<>(); 
                cartList.add(cm);
            } else {
                boolean exists = false;
                // Check if the product already exists in the cart
                for (Cart c : cartList) {
                    if (c.getId() == id) {
                        // If it exists, increase the quantity
                        c.setQuantity(c.getQuantity() + 1);
                        exists = true;
                        break; // Exit the loop once the product is found
                    }
                }
                if (!exists) {
                    // If the product doesn't exist in the cart, add it
                    cartList.add(cm);
                }
            }
            
            // Update the cart list in the session
            session.setAttribute("cart-list", cartList);
            
            // Redirect to the cart page
            response.sendRedirect("panier.jsp");
        } catch (NumberFormatException e) {
            // Handle the error if the ID is not a valid number
            // For example, display an error message to the user
        }
    }
}
