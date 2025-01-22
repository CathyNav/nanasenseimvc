<%-- Import necessary Java classes --%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="com.nanasenseimvc.model.Product"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="com.nanasenseimvc.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
// Establish database connection
Connection con = DbCon.getConnection();
// Get product ID from request parameter
String id = request.getParameter("id");
try {
    // Prepare SQL query to fetch product details
    String query = "SELECT * FROM produit WHERE idProduit=?";
    PreparedStatement pst = con.prepareStatement(query);
    pst.setString(1, id);
    // Execute query
    ResultSet rs = pst.executeQuery();
    
    // Process query results
    while (rs.next()) {
%>
        
<title><%=rs.getString(4) %></title>
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
<section role="region" aria-labelledby="NomduProduit">
<div class="produit">
        <%-- Back to boutique link and cart icon --%>
        <div class="back"> 
            <a href="boutique.jsp" class="back"><i class="fa-solid fa-angles-left"></i>  Retour </a>
            <a href="panier.jsp">
                <img class="panier" src="images/panier.png" alt="" width="40px" height="40px" >
            </a>
        </div>

        <div class="product">
            <div class="titre">
            <%-- Hidden input for product ID --%>
            <input type="hidden" name="id" value="<%=rs.getString(1)%>">
                <h1 id="NomduProduit"> <%=rs.getString(4) %></h1>
                <img src="images/<%=rs.getString(3) %>" alt="">
            </div>
            <div>
                <p class="descriptionproduit"><%=rs.getString(5) %></p>
            </div>
            <div class="price">
                <p > <%=rs.getString(6) %> €</p><br>
            </div>
        </div>
        <%-- Add to cart button --%>
        <a class="addtocart" type="submit" href="addtocart?id=<%=rs.getString(1) %>"> Ajouter au panier</a>
        </div>
        <%
    }
} catch (Exception e) {
    // Print error message if exception occurs
    System.out.println(e.getMessage());
}
%>
    </section>
    <%-- Include footer.jsp file --%>
<%@include file="includes/footer.jsp" %>
</body>
</html>
