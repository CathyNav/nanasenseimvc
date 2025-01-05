  <%@page import="com.nanasenseimvc.connection.DbCon"%>
<%@page import="com.nanasenseimvc.dao.ProductDao"%>
<%@page import="com.nanasenseimvc.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.nanasenseimvc.model.User"%>
<header role="banner">
    <div class="container1">
        <div>
            <a href="index.jsp"> <img src="images/logo.png" class="logo" alt="" aria-hidden="true" width="150px" height="150px"></a>
        </div>
        <nav class="navigation">
            <div class="burger-menu">            
                <span></span>
                <span></span>
                <span></span>
                
                
            </div>
            <ul>
                <li class="cours"><a href="cours.jsp">Cours</a></li>
                <li class="boutique"><a href="boutique.jsp">Boutique</a></li>
                <li class="blog"><a href="blog.jsp">Blog</a></li>
                 <%
         ProductDao prodd = new ProductDao(DbCon.getConnection());
         List<Product> products = prodd.getAllProducts();
         User auth = (User)request.getSession().getAttribute("auth");
         if(auth !=null){
        %>
                    <li class="connexion"><a href="account.jsp"><%= auth.getPseudo() %></a></li>
                    <li><a href="logout"><img class="logout" alt="déconnexion" src="images/icons8-éteindre-26.png"></a></li>
                    <% if(auth.getRoles().equals("admin")) { %>
                        <li><a href="<%= request.getContextPath() %>/admin/adminHome.jsp">Menu admin</a></li>
                    <% } %>
                <% } else { %>
                    <li class="connexion"><a href="login.jsp">Connexion</a></li>
                <% } %>
            </ul>
        </nav>
    </div>
</header>