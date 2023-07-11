<%@page import="com.mvc.dao.CarDAO"%>
<%@page import="com.mvc.bean.Car"%>
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
        <title>Car Rental System: Update Car</title>
    </head>
    <body>
         <div id="feedback-form">
        <h1>Update Car</h1>
        <%
            int car_id = Integer.parseInt(request.getParameter("car_id"));
            Car cr;
            CarDAO dao = new CarDAO();
            cr = dao.getCar(car_id);
         %>
        <form action="CarServlet" method="POST">
            <table>
                <tr>
                    <td>Car Plate Number</td>
                    <td><input type="text" name="car_plateno" value="<%=cr.getCar_plateno()%>"></td>
                </tr>
                <tr>
                    <td>Car Model</td>
                    <td><input type="text" name="car_model" value="<%=cr.getCar_model()%>"></td>
                </tr>
                <tr>
                    <td>Car Status</td>
                    <td><input type="text" name="car_status" value="<%=cr.getCar_status()%>"></td>
                </tr>
                <tr>
                    <td>Car Rent Price Per Day</td>
                    <td><input type="text" name="car_rentprice" value="<%=cr.getCar_rentprice()%>"></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="operation" value="U"/>
                        <input type="hidden" name="car_id" value="<%=cr.getCar_id()%>"/>
                    </td>
                    <td>
                        <input type="submit" value="Update" class="buttonedit"/>
                    </td>
                </tr> 
            </table>        
         </form>
         </div>
    </body>
</html>
