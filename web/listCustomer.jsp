<%@page import="com.mvc.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.mvc.bean.Customer" %>
<%@page import = "com.mvc.dao.CustomerDAO" %>
<%@page import ="java.sql.*" %>
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
    Statement stmt = conn.createStatement(); //Create the statement
    String sql ="SELECT * FROM CUSTOMER ORDER BY cust_id";
    
    ResultSet rs = stmt.executeQuery(sql);
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Customer</title>
        <link rel="stylesheet" href="css/formcss.css">
         <link rel="stylesheet" href="css/table.css">
         <style>
        
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
    <center>
    <body>
        <h1 color="black">List Customer</h1>
         <%--Presentation Code--%>
                <table border="1" align="center">
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Username</th>
                        <th>Action</th>
                    </tr>
                    
                     <%
                        while(rs.next())
                        {
                     %>
                    <tr>
                        <td><%=rs.getString("cust_id")%></td>
                        <td><%=rs.getString("cust_name")%></td>
                        <td><%=rs.getString("cust_gender")%></td>
                        <td><%=rs.getString("cust_age")%></td>
                        <td><%=rs.getString("cust_phoneno")%></td>
                        <td><%=rs.getString("cust_email")%></td>
                        <td><%=rs.getString("cust_username")%></td>
                        <td>
                            <a href='updateCustomer.jsp?cust_id=<%= rs.getString("cust_id")%>' title="Update Record" class="buttonedit">Edit</a><br>
                            <a href='deleteCustomer.jsp?cust_id=<%= rs.getString("cust_id")%>' title="Update Record" class="buttondelete">Delete</a>
                        </td>
                        <%}%>
                    </tr>
                </table>
        
       
    </body>
    </center>
    <jsp:include page="footer.jsp" />
</html>

