<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = (String)session.getAttribute("userName"); //get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/Web Pages/css/style.css" rel="stylesheet">

<style>
   ul {
         list-style-type: none;
         margin: 0;
         padding-left: 37%;
         overflow: hidden;
         background-color: #333;
    }

    
    li {
        float: left;
    }
    
    li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            
        }
    li a:hover {
                background-color: #111;
            }
    .active {
            background-color: #5070a1;
       }
       
       .dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
    
</head>
 
<body>
 
<ul>
  <li><a class="active" href="indexCust.jsp">Home</a></li>
  <li><a href="ViewCar.jsp">View Car</a></li>
  <li><a href="addRental.jsp">Create Booking</a></li>
  <li><a href="logoutServlet">Logout</a></li>
</ul> 


</body>
</html>
