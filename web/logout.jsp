<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP lekérdező</title>
  </head>  
  <body>
    <h1>Oracle HR JSP lekérdező (kijelentkező oldal)</h1>
    <%
      lekerdez.setLoginOK(false);
      session.removeAttribute("username");
      session.removeAttribute("password");
      session.removeAttribute("jogkor");
      session.invalidate();
    %>
    <hr>    
    <p>Köszönjük, hogy meglátogatta oldalunkat :D</p>  
  </body>
</html>
