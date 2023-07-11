<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp"/>
<%
    String username = (String)session.getAttribute("userName"); //get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }
%>
<!DOCTYPE html>
<jsp:useBean id="staff" scope="request" type="com.mvc.bean.Staff"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <a href="../src/java/com/mvc/controller/StaffServlet.java"></a>
        <link rel="stylesheet" href="css/formcss.css">
        <title>Add Staff Success</title>
    </head>
    <body>
        <div id="feedback-form">
        <h3>Add Staff Success</h3>
        You have add the following staff: <br>
        Name: <jsp:getProperty name="staff" property="staff_name"/><br>
        Gender: <jsp:getProperty name="staff" property="staff_gender"/><br>
        Age: <jsp:getProperty name="staff" property="staff_age"/><br>
        Phone No: <jsp:getProperty name="staff" property="staff_phoneno"/><br>
        Email: <jsp:getProperty name="staff" property="staff_email"/><br>
        Username: <jsp:getProperty name="staff" property="staff_username"/><br>
        Password: <jsp:getProperty name="staff" property="staff_password"/><br>
        <br><button><a href="index.jsp">Home</a></button>
    </body>
    </div>
     <jsp:include page="footer.jsp" />
</html>
