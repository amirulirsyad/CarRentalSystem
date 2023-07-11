<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/formcss.css">
        <title>Add Staff Error</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
          <div id="feedback-form"> 
        <h3>Add Staff Error</h3>
        <%
            List errorMsgs = (List)request.getAttribute("errorMsgs");
            if (errorMsgs != null)
            {
        %>

        <br>
        <font color="red">
            Please correct the following errors:
            <ul>
                <%
                    Iterator items = errorMsgs.iterator();
                    while (items.hasNext())
                    {
                        String message = (String) items.next();
                %>
                <li><%= message %></li>
                <% } %>
            </ul>
        </font>
        <% } %>
        <br>
        <form method="POST" action="StaffServlet"
              <table border='0'>
                <table border='0'>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="staff_name" value="${param.staff_name}" ></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="text" name="staff_gender" value="${param.staff_gender}" ></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td><input type="text" name="staff_age" value="${param.staff_age}" ></td>
                </tr>
                <tr>
                    <td>Phone No:</td>
                    <td><input type="text" name="staff_phoneno" value="${param.staff_phoneno}" ></td>
                <tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="staff_email" value="${param.staff_email}" ></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="staff_username" value="${param.staff_username}" ></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="staff_password" value="${param.staff_password}" ></td>
                </tr>
                <tr><input type="hidden" name="operation" value="C"/></tr>
                <tr>
                    <td><br><br></td>
                    <td><br>
                         <input type="submit" value="Save" />
                         <input type="reset" value="Reset" />
                    </td>
                </tr>
            </table>
        </form>
                <br><button><a href="index.jsp">Home</a></button>
          </div>
                 <jsp:include page="footer.jsp" />
    </body>
</html>
