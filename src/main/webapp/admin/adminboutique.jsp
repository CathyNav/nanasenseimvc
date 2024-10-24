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
<title>Gestion de la boutique | Nana-sensei</title>
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
            <li class="account"><a href="adminUser.jsp" class="account"> Gestion des utilisateurs</a></li>
            <li ><a href="adminBlog.jsp" class="favoris"> Gestion des articles</a></li>
            <li ><a href="adminboutique.jsp" class="commande">Gestion de la boutique</a></li>
            <li ><a href="adminCours.jsp"class="mescours"> Gestion des cours </a></li>
        </ul>
    </div>
    	<div class="container">
	<h1>Gestion de la boutique</h1>
	<!--<div class="order">
	<h2>Liste des commandes</h2>
	<table>
	<thead>
	<tr>
	<th scope="col">Pseudo</th>
	<th scope="col">Mail</th>
	<th scope="col">Nom</th>
	<th scope="col">Prénom</th>
	<th scope="col">Adresse postale</th>
	<th scope="col">Code postale</th>
	<th scope="col">Ville</th>
	<th scope="col">Pays</th>
	<th scope="col">Téléphone</th>
	</tr>
	</thead>
	<tbody>
	<% 
	try{
	Connection con= DbCon.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT * from view_usersadmin");
	while(rs.next()){
	%>
	
<tr>
	<td scope="col"><%=rs.getString(1) %></td>
	<td scope="col"><%=rs.getString(2) %></td>
	<td scope="col"><%=rs.getString(3) %></td>
	<td scope="col"><%=rs.getString(4) %></td>
	<td scope="col"><%=rs.getString(5) %></td>
	<td scope="col"><%=rs.getString(6) %></td>
	<td scope="col"><%=rs.getString(7) %></td>
	<td scope="col"><%=rs.getString(8) %></td>
	<td scope="col"><%=rs.getString(9) %></td>
	</tr>
	<%
	}
} catch (Exception e){
System.out.println(e.getMessage());
}
%>
	</tbody>
	
	</table>
	</div>-->
	<div class="produit">
	<div class="titre">
	<h2>Gestion des produits </h2>
	
	<div><a href="admincreaproduit.jsp"><i class="fa-solid fa-circle-plus"></i> Ajouter un nouveau produit</a></div></div>
	<table>
	<thead>
	<tr>
	<th scope="col">Référence</th>
	<th scope="col">Tags</th>
	<th scope="col">Illustration du produit</th>
	<th scope="col">Nom du produit</th>
	<th scope="col">Description du produit</th>	
	<th scope="col">Prix</th>
	<th scope="col">Stock</th>
	<th scope="col">Modifier</th>
	<th scope="col">Supprimer</th>
	</tr>
	</thead>
	<tbody>
	<% 
	try{
	Connection con= DbCon.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT * from produit");
	while(rs.next()){
	%>
	
<tr>
	<td scope="col"><%=rs.getString(2) %></td>
	<td scope="col"><%=rs.getString(8) %></td>
	<td scope="col"><%=rs.getString(3) %></td>
	<td scope="col"><%=rs.getString(4) %></td>
	<td scope="col"><%=rs.getString(5) %></td>
	<td scope="col"><%=rs.getString(6) %></td>
	<td scope="col"><%=rs.getString(7) %></td>
	<td scope="col"><a href="editproduct.jsp?id=<%=rs.getString(1)%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
	<td scope="col"><a href="../deleteproduct?id=<%=rs.getString(1)%>"><i class="fa-solid fa-trash-can"></i></a></td>
	</tr>
	<%
	}
} catch (Exception e){
System.out.println(e.getMessage());
}
%>
	</tbody>
	
	</table>
	</div>
	
	</div>
</main>
 <%@include file="includes/footer.jsp" %>
</body>
</html>