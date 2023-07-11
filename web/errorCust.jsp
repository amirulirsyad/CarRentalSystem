<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/formcss.css">
        <title>Add customer error</title>
    </head>
    <body>
        <jsp:include page="menuStaff.jsp"/>
          <div id="feedback-form"> 
        <h1>Add customer error</h1>
         <%
            List errorMsgs = (List)request.getAttribute("errorMsgs");
            if(errorMsgs != null){
        %>
        <br>
        <font color = "red">
            Please correct the following errors:
            <ul>
                <%
                    Iterator items = errorMsgs.iterator();
                    while(items.hasNext()){
                        String message = (String) items.next();
                %>
                    <li><%= message %></li>
                <% } %>
            </ul>
        </font>
        <% } %>
        <br>
        
         <form action = "customerServlet" method="POST">
            Name        : <input type="text" name="cust_name" value="${param.cust_name}"><br>
            Gender      : <input type="text" name="cust_gender" value="${param.cust_gender}"><br>
            Age         : <input type="text" name="cust_age" value="${param.cust_age}"><br>
            Phone Number: <input type="text" name="cust_phoneno" value="${param.cust_phoneno}"><br>
            Email       : <input type="text" name="cust_email" value="${param.cust_email}"><br>
            Username    : <input type="text" name="cust_username" value="${param.cust_username}"><br>
            Password    : <input type="text" name="cust_password" value="${param.cust_password}"><br>
            <br>
            <button type="submit">Save</button> 
               <button type="reset">Reset</button>
            <input type="hidden" name="operation" value="C">
         </form><br>
          </div>
    </body>
     <jsp:include page="footer.jsp" />
</html>

