<%@page import="lekerdez.Reszleg"%>
<%@page import="lekerdez.Munkakor"%>
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
    <h1>Oracle HR JSP kezelő (Új dolgozó felvitele oldal)
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
    <hr>
    <% if(!lekerdez.isLoginOK() || !lekerdez.getJogkor().equals("HR2") ){ %>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a bejelentkezéshez</a></p>
    <% } else { %>      
      <p>Új dolgozó adatai</p>
      <%--<form name="urlap" action="ujDolgozoFizetes.jsp" method="post" onsubmit="return ellenoriz()"><br>--%>
      <form name="urlap" action="ujDolgozoEllenorzo.jsp" method="post" onsubmit="return ellenoriz()"><br>
        Vezetéknév: <input type="text" name="vezeték_név" width="25"><br><br>
        Keresztnév: <input type="text" name="kereszt_név" width="20"><br><br>
        Nick név (emailhez): <input type="text" name="email" width="25"><br><br>
        Telefonszám: <input type="text" name="tel_szam" width="20"><br><br>
        Részleg: 
          <select id="departments" name="részleg" onchange="fizetesHatarok()">
            <% for (Reszleg reszleg : lekerdez.getReszleg()) {%>
              <option value="<%= reszleg.getReszlegId()%>"><%= reszleg.getReszlegNev()%>
            <% } %>
          </select><br><br>
        Munkakör: 
          <select id="jobs" name="munkakor_id" onchange="fizetesHatarok()">
            <% for (Munkakor munkakor : lekerdez.getMunkakor()) {%>
              <option value="<%= munkakor.getMunkakorId()%>"><%= munkakor.getMunkakorNev()%>
            <% } %> 
          </select><br><br>
        
        <%--<p>A fizetés a következő oldalon adható meg! </p>
        
        <%= lekerdez.adhatoMinMaxFizetes(request.getParameter("department_id") , request.getParameter("job_Id") )%></p>
        <p id="fizhatarok"> </p>--%>
        Fizetés: <input type="text" name="fizetés" width="8"><br><br>  
        <%--<input type="submit" value="Tovább a fizetéshez">--%>
        <input type="submit" value="Mentés">
      </form>       
        
        <script>
          function fizetesHatarok() {
            var reszleg = document.getElementById("departments").value;
            var munkakor = document.getElementById("jobs").value;            
            document.getElementById("adhatoFizu").innerHTML = "Kiválasztott részleg és munkakör: "+reszleg+", "+munkakor;
          <%--  document.getElementById("fizhatarok").innerHTML = <%= lekerdez.adhatoMinMaxFizetes(reszleg, munkakor) %>;              
            document.getElementById("fizhatarok").innerHTML = <%= lekerdez.adhatoMinMaxFizetes(request.getParameter("department_id"), request.getParameter("job_Id"))%> --%>
          }
          
          function uresCheck(mezo){
            if (mezo.value != "") return true;
            else{
              alert("A(z) "+ mezo.name +" mező üres!");
              return false;
            }
          }
          
          function numerikusCheck(mezo){
            if (!uresCheck(mezo)) return false;
            if (!teszt(mezo.value,"1234567890")){
              alert("Ez nem numerikus érték!");
              return false;
            }
            else return true;
          }
          
          function teszt(adat,minta){
            for (var i=0; i<adat.length; i++)
              if (minta.indexOf(adat.charAt(i)) == -1)
                return false;
            return true;
          }
          
          function tartalmaz(adat,minta){
            for (var i=0; i<adat.length; i++)
              if (minta.indexOf(adat.charAt(i)) != -1)
                return true;
            return false;
          }
          
          function telefonCheck(mezo){
            if (!uresCheck(mezo)) return false;
            if (!teszt(mezo.value,"1234567890()/- ") ||
              !tartalmaz(mezo.value,"1234567890")){
              alert("Ez nem jó telefonszám!");
              return false;
            }
            else return true;
          }
          
          function ellenoriz(){
            if (uresCheck(document.urlap.vezeték_név) &&
              uresCheck(document.urlap.kereszt_név) &&
              uresCheck(document.urlap.email) &&
              telefonCheck(document.urlap.tel_szam) && 
              numerikusCheck(document.urlap.fizetés)) {
              return true;
            }
            else return false;
          }
          
        </script>        
      
      <hr>
      <p><a href="loginOK.jsp">Vissza</a></p>
    <% } %>   
  </body>
</html>
