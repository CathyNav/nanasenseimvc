<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nana-sensei - Connexion</title>
 
<%@include file="includes/head.jsp" %>
<style>
    <%@include file="CSS/connexion.css"%>
    </style>
</head>
<body>
  <%@include file="includes/menu.jsp" %>
   <main role="main">
        <section role="region" class="login" aria-labelledby="connection">
            <div class="container6">
                <h1 id="connection">Se connecter</h1>
                <form action="userlogin" method="post">
                <label for="login-email">Adresse mail</label> <br>
                <input type="email" name="login-email" class="input" placeholder="Adresse mail"><br>
                <label for="login-password">Mot de passe</label><br>
                <input type="password" name="login-password" class="input" placeholder="Mot de passe"><br>
                <button class="ctalogin" type="submit">Se connecter</button>
            </form>
            <br>
            <p class="optionco">Mot de passe oublié ?<a class="optionco" href="forgotpassword.jsp"> C'est ici !</a></p>
            <p class="optionco">Pas encore de compte ?<a class="optionco" href="signup.jsp"> Rejoins la communauté ici !</a></p>
            </div>

        </section>
       
    </main>
  <%@include file="includes/footer.jsp" %>
</body>
</html>