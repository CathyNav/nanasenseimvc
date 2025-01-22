package com.nanasenseimvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanasenseimvc.model.Cart;

// Servlet mapping for "/removeproductcart" URL
@WebServlet("/removeproductcart")
public class RemoveProductCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public RemoveProductCartServlet() {
        super();
    }    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Get the product ID from the request parameters
            String productId = request.getParameter("id");
            
            if (productId != null && !productId.isEmpty()) {
                // Retrieve the cart list from the session
                ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                
                if (cart_list != null) {
                    // Convert the product ID to an integer
                    int id = Integer.parseInt(productId);
                    
                    // Find the item to remove from the cart
                    Cart itemToRemove = null;
                    for (Cart c : cart_list) {
                        if (c.getId() == id) {
                            itemToRemove = c;
                            break;
                        }
                    }
                    
                    // Remove the item if found
                    if (itemToRemove != null) {
                        cart_list.remove(itemToRemove);
                        // Update the cart list in the session
                        request.getSession().setAttribute("cart-list", cart_list);
                    }
                }
            }
            
            // Redirect to the cart page
            response.sendRedirect("panier.jsp");
        } catch (NumberFormatException e) {
            // Handle number format exception (invalid product ID)
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            // Handle any other exceptions
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
