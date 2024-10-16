<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nana-sensei - Accueil</title>
    
<%@include file="includes/head.jsp" %>
<style>
    <%@include file="CSS/styleindex.css"%>
    </style>

</head>
<body>
   <%@include file="includes/menu.jsp" %>

    <main role="main">
        <section role="region" class="hero" aria-labelledby="hero-title">
            <div class="hero">
                <div class="text">
                    <p>Envie d’apprendre à dessiner ? <br>
                        Partager ses connaissances avec des passionnées ?<br>
                        Obtenir des design originaux et des ebooks de qualité ?
                    </p>
                    <div class="titre">
                        <div>
                            <h1 id="hero-title">REJOINS NANA-<br> SENSEI  DANS SON<br> UNIVERS</h1>
                        </div>
                        <div class="photopro"><img src="images/photo.png" alt="Photo professionnelle Septime"></div>
                    </div>
                    <div>
                        <button class="btndraw"> Let's Draw</button>
                    </div>
                </div>

                <div class="letsdraw"><img src="images/let'sdraw.png" alt="" ></div>
            </div>
        </section>
        <section role="region" class="lescours" aria-labelledby="titrecours">
            <div class="containercours">
                <h2 id="titrecours"><a href="cours.jsp">Les cours</a></h2>
                <div class="firstline">
                <div class="textcours">Des cours collectifs de dessins en présentiel en tant que prestataire dans les centres sociaux et autres lieux proposants de activités à <br>
                Evry <br> 
                Chatenay Malabry <br>
                Choisyleroi</div>
                <div class="illust"> <img src="images/Photogroup.png" alt="photo d'illustration du groupe"></div>
            </div>
            <div class="secondline">
                <div class="illust"> <img src="images/Photoacti.png" alt="photo d'illustration des activités"></div>
                <div class="map"> <img src="images/map.png" alt="carte des activités"></div>
            </div>
        </div>
        </section>
        <section role="region" class="laboutique" aria-labelledby="titreboutique">
            <div class="containerboutique">
                <h2 id="titreboutique"><a href="/boutique/Boutique.html">La boutique</a></h2>
                <div class="cardproduit">
                <div class="card">
                    <div class="produits"> <img src="images/Rectangle 43.png" alt="photo du produit"></div>
                    <div class="nomproduit">Papeteries</div>
                    <div class="description">Beaucoup de design originaux pour habiller vos documents dans notre rubrique papeterie </div>
                    <div class="prix">A partir de 2,99</div>
                </div>
                <div class="card">
                    <div class="produits"> <img src="images/Rectangle 41.png" alt="photo du produit"></div>
                    <div class="nomproduit">Mon cahier de japonais décontracté</div>
                    <div class="description">J'ai écris un cahier de japonais pour apprendre la langue sans souffrir : des conseils , des leçons faciles, des exercices simples , des jeux , des images... Tout pour te donner envie d'ouvrir ce cahier tous les jours !</div>
                    <div class="prix">15,99€</div>
                </div>
            </div>
            </div>
        </section>
        <section role="region" class="article" aria-labelledby="">
            <div>egfrhjokzsplâqjhgfkp^kjggfld</div>
        </section>
        <section role="region" class="testimonials" aria-labelledby="">
            <div>ezrtgkhlùmfdl;, ndskmlx;,nbekjhoipjamlsq,d;noù:</div>
        </section>
    </main>

   <%@include file="includes/footer.jsp" %>
    
</body>
</html>