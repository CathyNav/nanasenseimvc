<%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="com.nanasenseimvc.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.nanasenseimvc.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%//je rajoute ma liste de produits
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
  //je crée un panier de produit
  List<Cart> cartProduct = null;
  double total=0;
  //si ma liste n'est pas nulle
  if(cart_list != null){
  	//je récupère ma connexion
  	ProductDao pDao = new ProductDao(DbCon.getConnection());
  	cartProduct = pDao.getCartProducts(cart_list);	
  	//je calcule le total des produits de ma liste
  	//total = pDao.getTotalCartPrice(cart_list);
  	//request.setAttribute("total", total);
  	request.setAttribute("cart_list", cart_list);
  } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panier | Nana-sensei </title>
<%@include file="includes/head.jsp" %>
<style type="text/css">
<%@include file="CSS/boutique.css"%>
</style>
</head>
<body>
 <%@include file="includes/menu.jsp" %>
 <div> <a href="boutique.jsp" class="back"><i class="fa-solid fa-angles-left"></i> Retour </a></div>
<h1 id="panier">Votre panier</h1>

<div class="produit"><% 
if(cart_list!=null){
	for (Cart c:cartProduct){
        out.println("quantity ok");
%>
   <hr>
    <div class="cartproduct"> 
    <input type="hidden" name="id" value="<%=c.getId()%>">
        <div><input type="checkbox"></div>
        <div> <img class="photoproduct" src="/images/<%=c.getImage() %>" alt=""></div>
        <div >
            <div><h2 class="nomproduit"><%=c.getName() %></h2></div>
            <div class="infoproduit">
                <div><p class="price"><%=c.getQuantity() %></p></div>
                <div class="price"><i class="fa-solid fa-minus"></i> 1 <i class="fa-solid fa-plus"></i></div>
                <div class="price"><i class="fa-solid fa-trash-can"></i></div>
            </div>
        </div>
        <div class="price"><%=c.getPrice() %></div> 
    </div>
   <hr><% }
}
%>
</div>	
</body>
</html>