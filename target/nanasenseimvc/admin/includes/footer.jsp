<!-- Footer section of the website --> 
<footer role="contentinfo" id="footer"> 
	<div class="footer">
 		<!-- Logo section with link to homepage --> 
 		<div class="logo"> <a href="index.jsp"> <img src="../images/logo.png" alt="Logo Nana-sensei" width="150" height="150"> </a> </div>
    		<!-- Footer navigation menu -->
   	<nav aria-label="Menu de pied de page" id="navfooter">
        <ul>
            <li class="menu"><a href="cours.jsp">Cours</a></li>
            <li class="menu"><a href="boutique.jsp">Boutique</a></li>
            <li class="menu"><a href="blog.jsp">Blog</a></li>
            <li class="menu"><a href="/Contact/contact.html">Contact</a></li>
        </ul>
    </nav>
    
    <!-- Social media links -->
    <div class="rs">
        <a href="https://www.instagram.com/koisandrawing/" aria-label="Instagram de Nana-sensei">
            <img src="../images/icons8-instagram-48.png" alt="" width="44" height="44">
        </a>
        <a href="https://www.tiktok.com/@koisandrawing?_t=8nzbH4Lb6Aq&_r=1" aria-label="TikTok de Nana-sensei">
            <img src="../images/icons8-tic-tac-50.png" alt="" width="44" height="44">
        </a>
        <a href="https://www.redbubble.com/fr/people/Koi-san/shop?utm_source=rb-native-app&utm_campaign=share-artist&utm_medium=android" aria-label="Boutique Redbubble de Nana-sensei">
            <img src="../images/icons8-redbubble-a-global-online-marketplace-for-print-on-demand-products-based-on-user-submitted-artwork-48.png" alt="" width="44" height="44">
        </a>
    </div>
    
    <!-- Menu users-->
    <div>
        <a href="<%= request.getContextPath() %>/admin/adminHome.jsp">Menu admin</a>
    </div>
</div>

<!-- Legal information and links -->
<p class="legal">
    &copy; 2024 Nana-sensei | Tous droits réservés | 
    <a href="<%= request.getContextPath() %>/mentionslegales.jsp">Mentions légales</a> | 
    <a href="#">Conditions générales de vente</a> | 
    <a href="#">Politique de confidentialité</a>
</p>
</footer>
<script>
<%@ include file = "../../JavaScript/menu.js"%>
</script>