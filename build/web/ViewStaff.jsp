<%@page import="com.mvc.dao.StaffDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp"/>
<%
    StaffDAO dao = new StaffDAO(); //create StaffDAO object
    //call getAllStaff()and to set an attribute to a servlet request
    //and store into staff object
    request.setAttribute("staff", dao.getAllStaff());
%>
<jsp:useBean id="staff" scope="session" class="com.mvc.dao.StaffDAO" />
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
    </head>
    <body>
        <h3 align="left">View All Staff Information</h3>
            <table border="1">
                <tr>
                    <th>Staff ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Phone No</th>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Password</th>
                </tr>
                <c:forEach items="${staff}" var="staff">
                     <tr>
                        <td><c:out value="${staff.staff_id}"/></td>
                        <td><c:out value="${staff.staff_name}"/></td>
                        <td><c:out value="${staff.staff_gender}"/></td>
                        <td><c:out value="${staff.staff_age}"/></td>
                        <td><c:out value="${staff.staff_phoneno}"/></td>
                        <td><c:out value="${staff.staff_email}"/></td>
                        <td><c:out value="${staff.staff_username}"/></td>
                        <td><c:out value="${staff.staff_password}"/></td>
                    </tr>
                </c:forEach>
            </table>
        <br><a href="index.jsp">Home</a>
    </body>
</html>
