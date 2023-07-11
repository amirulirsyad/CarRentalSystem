<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuStaff.jsp"/>
<%
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
        <title>Car Rental System: Add Car</title>
    </head>
    <body>
        <div id="feedback-form">
        <h1>Add Car</h1>
        <form action="CarServlet" method="POST">
            <table>
                <tr>
                    <td>Car Model</td>
                    <td><input type="text" name="car_model"></td>
                </tr>
                 <tr>
                    <td>Car Plate Number</td>
                    <td><input type="text" name="car_plateno"></td>
                </tr>
                <tr>
                    <td>Car Status</td>
                    <td><input type="text" name="car_status"></td>
                </tr>
                <tr>
                    <td>Car Rent Price Per Day</td>
                    <td><input type="text" name="car_rentprice"></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="operation" value="C"></td>
                    <td>
                        <input type="submit" value="Save" class="buttonbasic">
                        <input type="reset" value="Reset" class="buttonbasic">
                    </td>
                </tr>
            </table>
        </form>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
