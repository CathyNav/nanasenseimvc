<%-- Import necessary Java classes --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.nanasenseimvc.dao.ProductDao"%>
<%@page import="com.nanasenseimvc.model.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%-- Set the page language and character encoding --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nana-sensei | La boutique</title>
    <%-- Include the head.jsp file --%>
    <%@include file="includes/head.jsp" %>
    <%-- Include the CSS file for the boutique page --%>
    <style type="text/css">
    <%@include file="CSS/boutique.css"%>
    </style>
</head>
<body>
    <%-- Include the menu.jsp file --%>
    <%@include file="includes/menu.jsp" %>
    <h1 id="boutique">Bienvenue sur la boutique de Nana-sensei !</h1>

    <%-- Search form and shopping cart link --%>
    <div class="search-container">
        <div class="barresearch">
            <form action="searchproduct" method="post">
                <input id="recherche" type="text" placeholder="Rechercher un article" name="search">
                <button id="recherche" type="submit"><img src="images/loupe.png" alt="" width="30px" height="30px"></button>
            </form>   
            <div><a href="panier.jsp">
                <img class="panier" src="images/panier.png" alt="" width="40px" height="40px" >
            </a></div>
        </div>
    </div>
    
    <section role="region">
        
        <%
        // Initialize variables for product display
        List<Product> productsToDisplay = new ArrayList<>();
        String searchTerm = (String) request.getAttribute("searchTerm");
        List<Product> searchResults = (List<Product>) request.getAttribute("searchResults");

        // Check if there are search results
        if (searchResults != null) {
            productsToDisplay = searchResults;
            if (!searchResults.isEmpty()) {
                %><h2>Résultats de recherche pour "<%= searchTerm %>"</h2> <br><%
            } else {
                %><p>Aucun résultat trouvé pour "<%= searchTerm %>"</p><%
            }
        } else {
            // If no search results, display all products
            ProductDao productDao = new ProductDao(DbCon.getConnection());
            productsToDisplay = productDao.getAllProducts();
        }%>
        <article role="article">
		<% 
        // Display products
        if(!productsToDisplay.isEmpty()) {
            for(Product p : productsToDisplay) {%>
            
                <div class="productcard"><a href="productboutique.jsp?id=<%=p.getId() %>">
                    <div class="photocard">
                        <img src="images/<%=p.getImage()%>" alt="">
                    </div>
                    <h2 class="nomproduit"> <%=p.getName() %></h2>
                    <p class="descriptionproduit"> <%=p.getCategory() %></p>
                    <p class="prix"><%=p.getPrice() %> €</p>
                </a></div>
                 
            <% }
        } else {
            %><p>Aucun produit disponible.</p><%
        }
        %>
       </article>
    </section>

    <%-- Include the footer.jsp file --%>
    <%@include file="includes/footer.jsp" %>
</body>
</html>
