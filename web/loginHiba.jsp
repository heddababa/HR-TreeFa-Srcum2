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
    <h1>Hibás bejelentkezés! (Sikertelen bejelentkezési oldal)</h1>
    <hr>
    <p> <%= lekerdez.ellenőrzés(lekerdez.getHibakod()) %> </p>
    <hr>
    <a href="index.jsp">Vissza a bejelentkezéshez</a>    
  </body>
</html>
