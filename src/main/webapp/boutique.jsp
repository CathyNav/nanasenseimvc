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
<title>Nana-sensei - La boutique</title>
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
        <button id="recherche" type="submit" href="boutique.jsp"><img src="images/loupe.png" alt="" width="30px" height="30px"></button>
    </form>
    
    <div>
<img id="panier" src="images/panier.png" alt="" width="40px" height="40px" >
</div></div>
<div class="tag">
    <p class="text">Tags : </p>
    <div id="tags"> #E-book</div>
    <div id="tags"> #papeterie</div>
    <div id="tags"> #fanart</div>
</div>
</div>

<article role="article">
<%
if(!products.isEmpty()){
	for(Product p : products){ %>
<div class="productcard">
    <div class="photocard">
    <img src="images/<%=p.getImage()%>" alt=""></div>
    <h2 class="nomproduit"> <%=p.getName() %></h2>
    <p class="descriptionproduit"> <%=p.getCategory() %></p>
    <p class="prix"><%=p.getPrice() %> €</p>
    
</div>
<%
}
}
%>
</article>

</div>





  <%@include file="includes/footer.jsp" %>
</body>
</html>