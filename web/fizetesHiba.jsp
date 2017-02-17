

<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>
  <body>
    <h1>Hibás fizetés! (Sikertelen fizetés módosítás oldal)</h1>
    <hr>
    <p> A megadott fizetés nem esik bele a megengedett határokba,<br>
      vagy megegyezik az eredeti fizetéssel!<br>
    </p>
    <hr>
    <% String id = (String)session.getAttribute("id"); 
    %>
    <form action="fizetesModositas.jsp" method="post">
    <button name="id" type="submit" value=<%= id %> >OK</button>
    </form>
    <!--<a href="fizetesModositas.jsp">Vissza a fiztés módosításhoz</a>    -->
  </body>
</html>
