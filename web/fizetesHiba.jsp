

<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezel�</title>
  </head>
  <body>
    <h1>Hib�s fizet�s! (Sikertelen fizet�s m�dos�t�s oldal)</h1>
    <hr>
    <p> A megadott fizet�s nem esik bele a megengedett hat�rokba,<br>
      vagy megegyezik az eredeti fizet�ssel!<br>
    </p>
    <hr>
    <% String id = (String)session.getAttribute("id"); 
    %>
    <form action="fizetesModositas.jsp" method="post">
    <button name="id" type="submit" value=<%= id %> >OK</button>
    </form>
    <!--<a href="fizetesModositas.jsp">Vissza a fizt�s m�dos�t�shoz</a>    -->
  </body>
</html>
