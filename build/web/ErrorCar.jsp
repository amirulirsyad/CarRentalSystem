<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
        <title>Car Rental System: Error Page</title>
        <link rel="stylesheet" href="css/formcss.css">
    </head>
    <body>
         <jsp:include page="menu.jsp"/>
          <div id="feedback-form"> 
        <%
        String operation = request.getParameter("operation");
        if(operation.equals("C"))
        { %>
        
            <h1>Add Car Error</h1>
            <%
                List errorMsgs = (List)request.getAttribute("errorMsgs");
                if (errorMsgs != null)
                {
            %>
            <font color="red">
            <br>
                Please correct the following errors:
                <ul>
                    <%
                        Iterator items = errorMsgs.iterator();
                        while(items.hasNext())
                        {
                            String message = (String) items.next();
                    %>
                    <li><%=message%></li>
                     <% } %>
                </ul>
            </font>
            <% } %>    
            <form action="CarServlet" method="POST">
                <table>
                    <tr>
                        <td>Car Plate Number</td>
                        <td><input type="text" name="car_plateno" value="${param.car_plateno}"></td>
                    </tr>
                    <tr>
                        <td>Car Model</td>
                        <td><input type="text" name="car_model" value="${param.car_model}"></td>
                    </tr>
                    <tr>
                        <td>Car Status</td>
                        <td><input type="text" name="car_status" value="${param.car_status}"></td>
                    </tr>
                    <tr>
                        <td>Car Rent Price Per Day</td>
                        <td><input type="text" name="car_rentprice" value="${param.car_rentprice}"></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="operation" value="C"></td>
                                    <td>
                                        <input type="submit" value="Add">
                                    </td>
                        </td>
                    </tr> 
                </table>        
            </form>
        <%
        }
        if(operation.equals("U"))
        { %>
            <h1>Update Car Error</h1>
            <%
            List errorMsgs = (List)request.getAttribute("errorMsgs");
            if (errorMsgs != null)
            {
        %>
        <font color="red">
        <br>
            Please correct the following errors:
            <ul>
                <%
                    Iterator items = errorMsgs.iterator();
                    while(items.hasNext())
                    {
                        String message = (String) items.next();
                %>
                <li><%=message%></li>
                 <% } %>
            </ul>
        </font>
        <% } %>    
        <form action="CarServlet" method="POST">
            <table>
                <tr>
                    <td>Car Plate Number</td>
                    <td><input type="text" name="car_plateno" value="${param.car_plateno}"></td>
                </tr>
                <tr>
                    <td>Car Model</td>
                    <td><input type="text" name="car_model" value="${param.car_model}"></td>
                </tr>
                <tr>
                    <td>Car Status</td>
                    <td><input type="text" name="car_status" value="${param.car_status}"></td>
                </tr>
                <tr>
                    <td>Car Rent Price</td>
                    <td><input type="text" name="car_rentprice" value="${param.car_rentprice}"></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="operation" value="U"></td>
                                <td>
                                    <input type="submit" value="Update">
                                </td>
                    </td>
                </tr> 
            </table>        
         </form>
        <%
        }
        %>
        <p><a href="index.jsp">Home</a></p>
          </div>
             <jsp:include page="footer.jsp" />
    </body>
</html>
