<%@page import="com.mvc.bean.Rental"%>
<%@page import="com.mvc.dao.RentalDAO"%>
<%
    String username = (String)session.getAttribute("userName");
    String userID = (String)session.getAttribute("userID");//get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }
%>
<jsp:include page="menuStaff.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/formcss.css">
        <title>Delete Rental</title>
    </head>
    <body>
        <%
            int rent_id = Integer.parseInt(request.getParameter("rent_id"));
            Rental rent;
            RentalDAO dao = new RentalDAO();
            rent = dao.getRent(rent_id);
        %>
         <div id="feedback-form">
        <h1>Delete Rental Records</h1>
        <form action="RentalServlet" method="POST">
              <table>
                    <tr>
                        <td>Rental Date</td>
                        <td><input type="text" name="rent_rentdate" value="<%=rent.getRent_rentdate()%>"></td>
                    </tr>
                    <tr>
                        <td>Return Date</td>
                        <td><input type="text" name="rent_days" value="<%=rent.getRent_days()%>"></td>
                    </tr>
                    <tr>
                        <td>Total Payment</td>
                        <td><input type="text" name="rent_deposit" value="<%=rent.getRent_deposit()%>"></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td><input type="text" name="rent_status" value="<%=rent.getRent_status()%>"></td>
                    </tr>
                    <tr>
                        <td>Customer Id</td>
                        <td><input type="text" name="cust_id" value="<%=rent.getCust_id()%>"></td>
                    </tr>
                    <tr>
                        <td>Car Id</td>
                        <td><input type="text" name="car_id" value="<%=rent.getCar_id()%>"></td>
                    </tr>
                    <tr>
                        <td>Staff Id</td>
                        <td><input type="text" name="staff_id" value="<%=rent.getStaff_id()%>"></td>
                    </tr>
                    <tr>
                   <td>
                       <input type="hidden" name="operation" value="D"/>
                       <input type="hidden" name="rent_id" value="<%=rent.getRent_id()%>"/>
                   </td>
                   <td>
                       <input type="submit" value="Delete" class="buttondelete"/>
                   </td>
               </tr> 
              </table>
        </form>
         </div>
    </body>
          <jsp:include page="footer.jsp" />
</html>
