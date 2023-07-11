<%@page import="com.mvc.dao.StaffDAO"%>
<%@page import="com.mvc.bean.Staff"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/formcss.css">
        <title>Edit Page</title>
    </head>
    <body>
        <%
            int staff_id = Integer.parseInt(request.getParameter("staff_id"));
            Staff stf;
            StaffDAO dao = new StaffDAO();
            stf = dao.getStaff(staff_id);
        %>
        <div id="feedback-form">
        <h2>Edit Staff</h2>
            <form action="StaffServlet" method="POST">
                <table border='0'>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="staff_name" value="<%=stf.getStaff_name()%>" ></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td><input type="text" name="staff_gender" value="<%=stf.getStaff_gender()%>" ></td>
                    </tr>
                    <tr>
                        <td>Age:</td>
                        <td><input type="text" name="staff_age" value="<%=stf.getStaff_age()%>" ></td>
                    </tr>
                    <tr>
                        <td>Phone No:</td>
                        <td><input type="text" name="staff_phoneno" value="<%=stf.getStaff_phoneno()%>" ></td>
                    <tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="staff_email" value="<%=stf.getStaff_email()%>" ></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="staff_username" value="<%=stf.getStaff_username()%>" ></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="text" name="staff_password" value="<%=stf.getStaff_password()%>" ></td>
                    </tr>
                    <tr>
                    <tr>
                        <td><input type="hidden" name="operation" value="U"/>
                            <input type="hidden" name="staff_id" value="<%=stf.getStaff_id()%>" />
                        </td>
                        <td><br><input type="submit" value="Update" class="buttonedit" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
            <jsp:include page="footer.jsp" />
</html>
