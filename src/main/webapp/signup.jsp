<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<!-- Set character encoding and viewport for responsive design -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nana-sensei - Connexion</title>

<!-- Include common head elements -->
<%@include file="includes/head.jsp" %>
<!-- Include CSS styles for this page -->
 <style>
    <%@include file="CSS/connexion.css"%>
    </style>
</head>
<body>
  <!-- Include navigation menu -->
  <%@include file="includes/menu.jsp" %>
      <main role="main">
        <!-- Sign-up section with ARIA attributes for accessibility -->
        <section role="region" class="signup" aria-labelledby="createaccount">
            <div class="container6">
                <h1 id="createaccount">Créer son compte pour intéragir avec le site</h1>
                <!-- Sign-up form -->
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
                    <!-- Dropdown for security question selection -->
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
                <!-- Link to login page for existing users -->
                <p class="optionco">Déjà un compte ?<a class="optionco" href="login.jsp"> Connecte toi ici !</a></p>
               </div> 
        
        </section>
    </main>
  <!-- Include footer -->
  <%@include file="includes/footer.jsp" %>
</body>
</html>
