<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nana-sensei - Les cours</title>
    <!-- Include common head elements -->
    <%@include file="includes/head.jsp" %> 
    <!-- Include CSS specific to this page -->
    <style>
        <%@include file="CSS/cours.css"%> 
    </style>
</head>
<body>
<!-- Include navigation menu -->
    <%@include file="includes/menu.jsp" %> 
    <main>
        <section class="lescours">
            <div class="containercours">
                <h1>Les cours</h1>
                <!-- First section: Course description -->
                <div class="line">
                    <div class="textcours">
                        <p>Mes ateliers sont conçus pour initier les participants aux techniques de base du dessin manga, en abordant :</p>
                        <ul>
                            <li>la création de personnages</li>
                            <li>la narration visuelle</li>
                            <li>l'utilisation des outils spécifiques</li>
                        </ul>
                    </div>
                    <img class="illustgroup" src="images/Photogroup.png" alt="Groupe de participants à un atelier de dessin manga">
                   </div>
                   <!-- Second section: Activity details -->
                   <div class="line">
                   <img class="illustacti" src="images/Photoacti.png" alt="Illustration des activités proposées pendant les ateliers">
                    <p class="textacti">Chaque session sera interactive et adaptée au niveau des participants, permettant ainsi une progression continue et personnalisée. J'aime apporter un côté ludique et divertissant à mes ateliers de telle sorte que les participants repartent avec la satisfaction d'avoir appris et le plaisir d'avoir passé un bon moment.</p>
                    </div>
                    <!-- Third section: Course locations and contact button -->
                    <div class="line">
                    <div class="textmap">
                        <p>Des cours collectifs de dessins en présentiel en tant que prestataire dans les centres sociaux et autres lieux proposants des activités à :</p>
                        <ul>
                            <li>Evry</li>
                            <li>Chatenay Malabry</li>
                            <li>Choisy-le-Roi</li>
                        </ul>
                        <button type="button" class="contact">Pour en savoir plus, contactez-moi</button>
                    </div>
                    <img class="map" src="images/map.png" alt="Carte des lieux où se déroulent les activités">
                </div>
            </div>
        </section>
    </main>
    <!-- Include footer -->
    <%@include file="includes/footer.jsp" %> 
</body>
</html>
