package com.nanasenseimvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.model.Cart;

// This servlet handles requests to increase or decrease the quantity of items in the cart
@WebServlet("/quantityincdec")
public class QuantityIncDecServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public QuantityIncDecServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html; charset=UTF-8");
        
        try {
            // Get the action (increase or decrease) and item ID from the request parameters
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Retrieve the cart list from the session
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            
            // Check if action, id, and cart_list are valid
            if (action != null && id >= 1 && cart_list != null) {
                boolean updated = false;
                
                // Iterate through the cart items
                for (Cart c : cart_list) {
                    if (c.getId() == id) {
                        int quantity = c.getQuantity();
                        
                        // Increase quantity if action is "inc"
                        if ("inc".equals(action)) {
                            quantity++;
                            updated = true;
                        } 
                        // Decrease quantity if action is "dec" and quantity is greater than 1
                        else if ("dec".equals(action) && quantity > 1) {
                            quantity--;
                            updated = true;
                        }
                        
                        // Update the item quantity
                        c.setQuantity(quantity);
                        break;  // Exit the loop after finding the item
                    }
                }
                
                // If the cart was updated, save the changes to the session
                if (updated) {
                    request.getSession().setAttribute("cart-list", cart_list);
                }
            }
        } catch (NumberFormatException e) {
            // Handle exception if the ID is not a valid number
            e.printStackTrace();
        } catch (Exception e) {
            // Handle other potential exceptions
            e.printStackTrace();
        }
        
        // Redirect the user back to the cart page
        response.sendRedirect("panier.jsp");
    }
}