<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<!-- Set the character encoding and viewport for responsive design -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nana-sensei - Connexion</title> 
<!-- Include the head.jsp file which likely contains common head elements -->
<%@include file="includes/head.jsp" %>
<!-- Include the CSS file for styling -->
<style>
    <%@include file="CSS/connexion.css"%>
</style>
</head>
<body>
  <!-- Include the menu.jsp file which likely contains the navigation menu -->
  <%@include file="includes/menu.jsp" %>
   <main>
        <section class="login">
            <div class="container6">
                <h1>Se connecter</h1>
                <!-- Login form -->
                <form action="userlogin" method="post">
                    <div class="line">
                        <!-- Email input field -->
                        <label class="labels" for="login-email">Adresse mail</label>
                        <input type="email" id="login-email" name="login-email" class="inputco" required aria-required="true">
                    </div>
                    <div class="line">
                        <!-- Password input field -->
                        <label class="labels" for="login-password">Mot de passe</label>
                        <input type="password" id="login-password" name="login-password" class="inputco" required aria-required="true">
                    </div>                      
                    <!-- Submit button -->
                    <button class="ctalogin" type="submit">Se connecter</button>
                </form>
                <!-- Link to forgot password page -->
                <p class="optionco">Mot de passe oublié ? <a href="forgotpassword.jsp">C'est ici !</a></p>
                <!-- Link to sign up page -->
                <p class="optionco">Pas encore de compte ? <a href="signup.jsp">Rejoins la communauté ici !</a></p>
            </div>
        </section>
    </main>
  <!-- Include the footer.jsp file -->
  <%@include file="includes/footer.jsp" %>
</body>
</html>
