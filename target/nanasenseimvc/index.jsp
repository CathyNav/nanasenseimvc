<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nana-sensei | Accueil</title>
    
<!-- Include head.jsp file -->
<%@include file="includes/head.jsp" %>

<!-- Include CSS files -->
<style>
    <%@include file="CSS/styleindex.css"%>  
	<%@include file="CSS/styleIndexMobile.css"%>  
</style>

</head>
<body>
<!-- Include menu.jsp file -->
   <%@include file="includes/menu.jsp" %>

    <main role="main">
    <!-- Hero section -->
        <section role="region" class="hero" aria-labelledby="hero-title">
        
            <div class="hero">
                <div class="text">
                    <p>Envie d’apprendre à dessiner ? <br>
                        Partager ses connaissances avec des passionnées ?<br>
                        Obtenir des design originaux et des ebooks de qualité ?
                    </p>
                    <div class="titrehero">
                        <div>
                            <h1 id="hero-title">REJOINS NANA-<br> SENSEI  DANS SON<br> UNIVERS</h1>
                        </div>
                        <div class="photopro"><img src="images/photo.png" alt="Photo professionnelle Septime"></div>
                    </div>
                    <div>
                    <!-- Button to redirect to boutique.jsp -->
                        <button class="btndraw" onclick="window.location.href='boutique.jsp'"> Let's Draw</button>
                    </div>
                </div>

                <div class="letsdraw"><img src="images/let'sdraw.png" alt="" ></div>
            </div>
        </section>
        <!-- Cours section -->
        <section role="region" class="lescours" aria-labelledby="titrecours">
            <div class="containercours">
                <h2 id="titrecours"><a href="cours.jsp">Les cours</a></h2>
                <div class="firstline">
                <div class="textcours">Des cours collectifs de dessins en présentiel en tant que prestataire 
                dans les centres sociaux et autres lieux proposants de activités à <br>
                Evry <br> 
                Chatenay Malabry <br>
                Choisyleroi</div>
                <div class="illust"> <img src="images/Photogroup.png" alt="photo d'illustration du groupe"></div>
            </div>
        </div>
        </section>
         <!-- Shop section -->
        <section role="region" class="laboutique" aria-labelledby="titreboutique">
            <div class="containerboutique">
                <h2 id="titreboutique"><a href="boutique.jsp">La boutique</a></h2>
           <article role="article">
<%ProductDao prod = new ProductDao(DbCon.getConnection());
List<Product> product = prodd.getAllProducts();
// Check if the products list is not empty
if(!products.isEmpty()){
    // Initialize a counter to keep track of displayed products
    int count = 0;
    // Iterate through each product in the products list
    for(Product p : products){
        // Check if we have displayed less than 3 products
        if(count < 3) {
%>
    <!-- Start of product card HTML structure -->
    <div class="productcard">
        <!-- Link to the product detail page -->
        <a href="productboutique.jsp?id=<%=p.getId()%>">
            <!-- Container for the product image -->
            <div class="photocard">
                <!-- Display the product image -->
                <img src="images/<%=p.getImage()%>" alt="">
            </div>
            <!-- Display the product name -->
            <h2 class="nomproduit"><%=p.getName()%></h2>
            <!-- Display the product category -->
            <p class="descriptionproduit"><%=p.getCategory()%></p>
        </a>
    </div>
    <!-- End of product card HTML structure -->
<%
            // Increment the counter after displaying a product
            count++;
        } else {
            // If we've already displayed 3 products, exit the loop
            break;
        }
    }
}
%>
</article>
            </div>
        </section>
       
    </main>
<!-- Include footer.jsp file -->
   <%@include file="includes/footer.jsp" %>
    
</body>
</html>