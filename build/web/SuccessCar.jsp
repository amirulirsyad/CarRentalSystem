<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="car" scope="request" type="com.mvc.bean.Car"/>
<%
    String username = (String)session.getAttribute("userName"); //get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }

    String operation = request.getParameter("operation");
%>
<jsp:include page="menuStaff.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/formcss.css">
        <title>Car Rental System: Success Page</title>
    </head>
    <body>
        <div id="feedback-form"> 
        <%
        if(operation.equals("C"))
        { %>
            <h1>Successfully Add Car</h1> 

            You have add the following car information:<br> 
            Car Plate Number: <jsp:getProperty name="car" property="car_plateno"/><br> 
            Car Model: <jsp:getProperty name="car" property="car_model"/><br> 
            Car Status: <jsp:getProperty name="car" property="car_status"/><br>
            Car Rent Price Per Day: RM<jsp:getProperty name="car" property="car_rentprice"/><br>
        <%
        }
        if(operation.equals("U"))
        { %>
            <h1>Successfully Update Car</h1> 

            You have update the following car information:<br> 
            Car Plate Number: <jsp:getProperty name="car" property="car_plateno"/><br> 
            Car Model: <jsp:getProperty name="car" property="car_model"/><br> 
            Car Status: <jsp:getProperty name="car" property="car_status"/><br>
            Car Rent Price Per Day: RM<jsp:getProperty name="car" property="car_rentprice"/><br>
        <%
        }
        if(operation.equals("D"))
        { %>
            <h1>Successfully Delete Car</h1> 

            You have delete the following car information:<br> 
            Car Plate Number: <jsp:getProperty name="car" property="car_plateno"/><br> 
            Car Model: <jsp:getProperty name="car" property="car_model"/><br> 
            Car Status: <jsp:getProperty name="car" property="car_status"/><br>
            Car Rent Price Per Day: RM<jsp:getProperty name="car" property="car_rentprice"/><br>
        <%
        }
        %>

        </div>
    </body>
         <jsp:include page="footer.jsp" />
</html>
