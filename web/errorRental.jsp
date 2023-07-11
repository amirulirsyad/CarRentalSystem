<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT car_id, car_model||' - '||car_plateno car_model, car_rentprice FROM car where car_status='Available' ORDER BY car_id";
    ResultSet rs = stmt.executeQuery(sql);
    
    String username = (String)session.getAttribute("userName");
    String userID = (String)session.getAttribute("userID");//get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }
    
    String car_id = request.getParameter("car_id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/formcss.css">
        <title>Add Rental Error</title>
    </head>
    <body>
        <div id="feedback-form"> 
        <h3>Add Rental Error</h3>
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
        <form method="POST" action="RentalServlet">   
            <table>
                 <tr>
                    <td>User ID:</td>
                    <td><input type="text" name="cust_id" value="<%=userID%>"</td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="cust_name" value="<%=username%>"</td>
                </tr>
                <tr>
                    <td>Rent Date:</td>
                    <td><input type="date" name="rent_rentdate" value="${param.rent_rentdate}"/></td>
                </tr>
                <tr>
                    <td>Car Model:</td>
                    <td>
                        <select name="car_id">
                            <%
                                while(rs.next())
                                {
                            %>  
                            <option value="<%=rs.getString("car_id")%>" <%if(car_id.equals(rs.getString("car_id"))) {%>selected<%}%>>
                                <%=rs.getString("car_model") %>
                            </option>
                              <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Rent Days:</td>
                    <td><input type="text" name="rent_days" value="${param.rent_days}"></td>
                </tr>
                <tr>
                    <td>Deposit:RM</td>
                    <td><input type="text" name="rent_deposit" value="${param.rent_deposit}"/></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="rent_status" value="Inprogress"></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="staff_id" value="1"></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="operation" value="C"/></td>
                    <td>
                        <button type="submit">Save</button>
                        <button type="reset">Reset</button>
                    </td>
                </tr> 
            </table>
        </form>
        </div>
    </body>
</html>


