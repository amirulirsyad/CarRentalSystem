<%@page import= "com.mvc.util.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuCust.jsp"/>
<%
    
    String username = (String)session.getAttribute("userName"); //get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }
    
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    String sql = "select c.CUST_NAME, r.rent_id, r.RENT_RENTDATE, r.RENT_RETURNDATE, "
            + "r.RENT_RATE, r.RENT_PAYMENT, r.RENT_STATUS, a.CAR_MODEL, "
            + "a.car_plateno, s.staff_name from rental r "
            + "join customer c on r.CUST_ID = c.CUST_ID "
            + "join car a on r.CAR_ID = a.CAR_ID "
            + "join staff s on r.STAFF_ID = s.STAFF_ID";
    
    ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/formcss.css">
        <link rel="stylesheet" href="css/table.css">
        <link rel="stylesheet" href="css/styles.css">
        <title>JSP Page</title>
    </head>
    <body align="center"> 
        <h1>List Car Rental</h1>
        <table border="1">
            <tr>
                <th>Customer Name</th>
                <th>Rent Date</th>
                <th>Return Date</th>
                <th>Rate</th>
                <th>Payment</th>
                <th>Status</th>
                <th>Car Model</th>
                <th>Plate Number</th>
            </tr>
            <%
                while (rs.next()) 
                { %>
                     <tr>
                        <td><%=rs.getString("cust_name") %></td>
                        <td><%=rs.getString("RENT_RENTDATE") %></td>
                        <td><%=rs.getString("RENT_RETURNDATE") %></td>
                        <td><%=rs.getString("rent_rate") %></td>
                        <td><%=rs.getString("rent_payment") %></td>
                        <td><%=rs.getString("RENT_STATUS") %></td>
                        <td><%=rs.getString("car_model") %></td>
                        <td><%=rs.getString("car_plateno") %></td>
                    </tr>
                    <% }%>    
        </table>
    </body>
</html>

