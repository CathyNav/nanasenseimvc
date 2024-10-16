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
        <section role="region" class="signup" aria-labelledby="createaccount">
            <div class="container6">
                <h1 id="createaccount">Créer son compte pour intéragir avec le site</h1>
                <form action="signup" method="post" class="account">
                 
                <div class="line1">
                   <label for="email">Votre adresse mail</label> <br>
                    <input type="email" name="email" class="input" placeholder="Votre adresse mail"><br>
                 </div>
                <div class="line2">  
                    <label for="pseudo">Votre pseudo</label> <br>
                <input type="text" name="pseudo" class="input" placeholder="Votre pseudo"><br>
                    
                </div>
                <div class="line3">
                    <label for="password">Votre mot de passe</label><br>
                    <input type="password" name="password" class="input" placeholder="Mot de passe"><br>
                </div>     
                <div class="line4">
                    <label for="securityQuestion">La question de sécurité</label> <br>
                    <select name="securityQuestion" id="securityQuestion">
                        <option value="manga">Quel est ton premier manga ?</option>
                        <option value="dessin"> Quelle est ta couleur préférée?</option>
                        <option value="animaux">Comment s'appelle ton premier animal de compagnie ?</option>
                    </select><br>
                </div>
                <div class="line5">                    
                <label for="answer">Votre réponse</label><br>
                    <input type="text" name="answer" class="input" placeholder="Votre réponse"><br>
                </div>
                <div class="center">
                    <button class="ctalogin" type="submit">Créer le compte</button>
                </div>
                </form>
                <br>
                <p class="optionco">Déjà un compte ?<a class="optionco" href="login.jsp"> Connecte toi ici !</a></p>
               </div> 
        
        </section>
    </main>
  <%@include file="includes/footer.jsp" %>
</body>
</html>