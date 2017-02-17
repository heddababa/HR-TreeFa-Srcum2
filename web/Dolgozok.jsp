<%@page import="lekerdez.Dolgozo"%>
<%@page import="lekerdez.Reszleg"%>
<%@page import="lekerdez.AdatbazisLekerdezBean"
        contentType="text/html" pageEncoding="ISO-8859-2" %>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

    <title>JSP Page</title>
  </head>
  <body>
    <h1>Dolgozók listája</h1>
    <%lekerdez.getDolgozokAdatai("mindenki");%>
    <div data-role=page id="pageone">
      <div data-role="main" class="ui-content">
        <h2>HR lista</h2>
        <%
          for (Reszleg reszleg : lekerdez.reszlegek) {
        %>
        <div data-role="collapsible">
          <h4><%= reszleg.getReszlegNev()%></h4>
          <ul data-role="listview">
            <%for (Dolgozo dolgozo : lekerdez.getDolgozokAdataiReszlegenkent(Integer.toString(reszleg.getReszlegId()))) {%>
            <li><a href="fizetesModositas.jsp?id=<%=dolgozo.getEmpID()%>"> <%=dolgozo.getNev()%> </a></li>
              <%}%>
          </ul>
        </div>
        <%}%>
      </div>
    </div>
  </body>
</html>