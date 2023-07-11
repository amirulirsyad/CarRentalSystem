<%@page import="com.mvc.bean.Customer"%>
<%@page import="com.mvc.dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
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
        <title>Update Customer </title>  
        
    </head>
    <body> 
       <%
           String cust_id = request.getParameter("cust_id");
           Customer cust;
           CustomerDAO dao = new CustomerDAO();
           cust = dao.getCustomer(cust_id);
       %>
       <div id="feedback-form">
       <h2 align="center">Update Customer</h2>
       <form action="CustomerServlet" method="POST">
            <table border="0" align="center">
                <tr>
                    <td><label>Name: </label></td>
                    <td><input type="text" name="cust_name" value="<%=cust.getCust_name()%>"></td>
                </tr>
                <tr>
                    <td><label>Gender: </label></td>
                    <td><input type="text" name="cust_gender" value="<%=cust.getCust_gender()%>"></td>
                </tr>
                <tr>
                    <td><label>Age: </label></td>
                    <td><input type="text" name="cust_age" value="<%=cust.getCust_age()%>"></td>
                </tr>
                <tr>
                    <td><label>Phone Number: </label></td>
                    <td><input type="text" name="cust_phoneno" value="<%=cust.getCust_phoneno()%>"></td>
                </tr>
                <tr>
                    <td><label>Email: </label></td>
                    <td><input type="text" name="cust_email" value="<%=cust.getCust_email()%>"></td>
                </tr>
                <tr>
                    <td><label>Username: </label></td>
                    <td><input type="text" name="cust_username" value="<%=cust.getCust_username()%>"></td>
                </tr>
                <tr>
                    <td><label>Password: </label></td>
                    <td><input type="text" name="cust_password" value="<%=cust.getCust_password()%>"></td>
                </tr>
               
                <tr>
                    <td><input type="hidden" name="operation" value="U"/>
                    <input type="hidden" name="cust_id" value="<%=cust.getCust_id()%>"/>
                    </td>
                    <td><input type="submit" value="Update" class="buttonedit"></input></td>
                </tr>
            </table>       
         </form>
       </div>
    </body>
        <jsp:include page="footer.jsp" />
</html>

