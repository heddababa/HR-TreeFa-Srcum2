<%@page import = "lekerdez.AdatbazisLekerdezBean" contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezel�</title>
  </head>
  <body>
    <h1>Oracle HR JSP kezel� (�j dolgoz� fizet�se oldal)
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="index.jsp">Vissza a bejelentkez�shez</a></p>
    <% } else { %>  
      <h1>Oracle HR JSP kezel� 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev")%>)
        <br>       
      <% 
         String vezetekNev = request.getParameter("vezet�k_n�v"); 
         String keresztNev = request.getParameter("kereszt_n�v");
         String reszlegId= request.getParameter("r�szleg");
         String munkakorId= request.getParameter("munkakor_id");
         long[] adhatoMinMaxFizu=lekerdez.adhatoMinMaxFizetes(reszlegId, munkakorId);
      %>      
        <hr>
        <br><br>
        <p><%= vezetekNev+" "+keresztNev %> fizet�se: </p>
        <p><%= adhatoMinMaxFizu[0]+" �s "+adhatoMinMaxFizu[1] %> k�z�tt lehet!</p>
        <br><br>
        <form action="ujDolgozoEllenorzes.jsp" method="post">
           �j fizet�s:<input type="number" name="fizet�s" value="0" min="<%= adhatoMinMaxFizu[0] %>" max="<%= adhatoMinMaxFizu[1] %>" required><br><br>
        <input type="submit" value="Ment�s">
        </form>
        <hr>
        <p><a href="loginOK.jsp">Vissza</a></p>
        <% } %>
  </body>
</html>
