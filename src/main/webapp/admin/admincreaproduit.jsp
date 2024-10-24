<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nana-sensei | Création de produits</title>
<%@include file="../includes/head.jsp" %>
<style>
    <%@include file="../CSS/adminboutique.css"%>
    <%@include file="../CSS/menulog.css"%>
    </style>
</head>
<body>
 <%@include file="adminmenu.jsp" %>
<main role="banner">
    <div class="menulog">
        <ul>
            <li ><a href="adminUser.jsp" class="account"> Gestion des utilisateurs</a></li>
            <li ><a href="adminBlog.jsp" class="favoris"> Gestion des articles</a></li>
            <li ><a href="adminboutique.jsp" class="commande">Gestion de la boutique</a></li>
            <li ><a href="adminCours.jsp"class="mescours"> Gestion des cours </a></li>
        </ul>
    </div>
	<div class="container">
	<h1>Ajouter un produit à la boutique</h1>
	<%
int id=1;
try {Connection con= DbCon.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT max(idProduit) from produit");
while(rs.next()){
	id = rs.getInt(1);
	id++;
} 
}catch(Exception e){
	e.printStackTrace();
	System.out.println(e.getMessage());
}

%>
	<form action="../addnewproduct" method="post">
	<label>Product ID : <%out.println(id); %> </label>
<input type="hidden" name="id" value="<%out.println(id); %>">
                <label>Photo de l'article</label>
                <input type="file" id="file" name="image">
                <label> Référence</label>
                <input type="text" name="reference">
                <label>Tags</label>
                <select name="tags">
                    <option value="ebook">#e-book</option>
                    <option value="fanart">#fanart</option>
                    <option value="papeterie">#papeterie</option>
                </select>
                <label>Nom du produit</label>
                <input type="text" name="nom">
                <label>Description du produit</label>
                <textarea rows="5" name="description"></textarea>
                <div class="price">
                <label>Prix</label>
                <input class="price"type="number" name="prix">
                <label>Stock</label>
                <input class="price"type="number" name="stock"></div>
                <button type="submit">Valider</button>
    
            </form>
	</div>
</main>
 <%@include file="includes/footer.jsp" %>
</body>
</html>