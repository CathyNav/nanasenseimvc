  <%@page import="com.nanasenseimvc.model.User"%>
  <header role="banner">
        <div class="container1">
            <div> <a href="../index.jsp"> <img src="../images/logo.png" alt="" aria-hidden="true" width="150px" height="150px"></a>
            </div>
            <div class="navigation">
                <div class="cours"><a href="../cours.jsp" >Cours</a></div>
                <div class="boutique"><a href="../boutique.jsp">Boutique</a></div>
                <div class="blog"><a href="../blog.jsp">Blog</a></div>
            </div>
            
         <%User auth = (User)request.getSession().getAttribute("auth");
         if(auth !=null){
        %>
        <div class="logged">
        <div class="connexion"><a href="account.jsp"><%=auth.getPseudo() %></a></div>
        <a href="../logout"><img class="logout" alt="déconnexion" src="../images/icons8-éteindre-26.png" ></a></div>
        <%}else{%>
        <div class="connexion"><a href="../login.jsp">Connexion</a></div>
        <%} %>       
        </div>
    </header>