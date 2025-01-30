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
    <title>Edition de produit | Nana-sensei</title>
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
            <h1>Modifier un produit</h1>
            <%
            // Get the product ID from the request parameter
            String id = request.getParameter("id");
            try {
                // Establish database connection
                Connection con = DbCon.getConnection();
                // Prepare SQL query to fetch product details
                String query = "SELECT * FROM produit WHERE idProduit = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, id);
                ResultSet rs = pstmt.executeQuery();

                // Iterate through the result set
                while (rs.next()) {
                    // Retrieve product details from the result set
                    String reference = rs.getString("reference");
                    String tags = rs.getString("tags");
                    String nom = rs.getString("nomProduit");
                    String description = rs.getString("descriptionProduit");
                    double prix = rs.getDouble("prixUnitaireProduit");
                    int stock = rs.getInt("stock");
            %>
            <!-- Form to edit product details -->
            <form action="../editproduct" method="post">
                <label>L'ID du produit : <%= id %></label>
                <input type="hidden" name="id" value="<%= id %>">
                <label>Photo du produit</label>
                <input type="file" id="file" name="image" accept=".jpg, .jpeg, .png, .svg, image/jpeg, image/png, image/svg+xml">
                <label>Référence</label>
                <input type="text" name="reference" value="<%= reference %>">
                <label>Tags</label>
                <select name="tags">
                    <option value="ebook" <%= tags.equals("ebook") ? "selected" : "" %>>#e-book</option>
                    <option value="fanart" <%= tags.equals("fanart") ? "selected" : "" %>>#fanart</option>
                    <option value="papeterie" <%= tags.equals("papeterie") ? "selected" : "" %>>#papeterie</option>
                </select>
                <label>Nom du produit</label>
                <input type="text" name="nom" value="<%= nom %>">
                <label>Description du produit</label>
                <textarea rows="5" name="description"><%= description %></textarea>
                <div class="price">
                    <label>Prix</label>
                    <input class="price" type="number" name="prix" value="<%= prix %>">
                    <label>Stock</label>
                    <input class="price" type="number" name="stock" value="<%= stock %>">
                </div>
                <button type="submit">Valider</button>
            </form>
            <%
                }
            } catch (Exception e) {
                // Print any exception message
                System.out.println(e.getMessage());
            }
            %>
        </div>
    </main>
    <!-- Include footer -->
    <%@include file="includes/footer.jsp" %>
</body>
</html>
