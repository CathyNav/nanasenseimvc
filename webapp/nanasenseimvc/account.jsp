<%@page import="com.nanasenseimvc.controller.ClientUpdateDataServlet"%>
<%@page import="com.nanasenseimvc.dao.ClientDao"%>
<%@page import="com.nanasenseimvc.model.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nana-sensei - Mon compte</title>
<!-- Include common head elements --> 
<%@include file="includes/head.jsp" %>
<!-- Include CSS styles -->
<style>
    <%@include file="CSS/connexion.css"%>
    <%@include file="CSS/menulog.css"%>
    </style>
</head>
<body>
<!-- Include navigation menu -->
<%@include file="includes/menu.jsp" %>
  <main role="main">
  <!-- Side navigation menu for account-related pages -->
    <div class="menulog">
        <ul>
            <li ><a href="account.jsp" class="account"> Mes données personnelles</a></li>
            <li ><a href="mesfavoris.jsp" class="favoris">Mes articles favoris</a></li>
            <li ><a href="mescommandes.jsp" class="commande">Mes commandes</a></li>
            <li ><a href="mescours.jsp"class="mescours">Mes cours </a></li>
        </ul>
    </div>
    <section role="region" class="container61" aria-labelledby="donneepersonnelle">
    <article>
    <h1 id="donneepersonnelle">Mes données personnelles</h1>
        <div class="mdpchange">
        <h2>Modifier le mot de passe</h2>
        <!-- Form for changing password -->
        <form action="forgetpassword" method="post">
        <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}"/>
        <label class="label" for="newpassword">Nouveau mot de passe</label><br>
        <input type="password" name="newpassword" placeholder="Nouveau mot de passe"><br>
        <label class="label" for="confirmation">Confirmation du mot de passe</label><br>
        <input type="password"name="confirmation" placeholder="Confirmation"><br>
        <button type="submit" class="ctalogin">Modifier</button>
    </form>
    </div>
</article>
<article>
        <h2>Informations de facturation</h2>
        <!-- Check if client data is available -->
<%  Client clientData = (Client)request.getAttribute("clientData"); 
    if(clientData != null) { %>
    <!-- Form for updating client information  -->
    <form action="clientupdatedata" method="post">
    <!-- Form fields for client data (pre filled-->
        <div class="line1">
        <input type=hidden name="id" value="<%=auth.getId() %>">
            <label class="label" for="nom">Votre nom</label><br>
            <input type="text" name="nom" value="<%= clientData.getNom() %>" placeholder="Votre nom" required><br>
        </div>
        <div class="line2">
            <label class="label" for="prenom">Votre prénom</label><br>
            <input type="text" name="prenom" value="<%= clientData.getPrenom() %>" placeholder="Votre prenom" required><br>
        </div>
        <div class="line3">
            <label class="label" for="mail">Votre mail</label><br>
            <input type="email" name="mail" value="<%= auth.getEmail()%>" placeholder="Votre mail" required><br>
        </div>
        <div class="line4">
            <label class="label" for="adresse">Votre adresse postale</label><br>
            <input type="text" name="adresse" value="<%= clientData.getAdressePostale() %>" placeholder="Votre adresse postale" required><br>
        </div>
        <div class="line5">
            <label class="label" for="cp">Votre code postal</label><br>
            <input type="text" name="cp" value="<%= clientData.getCp() %>" placeholder="Code postal" required><br>
        </div>
        <div class="line6">
            <label class="label" for="ville">Votre ville</label><br>
            <input type="text" name="ville" value="<%= clientData.getVille() %>" placeholder="Votre ville" required><br>
        </div>
        <div class="line7">
            <label class="label" for="pays">Votre pays</label><br>
            <input type="text" name="pays" value="<%= clientData.getPays() %>" placeholder="Votre pays"><br>
        </div>
        <div class="line8">
            <label class="label" for="tel">Votre numéro de téléphone</label><br>            
            <input type="tel" name="tel" value="<%= clientData.getTelephone() %>" placeholder="numéro de téléphone" required><br>
        </div>
        <button type="submit" class="ctalogin">Modifier</button>
    </form>
<% } else { %>
     <form class="formUp" action="clientupdatedata" method="post">
     <!-- Form for updating client information (empty fields) -->
      <input type=hidden name="id" value="<%=auth.getId() %>">
        <div class="line1">
            <label class="label" for="nom">Votre nom</label><br>
            <input type="text" name="nom" value="" placeholder="Votre nom" required><br>
        </div>
        <div class="line2">
            <label class="label" for="prenom">Votre prénom</label><br>
            <input type="text" name="prenom" value="" placeholder="Votre prenom" required><br>
        </div>
        <div class="line3">
            <label class="label" for="mail">Votre mail</label><br>
            <input type="email" name="mail" value="<%= auth.getEmail()%>" placeholder="Votre mail" required><br>
        </div>
        <div class="line4">
            <label class="label" for="adresse">Votre adresse postale</label><br>
            <input type="text" name="adresse" value="" placeholder="Votre adresse postale" required><br>
        </div>
        <div class="line5">
            <label class="label" for="cp">Votre code postal</label><br>
            <input type="text" name="cp" value="" placeholder="Code postal" required><br>
        </div>
        <div class="line6">
            <label class="label" for="ville">Votre ville</label><br>
            <input type="text" name="ville" value="" placeholder="Votre ville" required><br>
        </div>
        <div class="line7">
            <label class="label" for="pays">Votre pays</label><br>
            <input type="text" name="pays" value="" placeholder="Votre pays"><br>
        </div>
        <div class="line8">
            <label class="label" for="tel">Votre numéro de téléphone</label><br>            
            <input type="tel" name="tel" value="" placeholder="numéro de téléphone" required><br>
        </div>
        <button type="submit" class="ctaloginup">Modifier</button>
    </form>
<% } %>
        </article>
        <!-- Link to delete account -->
       	<a type="submit" class="supress" href="deleteaccount?id=<%=auth.getId()%>">Supprimer mon compte</a>
    </section>
    </main>
    <!-- Include footer -->
       <%@include file="includes/footer.jsp" %>
</body>
</html>