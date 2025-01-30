<%-- Import necessary Java classes --%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="com.nanasenseimvc.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.nanasenseimvc.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//Create a DecimalFormat object with the pattern "#.##"
DecimalFormat dcf = new DecimalFormat("#.##");

//Set the DecimalFormat object as an attribute named "dcf" in the request
request.setAttribute("dcf", dcf);
// Retrieve the cart list from the session
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

// Initialize variables for cart products and total
List<Cart> cartProduct = null;
double total = 0;

// If the cart list is not empty
if(cart_list != null) {
    // Get database connection
    ProductDao pDao = new ProductDao(DbCon.getConnection());
    // Retrieve cart products
    cartProduct = pDao.getCartProducts(cart_list);    
    
    // Calculate total price (commented out for now)
     total = pDao.getTotalCartPrice(cart_list);
     request.setAttribute("total", total);
    
    // Set cart list as a request attribute
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panier | Nana-sensei </title>
    <%-- Include head.jsp file --%>
    <%@include file="includes/head.jsp" %>
    <%-- Include CSS styles --%>
    <style type="text/css">
    <%@include file="CSS/boutique.css"%>
    </style>
</head>
<body>
    <%-- Include menu.jsp file --%>
    <%@include file="includes/menu.jsp" %>
    <%-- Back to boutique link --%>
    <div> <a href="boutique.jsp" class="link"><i class="fa-solid fa-angles-left"></i> Retour </a></div>
    <h1 id="panier">Votre panier</h1>

    <div class="produit">
    <%
    // If cart is not empty, display cart items
    if(cart_list != null) {
        for (Cart c : cartProduct) {
    %>
        <hr>
        <div class="cartproduct"> 
            <input type="hidden" name="id" value="<%=c.getId()%>">
            <div><input type="checkbox"></div>
            <div> <img class="photoproduct" src="images/<%=c.getImage() %>" alt=""></div>
            <div>
                <div><h2 class="nomproduit"><%=c.getName() %></h2></div>
                <div class="infoproduit">
                    <div><p class="price">Quantité</p></div>
                    <div class="price">
                        <%-- Decrease quantity link --%>
                        <a href="quantityincdec?action=dec&id=<%=c.getId()%>"><i class="fa-solid fa-minus" ></i></a>
                        <%=c.getQuantity() %>  
                        <%-- Increase quantity link --%>
                        <a href="quantityincdec?action=inc&id=<%=c.getId()%>"><i class="fa-solid fa-plus" ></i></a>
                    </div>
                    <div class="price">
                        <%-- Remove item from cart link --%>
                        <a href="removeproductcart?id=<%=c.getId() %>" ><i class="fa-solid fa-trash-can"></i></a>
                    </div>
                </div>
            </div>
            <div class="price"><%=c.getPrice() %>€</div> 
        </div>
        <hr>
    <% 
        }
    }
    %>
    <!-- Paragraph to display the total order amount -->
   <p class="total">Total de la commande <%=(total >0)?dcf.format(total):0 %> €</p> 
    <%-- Checkout button --%>
    <a class="addtocart" type="submit"> Valider la commande</a>
    </div>    
    <!-- Include footer.jsp file -->
   <%@include file="includes/footer.jsp" %>
</body>
</html>
