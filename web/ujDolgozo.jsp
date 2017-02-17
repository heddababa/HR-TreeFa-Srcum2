<%@page import="lekerdez.Reszleg"%>
<%@page import="lekerdez.Munkakor"%>
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
    <h1>Oracle HR JSP kezel� (�j dolgoz� felvitele oldal)
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
    <hr>
    <% if(!lekerdez.isLoginOK() || !lekerdez.getJogkor().equals("HR2") ){ %>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a bejelentkez�shez</a></p>
    <% } else { %>      
      <p>�j dolgoz� adatai</p>
      <%--<form name="urlap" action="ujDolgozoFizetes.jsp" method="post" onsubmit="return ellenoriz()"><br>--%>
      <form name="urlap" action="ujDolgozoEllenorzo.jsp" method="post" onsubmit="return ellenoriz()"><br>
        Vezet�kn�v: <input type="text" name="vezet�k_n�v" width="25"><br><br>
        Keresztn�v: <input type="text" name="kereszt_n�v" width="20"><br><br>
        Nick n�v (emailhez): <input type="text" name="email" width="25"><br><br>
        Telefonsz�m: <input type="text" name="tel_szam" width="20"><br><br>
        R�szleg: 
          <select id="departments" name="r�szleg" onchange="fizetesHatarok()">
            <% for (Reszleg reszleg : lekerdez.getReszleg()) {%>
              <option value="<%= reszleg.getReszlegId()%>"><%= reszleg.getReszlegNev()%>
            <% } %>
          </select><br><br>
        Munkak�r: 
          <select id="jobs" name="munkakor_id" onchange="fizetesHatarok()">
            <% for (Munkakor munkakor : lekerdez.getMunkakor()) {%>
              <option value="<%= munkakor.getMunkakorId()%>"><%= munkakor.getMunkakorNev()%>
            <% } %> 
          </select><br><br>
        
        <%--<p>A fizet�s a k�vetkez� oldalon adhat� meg! </p>
        
        <%= lekerdez.adhatoMinMaxFizetes(request.getParameter("department_id") , request.getParameter("job_Id") )%></p>
        <p id="fizhatarok"> </p>--%>
        Fizet�s: <input type="text" name="fizet�s" width="8"><br><br>  
        <%--<input type="submit" value="Tov�bb a fizet�shez">--%>
        <input type="submit" value="Ment�s">
      </form>       
        
        <script>
          function fizetesHatarok() {
            var reszleg = document.getElementById("departments").value;
            var munkakor = document.getElementById("jobs").value;            
            document.getElementById("adhatoFizu").innerHTML = "Kiv�lasztott r�szleg �s munkak�r: "+reszleg+", "+munkakor;
          <%--  document.getElementById("fizhatarok").innerHTML = <%= lekerdez.adhatoMinMaxFizetes(reszleg, munkakor) %>;              
            document.getElementById("fizhatarok").innerHTML = <%= lekerdez.adhatoMinMaxFizetes(request.getParameter("department_id"), request.getParameter("job_Id"))%> --%>
          }
          
          function uresCheck(mezo){
            if (mezo.value != "") return true;
            else{
              alert("A(z) "+ mezo.name +" mez� �res!");
              return false;
            }
          }
          
          function numerikusCheck(mezo){
            if (!uresCheck(mezo)) return false;
            if (!teszt(mezo.value,"1234567890")){
              alert("Ez nem numerikus �rt�k!");
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
              alert("Ez nem j� telefonsz�m!");
              return false;
            }
            else return true;
          }
          
          function ellenoriz(){
            if (uresCheck(document.urlap.vezet�k_n�v) &&
              uresCheck(document.urlap.kereszt_n�v) &&
              uresCheck(document.urlap.email) &&
              telefonCheck(document.urlap.tel_szam) && 
              numerikusCheck(document.urlap.fizet�s)) {
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
