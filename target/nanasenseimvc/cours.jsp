<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nana-sensei - Les cours</title>
<%@include file="includes/head.jsp" %>
<style type="text/css">
<%@include file="CSS/cours.css"%>
</style>
</head>
<body>
  <%@include file="includes/menu.jsp" %>
   <main role="main">
   <section role="region" class="lescours" aria-labelledby="titrecours">
            <div class="containercours">
                <h2 id="titrecours">Les cours</h2>
                <div class=" grid">
                    
                
                    <p class="textcours">Mes ateliers sont conçus pour initier les participants aux techniques de base du dessin manga,
                     en abordant : <br>
               
                        la création de personnages <br>
                        la narration visuelle<br>
                        l’utilisation des outils spécifiques<br>                    
                    </p>
                    <img class="illustgroup" src="images/Photogroup.png" alt="photo d'illustration du groupe">
                    <p class="textacti">Chaque session sera interactive et adaptée au
                    niveau des participants, permettant ainsi une
                    progression continue et personnalisée. J’aime
                    apporter un côté ludique et divertissant à mes
                    ateliers de telle sorte que les participants
                    repartent avec la satisfaction d’avoir appris et le
                    plaisir d’avoir passé un bon moment</p>
                    <img   class="illustacti" src="images/Photoacti.png" alt="photo d'illustration des activités">
                    <p class="textmap">Des cours collectifs de dessins en présentiel en tant que prestataire dans les centres sociaux et autres lieux
                    proposants de activités à <br>
                    Evry <br>
                    Chatenay Malabry <br>
                    Choisyleroi <br>
                    <br>
                <button type="submit" class="contact"> Pour en savoir plus contacter moi</button>
                </p>
                    <img class="map" src="images/map.png" alt="carte des activités">
                </div>
            </div>
        </section>
        </main>
  <%@include file="includes/footer.jsp" %>
</body>
</html>