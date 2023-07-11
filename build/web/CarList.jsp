<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuStaff.jsp"/>
<%
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM CAR ORDER BY car_id";
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
        <title>Car Rental System: Car List</title>
         <link rel="stylesheet" href="css/formcss.css">
         <link rel="stylesheet" href="css/table.css">
         <style>
                  body {
            padding: 0px;
            background-image: url("img/bg1.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100%; 
            width: 100%;
        }  
        
        a {
            text-decoration: none;
            color: whitesmoke;
          }
          
          button {
          display: block;
          margin: 20px auto 0;
          width: 150px;
          height: 40px;
          border-radius: 25px;
          border: none;
          color: #eee;
          font-weight: 700;
          box-shadow: 1px 4px 10px 1px #aaa;

          background: #207cca; /* Old browsers */
          background: -moz-linear-gradient(left, #207cca 0%, #9f58a3 100%); /* FF3.6-15 */
          background: -webkit-linear-gradient(left, #207cca 0%,#9f58a3 100%); /* Chrome10-25,Safari5.1-6 */
          background: linear-gradient(to right, #207cca 0%,#9f58a3 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
          filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#207cca', endColorstr='#9f58a3',GradientType=1 ); /* IE6-9 */
        }
        
        .buttonedit {
            background-color: #008CBA; /* Blue */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 2px;
            width: 40%;
          }
          
          .buttondelete {
            background-color: #f44336; /* Blue */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 2px;
            width: 40%;
          }
        
        h1{
          text-align: center;
          margin-bottom: 30px;
          color: black;
        }
         </style>
    </head>
    <body align="center">
        <h1>Car List</h1>
        <button><a href="AddCar.jsp">Add Car</a></button>
        <table width="70%" border="1px" align="center">
            <tr>
                <th>Car ID</th>
                <th>Car Model</th>
                <th>Car Plate Number</th>
                <th>Car Status</th>
                <th>Car Rent Price Per Day</th>
                <th>Action</th>
            </tr>
            <%
                while(rs.next())
                {
            %>
                    <tr>
                        <td><%=rs.getString("car_id")%></td>
                        <td><%=rs.getString("car_model")%></td>
                        <td><%=rs.getString("car_plateno")%></td>
                        <td><%=rs.getString("car_status")%></td>
                        <td><%=rs.getString("car_rentprice")%></td>
                        <td>
                            <a href='UpdateCar.jsp?car_id=<%=rs.getString("car_id")%>' title="Update Record" class="buttonedit">Update</a>
                            <a href='DeleteCar.jsp?car_id=<%=rs.getString("car_id")%>' title="Delete Record" class="buttondelete">Delete</a>
                        </td> 
                    </tr>
              <%}%>
        </table>
    </body>
    <jsp:include page="footer.jsp" />
</html>
