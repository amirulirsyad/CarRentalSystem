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
<%
    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM STAFF ORDER BY staff_id";
    ResultSet rs = stmt.executeQuery(sql);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Page</title>
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
        <h3>List Staff</h3>
        <p>
            <button><a href="AddStaff.jsp">Add Staff</a></button>
        </p>
        <%--Presentation Code--%>
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
                <th>Action</th>
            </tr>
            <%
                while (rs.next()) 
                { %>
                    <tr>
                        <%--Get the ID --%>
                        <td><%= rs.getInt("staff_id") %></td>
                        <%--Get the NAME --%>
                        <td><%= rs.getString("staff_name") %></td>
                        <%--Get the GENDER --%>
                        <td><%= rs.getString("staff_gender") %></td>
                        <%--Get the AGE --%>
                        <td><%= rs.getInt("staff_age") %></td>
                        <%--Get the PHONENO --%>
                        <td><%= rs.getString("staff_phoneno") %></td>
                        <%--Get the EMAIL --%>
                        <td><%= rs.getString("staff_email") %></td>
                        <%--Get the USERNAME --%>
                        <td><%= rs.getString("staff_username") %></td>
                        <%--Get the PASSWORD --%>
                        <td><%= rs.getString("staff_password") %></td>

                        <td>
                            <a href='EditStaff.jsp?staff_id=<%= rs.getInt("staff_id")%>' title="Update Record" class="buttonedit">Edit</a>
                            <a href='DeleteStaff.jsp?staff_id=<%= rs.getInt("staff_id")%>' title="Delete Record" class="buttondelete">Delete</a>
                        </td>
                <%}%>
                    </tr>
              </table>
    </body>
        <jsp:include page="footer.jsp" />
</html>
