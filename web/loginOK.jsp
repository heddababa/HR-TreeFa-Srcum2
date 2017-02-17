<%@page import = "lekerdez.AdatbazisLekerdezBean"
   contentType="text/html" pageEncoding="ISO-8859-2" errorPage="loginHiba.jsp"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezel�</title>
  </head>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezel� (sikeres bejelentkez�si oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="index.jsp">Vissza a bejelentkez�shez</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezel� 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
      <hr>
      <p><a href="Statisztika.jsp">Statisztik�k</a></p>
      <p><a href="Dolgozok.jsp">Dolgoz�k fizet�seinek m�dos�t�sa</a></p>
    <%--  <% if(session.getAttribute("jogkor")=="HR2") { %> --%>
      <% if(lekerdez.getJogkor().equals("HR2")) { %> 
        <%-- csak ha session.getAttribute("jogkor")=="HR2"-vel! vagy lekerdez.getjogkor.equals("HR2") --%>
        <p><a href="ujDolgozo.jsp">�j dolgoz� felvitele</a></p>
      <% } %>
      <%-- <p><a href="fizetesModositas.jsp">Kiv�lasztott dolgoz� fizet�s�nek m�dos�t�sa</a></p> --%>
      <hr>
      <p><a href="logout.jsp">Kijelentkez�s</a></p>
    <% } %>
  </body>
</html>
