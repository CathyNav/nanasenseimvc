<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nana-sensei - Mot de passe oublié</title>
 
<%@include file="includes/head.jsp" %>
<style>
    <%@include file="CSS/connexion.css"%>
    </style>
</head>
<body>
<%@include file="includes/menu.jsp" %>
<main role="banner">
	<section role="region" aria-labelby="forgotpassword">
   <div class="container6">
                <h1 id="forgotpassword">Mot de passe oublié</h1>
                <form action="forgotpassword" method="post">
                 
                <div class="line1">
                 <label for="email">Votre adresse mail</label> <br>   
                    <input type="email" name="email" class="input" placeholder="Votre adresse mail" required><br>
                 </div>
                <div class="line2">  
                    <label for="password">Votre nouveau mot de passe</label><br>
<!--                     <label for="passwordconfirmation">Confirmer votre nouveau mot de passe</label><br> -->                    
                   <input type="password" name="newPassword" class="input" placeholder="Nouveau mot de passe" required><br>
<!--                    <input type="password" name="passwordconfirmation" class="input" placeholder="Mot de passe" required><br> -->
                </div>     
                <div class="line3">
                    <label for="securityQuestion">La question de sécurité</label> <br>
             
                    <select name="securityQuestion" id="securityQuestion"> 
                    <option value="manga">Quel est ton premier manga ?</option>
                    <option value="dessin"> Quelle est ta couleur préférée?</option>
                    <option value="animaux">Comment s'appelle ton premier animal de compagnie ?</option>
                    </select><br>
                     </div>
                       <div class="line4">
                    <label for="answer">Votre réponse</label><br>
                    <input type="text" name="answer" class="input" placeholder="Votre réponse" required><br>
                </div>
                  <div class="center">
                    <button class="ctalogin" type="submit">Modifier le mot de passe</button>
                </div>
                </form>
                </div>
                </section>
</main>
</body>
</html>