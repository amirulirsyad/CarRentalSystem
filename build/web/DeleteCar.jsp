<%@page import="com.mvc.bean.Car"%>
<%@page import="com.mvc.dao.CarDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menuStaff.jsp"/>
<%
    int car_id = Integer.parseInt(request.getParameter("car_id"));
    Car cr;
    CarDAO dao = new CarDAO();
    cr = dao.getCar(car_id);
    
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
        <title>Car Rental System: Delete Car</title>
    </head>
    <body>
        <div id="feedback-form">
        <h1>Delete Car</h1>
        <form action="CarServlet" method="POST">
           <table>
               <tr>
                   <td>Car Plate Number</td>
                   <td><input type="text" name="car_plateno" value="<%=cr.getCar_plateno()%>" readonly></td>
               </tr>
               <tr>
                   <td>Car Model</td>
                   <td><input type="text" name="car_model" value="<%=cr.getCar_model()%>" readonly></td>
               </tr>
               <tr>
                   <td>Car Status</td>
                   <td><input type="text" name="car_status" value="<%=cr.getCar_status()%>" readonly></td>
               </tr>
               <tr>
                   <td>Car Rent Price</td>
                   <td><input type="text" name="car_rentprice" value="<%=cr.getCar_rentprice()%>"  readonly></td>
               </tr>
               <tr>
                   <td>
                       <input type="hidden" name="operation" value="D"/>
                       <input type="hidden" name="car_id" value="<%=cr.getCar_id()%>"/>
                   </td>
                   <td>
                       <input type="submit" value="Delete" class="buttondelete"/>
                   </td>
               </tr> 
           </table>        
        </form>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
