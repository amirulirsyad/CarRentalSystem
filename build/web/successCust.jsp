<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuStaff.jsp"/>
<!DOCTYPE html>
<jsp:useBean id="customer" scope="request" type="com.mvc.bean.Customer"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <a href="../src/java/com/mvc/servlet/customerServlet.java"></a>
         <link rel="stylesheet" href="css/formcss.css">
        <title>Add Customer Success</title> 
    </head>
    <body>
        <div id="feedback-form"> 
        <h1>Update Customer Success</h1>
        You have add the following customer:<br>
        Name: <jsp:getProperty name="customer" property="cust_name"/><br>
        Gender: <jsp:getProperty name="customer" property="cust_gender"/><br>
        Age: <jsp:getProperty name="customer" property="cust_age"/><br>
        Phone Number: <jsp:getProperty name="customer" property="cust_phoneno"/><br>
        Email: <jsp:getProperty name="customer" property="cust_email"/><br>
        Username: <jsp:getProperty name="customer" property="cust_username"/><br>
        Password: <jsp:getProperty name="customer" property="cust_password"/><br>
        <br><hr>
        <a href="indexStaff.jsp" class="buttonbasic">HOME</a>
        </div>       
    </body>
     <jsp:include page="footer.jsp" />
</html>
