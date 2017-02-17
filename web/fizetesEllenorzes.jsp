
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
    <% int ujFizetes = Integer.parseInt(request.getParameter("fizetes")); 
       int minFiz = (Integer)session.getAttribute("minFizEll");
       int maxFiz = (Integer)session.getAttribute("maxFizEll");
       int aktFfizetes= (Integer)session.getAttribute("aktFizEll");
       String id = (String)session.getAttribute("id");
    %> 
    <h1>Oracle HR JSP kezelő (Fizetés ellenőrzés oldal)</h1>
    <h1>Ezt kéne ellenőrizni, hogy jó-e :  <%= ujFizetes %></h1>
    <h1>Dolgzó azonositó = <%= id %></h1>
    <p>Minimum fizetés = <%= minFiz%></p>
    <p>Maximum fizetés = <%= maxFiz%></p>
    <% if (ujFizetes < minFiz || ujFizetes > maxFiz || ujFizetes==aktFfizetes ) {
        response.sendRedirect("fizetesHiba.jsp");
      } else {%>
    <p>Fizetés rendbne lehet menteni, mentés</p>
    <% boolean ok = lekerdez.modositFizetés(Integer.parseInt(id), ujFizetes);

        if (ok) {
           response.sendRedirect("fizetesMentesSiker.jsp");
        }
        else{
          response.sendRedirect("fizetesMentesHiba.jsp");
        }
      }
    %>
  </body>
</html>
