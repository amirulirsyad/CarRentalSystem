<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="rent" scope="request" type="com.mvc.bean.Rental"/>
<jsp:include page="menuCust.jsp"/>
<%
    String username = (String)session.getAttribute("userName");
    String userID = (String)session.getAttribute("userID");//get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }
%>
<!DOCTYPE html>
<%
    String operation = request.getParameter("operation");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/formcss.css">
        <title>CAR RENTAL</title>
    </head>
    <body align="center">
        <div id="feedback-form">
        <h1>Successfully Add Rental</h1>
        You have add the following rental information: <br>
        Rent Date: <jsp:getProperty name="rent" property="rent_rentdate"/><br>
        Rent Days: <jsp:getProperty name="rent" property="rent_days"/><br>
        Deposit:RM <jsp:getProperty name="rent" property="rent_deposit"/><br>
        Status: <jsp:getProperty name="rent" property="rent_status"/><br>
        <br><button><a href="indexCust.jsp">Home</a></button>
        </div>
    </body>
</html>