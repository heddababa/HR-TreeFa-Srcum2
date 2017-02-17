<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>
  <style>
    table {
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 25%;
    }

    td, th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even) {
      background-color: #dddddd;
    }
  </style>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezelő (Fizetés módosítás oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a "foablakra"</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezelő 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev")%>)
        <br>
        Fizetés módosítás
      </h1> <%--TODO Jogkort kiiratni--%>
      <p> A jogköröd: <%= lekerdez.getJogkor()%> </p>
      <hr>
      Ezt a dolgozót választottam ki:<br> 
      <% String id = request.getParameter("id"); 
         int minFiz=lekerdez.getMinFizetes(id);
         int maxFiz=lekerdez.getMaxFizetes(id);
         int aktFizetes = lekerdez.getDolgozoFizetese(id);
         int emeles5szazalek = Math.round(aktFizetes*1.05F);
         int csokkentes5szazalek =  Math.round(aktFizetes*0.95F);
         int adhatoMax = maxFiz>emeles5szazalek?emeles5szazalek:maxFiz;
         int adhatoMin = minFiz<csokkentes5szazalek?csokkentes5szazalek:minFiz;
         
         session.setAttribute("minFizEll", adhatoMin);
         session.setAttribute("maxFizEll", adhatoMax);
         session.setAttribute("aktFizEll", aktFizetes);
         session.setAttribute("id", id);
      %>
      <table>
        <tr>
          <td>A dolgozó azonosítója</td>
          <td><%= id%></td>
        </tr>
        <tr>
          <td>A dolgozó neve</td>
          <td><%= lekerdez.getDolgozoNeve(request.getParameter("id"))%></td>
        </tr>
        <tr>
          <td>Részlege</td>
          <td><%= lekerdez.getDolgozoRszlege(request.getParameter("id"))%></td>
        </tr>
        <tr>
          <td>Munkaköre</td>
          <td><%= lekerdez.getDolgozoMunkakore(request.getParameter("id"))%></td>
        </tr>
        <tr>
          <td>Aktuális fizetés:</td>
          <td><%= aktFizetes %></td>
        </tr>
        <tr>
          <td>Adható maximális fizetés:</td>
          <td><%= adhatoMax %></td>
        </tr>
        <tr>
          <td>Adható minimális fizetés: </td>
          <td><%= adhatoMin %></td>
        </tr>
      </table>
        <br><br>
        <form action="fizetesEllenorzes.jsp" method="post">
          Új fizetés:<input type="number" name="fizetes" max="<%= adhatoMax %>" min="<%= adhatoMin %>" required><br>
          <input type="submit" value="Mehet">
        </form>
        <hr>
        <% } %>
        <!--<p><a href="loginOK.jsp">Foablakra (Igazabol ellenorzes kell mentes utan)</a></p>-->
  </body>
</html>
