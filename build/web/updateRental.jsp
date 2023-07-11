<%@page import="com.mvc.bean.Rental"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.mvc.dao.RentalDAO"%>
<jsp:include page="menuStaff.jsp"/>
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
         <%
            int rent_id = Integer.parseInt(request.getParameter("rent_id"));
            Rental rent;
            RentalDAO dao = new RentalDAO();
            rent = dao.getRent(rent_id);
        %>
        <div id="feedback-form">
        <h1>Update Car Booking</h1>
        <form action="RentalServlet" method="POST">
            <table>
                 <tr>
                    <td>Staff:</td>
                    <td><input type="text" name="staff_id" value="<%=rent.getStaff_id()%>"/></td>
                </tr>
                <tr>
                    <td>Rent Date:</td>
                    <td><input type="text" name="rent_rentdate" value="<%=rent.getRent_rentdate()%>" readonly/></td>
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
                    <td><input type="text" name="rent_days" value="<%=rent.getRent_days()%>"/></td>
                </tr>
                <tr>
                    <td>Deposit:RM</td>
                    <td><input type="text" name="rent_deposit" value="<%=rent.getRent_deposit()%>"/></td>
                </tr>
                <tr>
                    <td>Rental Status</td>
                    <td><select name="rent_status" value="<%=rent.getRent_status()%>">
                           <option value="In progress">In progress</option>
                           <option value="Approved">Approved</option>
                           <option value="Decline">Decline</option>
                    </select></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="operation" value="U"/>
                        <input type="hidden" name="rent_id" value="<%=rent.getRent_id()%>"/>
                    </td>
                    <td>
                        <button type="submit">Save</button>
                        <button type="reset">Reset</button>
                    </td>
                </tr> 
            </table>
        </form>
        </div>
        <%
            rs.close();
            stmt.close();
            conn.close();
        %>
    </body>
</html>
