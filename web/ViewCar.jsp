<%@page import="com.mvc.dao.CarDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="car" scope="session" class="com.mvc.dao.CarDAO" />
<%
    CarDAO dao = new CarDAO();//create StaffDAO object
    request.setAttribute("car", dao.getAllCar());
%>
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
<html>
    <head>
        <title>Car Rental System: View Car</title>
         <link rel="stylesheet" href="css/formcss.css">
         <link rel="stylesheet" href="css/table.css">
    </head>
    <body align="center">
        <h1>View All Car Information</h1>
        <table width="70%" border="1px" align="center">
            <tr>
                <th>Car ID</th>
                <th>Car Plate Number</th>
                <th>Car Model</th>
                <th>Car Status</th>
                <th>Car Rent Price per Day</th>
            </tr>
            <c:forEach items="${car}" var="cr">
                <tr>
                    <td><c:out value="${cr.car_id}"/></td>
                    <td><c:out value="${cr.car_plateno}"/></td>
                    <td><c:out value="${cr.car_model}"/></td>
                    <td><c:out value="${cr.car_status}"/></td>
                    <td><c:out value="${cr.car_rentprice}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
