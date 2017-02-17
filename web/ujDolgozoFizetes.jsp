<%@page import = "lekerdez.AdatbazisLekerdezBean" contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>
  <body>
    <h1>Oracle HR JSP kezelő (Új dolgozó fizetése oldal)
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="index.jsp">Vissza a bejelentkezéshez</a></p>
    <% } else { %>  
      <h1>Oracle HR JSP kezelő 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev")%>)
        <br>       
      <% 
         String vezetekNev = request.getParameter("vezeték_név"); 
         String keresztNev = request.getParameter("kereszt_név");
         String reszlegId= request.getParameter("részleg");
         String munkakorId= request.getParameter("munkakor_id");
         long[] adhatoMinMaxFizu=lekerdez.adhatoMinMaxFizetes(reszlegId, munkakorId);
      %>      
        <hr>
        <br><br>
        <p><%= vezetekNev+" "+keresztNev %> fizetése: </p>
        <p><%= adhatoMinMaxFizu[0]+" és "+adhatoMinMaxFizu[1] %> között lehet!</p>
        <br><br>
        <form action="ujDolgozoEllenorzes.jsp" method="post">
           Új fizetés:<input type="number" name="fizetés" value="0" min="<%= adhatoMinMaxFizu[0] %>" max="<%= adhatoMinMaxFizu[1] %>" required><br><br>
        <input type="submit" value="Mentés">
        </form>
        <hr>
        <p><a href="loginOK.jsp">Vissza</a></p>
        <% } %>
  </body>
</html>
