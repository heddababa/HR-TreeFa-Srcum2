<%@page import = "lekerdez.AdatbazisLekerdezBean"
   contentType="text/html" pageEncoding="ISO-8859-2" errorPage="loginHiba.jsp"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<%
 //   if(!lekerdez.isLoginOK()) {
 //       response.sendRedirect("index.php");
 //   }
   %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <h1>Oracle HR JSP kezelő (Statisztika oldala)</h1>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="index.jsp">Vissza a bejelentkezéshez</a></p>
    <% } else { %>
      <script type="text/javascript">
          window.onload = function () {
            var chart = new CanvasJS.Chart("chartContainer",
            {
              title:{
                text: "Részlegek átlagfizetése"    
              },
              animationEnabled: true,
              axisY: {
                title: "Átlagfizetés(USD)"
              },
              legend: {
                verticalAlign: "bottom",
                horizontalAlign: "center"
              },
              theme: "theme2",
              data: [

              {        
                type: "column",  
                showInLegend: true, 
                legendMarkerColor: "grey",
                legendText: "",
            <%=lekerdez.getAtlagFizu()%>
              }   
              ]
            });

            chart.render();
          }
          </script>
          <script type="text/javascript" src="canvasjs.min.js"></script>
          <div id="chartContainer" style="height: 500px; width: 90%;">
          </div>
      <hr>
      <p><a href="loginOK.jsp">Vissza</a></p>
    <% } %>    
  </body>
</html>
