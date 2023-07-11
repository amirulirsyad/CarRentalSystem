<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String userName = (String)session.getAttribute("userName"); //get attributes from session
if (userName == null) { //if null (user not login) redirect to login page
request.setAttribute("errMessage", "You have not login");
out.println( "<script> location.href='./login.jsp'; </script>");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="menuCust.jsp"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            .mySlides {display:none;}
        </style>
    </head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Rental Management System</title>
        
    </head>
    
    
    <body>
        
      <h2 class="w3-center">Welcome to KT Car Rental System</h2>

<div class="w3-content w3-display-container">
  <img class="mySlides" src="1.png" style="width:100%">
  <img class="mySlides" src="2.png" style="width:100%">
  

  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

    </body>
    <br>
    <br>
    <jsp:include page="footer.jsp" />
</html>

