<%@page import="java.sql.ResultSet" %>
<%@page import="com.mvc.bean.Rental" %>
<%@page import="com.mvc.dao.RentalDAO" %>
<%@page import="com.mvc.util.DBConnection" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuCust.jsp"/>
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/formcss.css">
        <title>CAR RENTAL</title>
    </head>
    <body>
         <div id="feedback-form">
        <h1>Add New Car Booking</h1>
        <form action="RentalServlet" method="POST">
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
                    <td><input type="date" name="rent_rentdate"/></td>
                </tr>
                <tr>
                    <td>Car Model:</td>
                    <td>
                        <select name="car_id">
                            <%
                                while(rs.next())
                                {
                            %>  
                            <option value="<%=rs.getString("car_id")%>">
                                <%=rs.getString("car_model") %>
                            </option>
                              <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Rent Days:</td>
                    <td><input type="text" name="rent_days"></td>
                </tr>
                <tr>
                    <td>Deposit:RM</td>
                    <td><input type="text" name="rent_deposit" /></td>
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
      <jsp:include page="footer.jsp" />
</html>
