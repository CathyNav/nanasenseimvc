<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nana-sensei - Mon compte</title>
 
<%@include file="includes/head.jsp" %>
<style>
    <%@include file="CSS/connexion.css"%>
    <%@include file="CSS/menulog.css"%>
    
    </style>
</head>
<body>
<%@include file="includes/menu.jsp" %>
  <main role="main">
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
        <form action="forgetpassword" method="post">
        <label for="newpassword">Nouveau mot de passe</label><br>
        <input type="password" name="newpassword" placeholder="Nouveau mot de passe"><br>
        <label for="confirmation">Confirmation du mot de passe</label><br>
        <input type="password"name="confirmation" placeholder="Confirmation"><br>
        <button type="submit" class="ctalogin">Modifier</button>
    </form>
    </div>
</article>
<article>
        <h2>Informations de facturation</h2>
        <form action="clientupdatedata" method="post">
        <input name="id" type= "hidden" value="<%auth.getId();%>">
        <div class="infochange">        
        <div class="line1">
            <label for="nom">Votre nom</label><br>
            <input type="text" name="nom" value="" placeholder="Votre nom " required><br>
            </div>
            <div class="line2">
            <label for="prenom">Votre prénom</label><br>
            <input type="text" name="prenom" value="" placeholder="Votre prenom " required><br>
            </div>
            <div class="line3">
            <label for="mail">Votre mail</label><br>
            <input type="email" name="mail" value="<%=auth.getEmail() %>" placeholder="Votre mail " required><br>
            </div>
            <div class="line4">
            <label for="adresse">Votre adresse postale</label><br>
            <input type="text" name="adresse" value="" placeholder="Votre adresse postale " required><br>
            </div>
            <div class="line5">
            <label for="cp">Votre code postal</label><br>
            <input type="text" name="cp" value="" placeholder="Code postal " required><br>
            </div>
            <div class="line6">
            <label for="ville">Votre ville</label><br>
            <input type="text" name="ville" value="" placeholder="Votre ville " required><br>
            </div>
            <div class="line7">
            <label for="pays">Votre pays</label><br>
            <input type="text" name="pays" value="" placeholder="Votre pays "><br>
            </div>
            <div class="line8">
            <label for="tel">Votre numéro de téléphone</label><br>            
            <input type="tel" name="tel" value="" placeholder="numéro de téléphone " required><br>
            </div>
            </div>
            <button type="submit" class="ctalogin">Modifier</button>
        </form>
        </article>
       	<a type="submit" class="supress" href="deleteaccount">Supprimer mon compte</a>

    </section>
    </main>
       <%@include file="includes/footer.jsp" %>
</body>
</html>