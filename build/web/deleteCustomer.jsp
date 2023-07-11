<%@page import="com.mvc.dao.CustomerDAO"%>
<%@page import="com.mvc.bean.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/formcss.css">
        <title>Delete Customer</title>
    </head>
    <body>
        <%
            String cust_id = (request.getParameter("cust_id"));
            Customer cust;
            CustomerDAO dao = new CustomerDAO();
            cust = dao.getCustomer(cust_id);
        %>
        <div id="feedback-form"> 
        <h2 align="center">Delete Customer</h2>
         <form action = "CustomerServlet" method="POST">
            <table border="0" align="center">
            <tr>
                <td>Name:</td>
                <td><input type="text" name="cust_name" value="<%=cust.getCust_name()%>"/></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td> <input type="text" name="cust_gender" value="<%=cust.getCust_gender()%>"/></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td> <input type="text" name="cust_age" value="<%=cust.getCust_age()%>"/></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td> <input type="text" name="cust_phoneno" value="<%=cust.getCust_phoneno()%>"/></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td> <input type="text" name="cust_email" value="<%=cust.getCust_email()%>"/></td>
            </tr>
            <tr>
                <td>Username:</td>
                <td> <input type="text" name="cust_username" value="<%=cust.getCust_username()%>"/></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td> <input type="text" name="cust_password" value="<%=cust.getCust_password()%>"/></td>
            </tr>
            <tr>
                
                <td><input type="hidden" name = "operation" value="D"></input>
                    <input type="hidden" name="cust_id" value="<%=cust.getCust_id()%>"></input>
                    
                </td>
                <td><input type="submit" value="Delete" class="buttondelete"></input></td>
            </tr>
            </table>
        </form>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>

