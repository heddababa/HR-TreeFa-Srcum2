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
    <h1>Oracle HR JSP kezelő (Új dolgozó ellenőrzése oldal)
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="index.jsp">Vissza a bejelentkezéshez</a></p>
    <% } else { %>      
    <p>Az új dolgozó fizetése</p>    
    <% String vezetekNev = request.getParameter("vezeték_név"); 
       String keresztNev = request.getParameter("kereszt_név");
       String nickNev = request.getParameter("email");
       String telSzam = request.getParameter("tel_szam");
       String reszlegId= request.getParameter("részleg");
       String munkakorId= request.getParameter("munkakor_id");
       String fizetes= request.getParameter("fizetés"); 
       int managerId=lekerdez.lekerdezReszlegFonoke(Integer.parseInt(reszlegId)); 
      // long[] adhatoMinMaxFizu=lekerdez.adhatoMinMaxFizetes(reszlegId, munkakorId);
    %>
    <hr>
    <%
      boolean ok=lekerdez.ujDolgozoFelvetele( vezetekNev, 
                                              keresztNev, 
                                              nickNev, 
                                              telSzam, 
                                              munkakorId, 
                                              Integer.parseInt(fizetes), 
                                              -1, 
                                              managerId,
                                              Integer.parseInt(reszlegId));
      if (ok) {
        response.sendRedirect("ujDolgozoMentesSiker.jsp");
      }
      else {
        response.sendRedirect("ujDolgozoMentesHiba.jsp");
      }
    } %>
  </body>
</html>
