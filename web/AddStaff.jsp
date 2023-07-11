<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuStaff.jsp"/>
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
        <link rel="stylesheet" href="css/formcss.css">
        <title>Add New Staff</title>
    </head>
    <body>
         <div id="feedback-form">
        <h3>Add New Staff</h3>
        <form action="StaffServlet" method="POST">
            <table border='0'>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="staff_name" value="" ></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="text" name="staff_gender" value="" ></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td><input type="text" name="staff_age" value="" ></td>
                </tr>
                <tr>
                    <td>Phone No:</td>
                    <td><input type="text" name="staff_phoneno" value="" ></td>
                <tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="staff_email" value="" ></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="staff_username" value="" ></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="staff_password" value="" ></td>
                </tr>
                <tr><input type="hidden" name="operation" value="C"/></tr>
                <tr>
                    <td><br></td>
                    <td><br>
                        <input type="submit" value="Save" class="buttonbasic"/>
                        <input type="reset" value="Reset" class="buttonbasic" />
                    </td>
                </tr>
            </table>
        </form>
         </div>
    </body>
</html>
