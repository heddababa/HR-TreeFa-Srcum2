<%@page import = "lekerdez.AdatbazisLekerdezBean"
   contentType="text/html" pageEncoding="ISO-8859-2" errorPage="loginHiba.jsp"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezelő (sikeres bejelentkezési oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="index.jsp">Vissza a bejelentkezéshez</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezelő 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
      <hr>
      <p><a href="Statisztika.jsp">Statisztikák</a></p>
      <p><a href="Dolgozok.jsp">Dolgozók fizetéseinek módosítása</a></p>
    <%--  <% if(session.getAttribute("jogkor")=="HR2") { %> --%>
      <% if(lekerdez.getJogkor().equals("HR2")) { %> 
        <%-- csak ha session.getAttribute("jogkor")=="HR2"-vel! vagy lekerdez.getjogkor.equals("HR2") --%>
        <p><a href="ujDolgozo.jsp">Új dolgozó felvitele</a></p>
      <% } %>
      <%-- <p><a href="fizetesModositas.jsp">Kiválasztott dolgozó fizetésének módosítása</a></p> --%>
      <hr>
      <p><a href="logout.jsp">Kijelentkezés</a></p>
    <% } %>
  </body>
</html>
