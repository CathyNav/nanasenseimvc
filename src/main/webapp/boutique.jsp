<%@page import="java.util.List"%>
<%@page import="com.nanasenseimvc.dao.ProductDao"%>
<%@page import="com.nanasenseimvc.model.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ProductDao prodd = new ProductDao(DbCon.getConnection());
List<Product> products = prodd.getAllProducts();
%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nana-sensei | La boutique</title>
<%@include file="includes/head.jsp" %>
<style type="text/css">
<%@include file="CSS/boutique.css"%>
</style>
</head>
<body>
  <%@include file="includes/menu.jsp" %>
<h1 id="boutique">Bienvenue sur la boutique de Nana-sensei !</h1>

  <div class="search-container">
    <div class="barresearch">
    <form action="boutique.jsp" method="post">
        <input id="recherche" type="search" placeholder="Rechercher un article" name="search">
        <button id="recherche" type="submit"><img src="images/loupe.png" alt="" width="30px" height="30px"></button>
    </form>   
     <div><a href="panier.jsp">
<img class="panier" src="images/panier.png" alt="" width="40px" height="40px" ></a>
</div></div>
<!--<div class="tag">
    <p class="text">Tags : </p>
    <div id="tags"> #E-book</div>
    <div id="tags"> #papeterie</div>
    <div id="tags"> #fanart</div>
</div>-->
</div>
<section role="region" >
<article role="article">
<%
if(!products.isEmpty()){
	for(Product p : products){ %>
	
<div class="productcard"><a href="productboutique.jsp?id=<%=p.getId() %>">
    <div class="photocard">
    <img src="images/<%=p.getImage()%>" alt=""></div>
    <h2 class="nomproduit"> <%=p.getName() %></h2>
    <p class="descriptionproduit"> <%=p.getCategory() %></p>
    <p class="prix"><%=p.getPrice() %> €</p>
    </a>
</div>
<%}
} %>
</article>
</section>

  <%@include file="includes/footer.jsp" %>
</body>
</html>