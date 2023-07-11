<%@page import= "com.mvc.util.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuStaff.jsp"/>
<%
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    String sql = "select c.CUST_NAME, r.rent_id, r.RENT_RENTDATE, r.rent_days, "
            + "r.rent_deposit, r.RENT_STATUS, a.CAR_MODEL, "
            + "a.car_plateno, s.staff_name from rental r "
            + "join customer c on r.CUST_ID = c.CUST_ID "
            + "join car a on r.CAR_ID = a.CAR_ID "
            + "join staff s on r.STAFF_ID = s.STAFF_ID";
    ResultSet rs = stmt.executeQuery(sql);
    
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
        <link rel="stylesheet" href="css/table.css">
        <link rel="stylesheet" href="css/styles.css">
        <title>JSP Page</title>
    </head>
    <body align="center"> 
        <h1>List Car Booking</h1>
        <table border="1">
            <tr>
                <th>Rental ID</th>
                <th>Customer Name</th>
                <th>Rent Date</th>
                <th>Number of Days</th>
                <th>Deposit</th>
                <th>Status</th>
                <th>Car Model</th>
                <th>Plate Number</th>
                <th>Staff In Charge</th>
                <th>Action</th>
            </tr>
            <%
                while (rs.next()) 
                { %>
                     <tr>
                        <td><%=rs.getString("rent_id") %></td>
                        <td><%=rs.getString("cust_name") %></td>
                        <td><%=rs.getString("RENT_RENTDATE") %></td>
                        <td><%=rs.getString("rent_days") %></td>
                        <td><%=rs.getString("rent_deposit") %></td>
                        <td><%=rs.getString("RENT_STATUS") %></td>
                        <td><%=rs.getString("car_model") %></td>
                        <td><%=rs.getString("car_plateno") %></td>
                        <td><%=rs.getString("staff_name") %></td>
                        <td><a href='updateRental.jsp?rent_id=<%=rs.getInt("rent_id")%>' title="Update Record" class="buttonedit">Edit</a>
                            <a href='deleteRental.jsp?rent_id=<%=rs.getInt("rent_id")%>' title="Delete Record" class="buttondelete">Delete</a></td>
                    </tr>
                    <% }%>    
        </table>
    </body>
</html>
