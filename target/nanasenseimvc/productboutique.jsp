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
<meta charset="UTF-8"><%
String id = request.getParameter("id");
try{
	Connection con= DbCon.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM produit WHERE idProduit='"+id+"';");
	
	while (rs.next()){%>
        
<title><%=rs.getString(4) %></title>
<%@include file="includes/head.jsp" %>
<style type="text/css">
<%@include file="CSS/boutique.css"%>
</style>
</head>
<body>
<%@include file="includes/menu.jsp" %>
 <div class="search-container">
    <div class="barresearch">
    <form action="boutique.jsp" method="post">
        <input id="recherche" type="text" placeholder="Rechercher un article" name="search">
        <button id="recherche" type="submit"><img src="images/loupe.png" alt="" width="30px" height="30px"></button>
    </form>
    
    <div>
<img class="panier" src="images/panier.png" alt="" width="40px" height="40px" >
</div></div>
<div class="tag">
    <p class="text">Tags : </p>
    <div id="tags"> #E-book</div>
    <div id="tags"> #papeterie</div>
    <div id="tags"> #fanart</div>
</div>
</div>
<section role="region" aria-labelledby="NomduProduit">
<div class="produit">
        <div> <a href="boutique.jsp" class="back"><i class="fa-solid fa-angles-left"></i>  Retour </a></div>


        <div class="product">
            <div class="titre">
            <input type="hidden" name="id" value="<%=rs.getString(1)%>">
                <h1 id="NomduProduit"> <%=rs.getString(4) %></h1>
                <img src="images/<%=rs.getString(3) %>" alt="">
            </div>
            <div>
                <p class="descriptionproduit"><%=rs.getString(5) %></p>
            </div>
            <div class="price">
                <p > <%=rs.getString(6) %> €</p><br>
                <p > Quantité</p><br>
                <div class="quantite"> <i class="fa-solid fa-minus"></i> 1  <i class="fa-solid fa-plus"></i></div>
            </div>
        </div>
        <a class="addtocart" type="submit" href="addtocart?id=<%=rs.getString(1) %>"> Ajouter au panier</a>
        </div>
        	<%}
}catch (Exception e){
	System.out.println(e.getMessage());
}
%>
    </section>
    <%@include file="includes/footer.jsp" %>
</body>
</html>