<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
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
            <li ><a href="adminBoutique.jsp" class="commande">Gestion de la boutique</a></li>
            <li ><a href="adminCours.jsp"class="mescours"> Gestion des cours </a></li>
        </ul>
    </div>

</main>
 <%@include file="includes/footer.jsp" %>
</body>
</html>