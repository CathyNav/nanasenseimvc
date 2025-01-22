<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nana-sensei | Création de produits</title>
<!-- Include common head content -->
<%@include file="../includes/head.jsp" %>
<!-- Include CSS styles for this page -->
<style>
    <%@include file="../CSS/adminboutique.css"%>
    <%@include file="../CSS/menulog.css"%>
    </style>
</head>
<body>
<!-- Include admin menu -->
 <%@include file="adminmenu.jsp" %>
<main role="banner">
 <!-- Admin navigation menu -->
    <div class="menulog">
        <ul>
            <li ><a href="adminUser.jsp" class="account"> Gestion des utilisateurs</a></li>
            <li ><a href="adminBlog.jsp" class="favoris"> Gestion des articles</a></li>
            <li class="commande"><a href="adminboutique.jsp" class="commande">Gestion de la boutique</a></li>
            <li ><a href="adminCours.jsp"class="mescours"> Gestion des cours </a></li>
        </ul>
    </div>
	<div class="container">
	<h1>Ajouter un produit à la boutique</h1>
<!-- 	Process of generating a new product ID -->
	<%
int id=1;
try {
	Connection con= DbCon.getConnection();
	String query = "SELECT max(idProduit) from produit;";
	PreparedStatement pst = con.prepareStatement(query);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
	id = rs.getInt(1);
	id++;
	} 
	}catch(Exception e){
	e.printStackTrace();
	System.out.println(e.getMessage());
	}
	%>
<!-- 	form for adding a new product -->
	<form action="../addnewproduct" method="post">
	<label>Product ID : <%out.println(id); %> </label>
	<input type="hidden" name="id" value="<%out.println(id); %>">
                <label>Photo du produit</label>
               <input type="file" id="file" name="image" accept=".jpg, .jpeg, .png, .svg, image/jpeg, image/png, image/svg+xml">
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
<!-- Include footer -->
 <%@include file="includes/footer.jsp" %>
</body>
</html>