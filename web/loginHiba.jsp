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
    <h1>Hib�s bejelentkez�s! (Sikertelen bejelentkez�si oldal)</h1>
    <hr>
    <p> <%= lekerdez.ellen�rz�s(lekerdez.getHibakod()) %> </p>
    <hr>
    <a href="index.jsp">Vissza a bejelentkez�shez</a>    
  </body>
</html>
