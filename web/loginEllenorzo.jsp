<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/> 
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <h1>Oracle HR JSP kezelő (login ellenőrző oldal)</h1>
    <hr>
    <% if(request.getParameter("username")==null) { %>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="index.jsp">Vissza a bejelentkezéshez</a></p>
    <% } else {
        String felhasznalonev=request.getParameter("username");
        String jelszo=request.getParameter("password");        
        //if(felhasznalonev.equals("HR") && jelszo.equals("hr")) {
        int hkod=lekerdez.jelszóEllenőrzés(felhasznalonev, jelszo);
        lekerdez.setHibakod(hkod);
        if (hkod==0) {
          //persze ezt élesben XML-ből, adatbázisból vagy bean-ből kellene csinálni
          lekerdez.setLoginOK(true);
          session.setAttribute("felhasznalonev",felhasznalonev);
          session.setAttribute("jogkor",lekerdez.getJogkor());
          response.sendRedirect("loginOK.jsp");
        }
        else {
          lekerdez.setLoginOK(false);
          response.sendRedirect("loginHiba.jsp");
        }
      } %>
  </body>
</html>
