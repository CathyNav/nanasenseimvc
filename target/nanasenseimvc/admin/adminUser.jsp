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
<title>Nana-sensei | User Management</title>

<!-- Include common head elements -->
<%@include file="../includes/head.jsp" %>
<!-- Include CSS styles for this page -->
<style>
    <%@include file="../CSS/adminUserCss.css"%>
    <%@include file="../CSS/menulog.css"%>
</style>
</head>
<body>
<!-- Include admin menu -->
<%@include file="adminmenu.jsp" %>
<main role="banner">
    <!-- Side navigation menu for admin management sections -->
    <div class="menulog">
        <ul>
            <li class="account"><a href="adminUser.jsp" class="account"> Gestion des utilisateurs</a></li>
            <li ><a href="adminBlog.jsp" class="favoris"> Gestion des articles</a></li>
            <li ><a href="adminboutique.jsp" class="commande">Gestion de la boutique</a></li>
            <li ><a href="adminCours.jsp"class="mescours"> Gestion des cours </a></li>
        </ul>
    </div>
    <!-- Main container for user management -->
    <div class="container6">
        <h1>Gestion des utilisateur</h1>
        <!-- Table to display user information -->
        <table>
            <thead>
                <tr>
                    <th scope="col">Pseudo</th>
                    <th scope="col">Email</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Adresse postale</th>
                    <th scope="col">Code postale</th>
                    <th scope="col">Ville</th>
                    <th scope="col">Pays</th>
                    <th scope="col">téléphone</th>
                </tr>
            </thead>
            <tbody>
            <!-- Fetch and display user data from the database -->
            <% 
            try {
                // Establish a connection to the database
                Connection con = DbCon.getConnection();
                Statement st = con.createStatement();
                // Execute a query to retrieve user data from the view
                ResultSet rs = st.executeQuery("SELECT * from view_usersadmin");
                while (rs.next()) {
            %>
            <!-- Populate table rows with user data -->
            <tr>
                <td scope="col"><%= rs.getString(1) %></td> <!-- Username -->
                <td scope="col"><%= rs.getString(2) %></td> <!-- Email -->
                <td scope="col"><%= rs.getString(3) %></td> <!-- Last Name -->
                <td scope="col"><%= rs.getString(4) %></td> <!-- First Name -->
                <td scope="col"><%= rs.getString(5) %></td> <!-- Postal Address -->
                <td scope="col"><%= rs.getString(6) %></td> <!-- Postal Code -->
                <td scope="col"><%= rs.getString(7) %></td> <!-- City -->
                <td scope="col"><%= rs.getString(8) %></td> <!-- Country -->
                <td scope="col"><%= rs.getString(9) %></td> <!-- Phone Number -->
            </tr>
            <% 
            }
            } catch (Exception e) {
                // Handle exceptions and print error messages
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
