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
<title>Gestion de la boutique | Nana-sensei</title>
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
<main role="main">
 <!-- Admin navigation menu -->
    <div class="menulog">
        <ul>
            <li class="account"><a href="adminUser.jsp" class="account"> Gestion des utilisateurs</a></li>
            <li ><a href="adminBlog.jsp" class="favoris"> Gestion des articles</a></li>
            <li class="commande"><a href="adminboutique.jsp" class="commande">Gestion de la boutique</a></li>
            <li ><a href="adminCours.jsp"class="mescours"> Gestion des cours </a></li>
        </ul>
    </div>
    	<div class="container">
	<h1>Gestion de la boutique</h1>
	
	<h2>Gestion des produits </h2>
	<!-- Button to add a new product -->
	<div>
	<a href="admincreaproduit.jsp" class="addproduct"><i class="fa-solid fa-circle-plus"></i> Ajouter un nouveau produit</a>
	</div>
	    <!-- Table to display products -->
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
		 // Establish database connection
	Connection con= DbCon.getConnection();
	 // SQL query to select all products
	 String query = "SELECT * from produit";	
	PreparedStatement pst = con.prepareStatement(query);
	ResultSet rs=pst.executeQuery();
	 // Loop through each product in the result set
	while(rs.next()){
	%>
	<!-- Display product information in table rows -->
<tr>
	<td scope="col"><%=rs.getString(2) %></td>
	<td scope="col"><%=rs.getString(8) %></td>
	<td scope="col"><%=rs.getString(3) %></td>
	<td scope="col"><%=rs.getString(4) %></td>
	<td scope="col" class="elipse"><%=rs.getString(5) %></td>
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
</main>
<!-- Include footer -->
 <%@include file="includes/footer.jsp" %>
</body>
</html>