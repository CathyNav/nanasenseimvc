<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nana-sensei - Gestion User</title>
<%@include file="../includes/head.jsp" %>
<style>
    <%@include file="../CSS/menulog.css"%>
    <%@include file="../CSS/adminUserCss.css"%>
    </style>
</head>
<body>
 <%@include file="adminmenu.jsp" %>
<main role="banner">
    <div class="menulog">
        <ul>
            <li ><a href="adminUser.jsp" class="account"> Gestion des utilisateurs</a></li>
            <li ><a href="adminBlog.jsp" class="favoris"> Gestion des articles</a></li>
            <li ><a href="adminBoutique.jsp" class="commande">Gestion de la boutique</a></li>
            <li ><a href="adminCours.jsp"class="mescours"> Gestion des cours </a></li>
        </ul>
    </div>
	<div class="container6">
	<h1>Gestion des utilisateurs</h1>
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
	</div>
</main>
 <%@include file="includes/footer.jsp" %>
</body>
</html>