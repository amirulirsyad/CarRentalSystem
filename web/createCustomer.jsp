<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.mvc.bean.Customer" %>
<%@page import = "com.mvc.dao.CustomerDAO" %>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Customer</title>
       <style>
        body {
            padding: 0px;
            background-image: url("bg3.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100%; 
        }
         
        #feedback-form {
          width: 280px;
          margin: 0 auto;
          background-color: #fcfcfc;
          padding: 60px 90px 80px;
          box-shadow: 1px 4px 10px 1px #aaa;
          font-family: sans-serif;
        }

        #feedback-form * {
            box-sizing: border-box;
        }

        #feedback-form h1{
          text-align: center;
          margin-bottom: 30px;
        }

        #feedback-form input {
          margin-bottom: 15px;
        }

        #feedback-form input[type=text] {
          display: block;
          height: 32px;
          padding: 6px 16px;
          width: 100%;
          border: none;
          background-color: #f3f3f3;
        }

        #feedback-form label {
          color: #777;
          font-size: 0.8em;
        }

        #feedback-form input[type=checkbox] {
          float: left;
        }

        #feedback-form input:not(:checked) + #feedback-phone {
          height: 0;
          padding-top: 0;
          padding-bottom: 0;
        }

        #feedback-form #feedback-phone {
          transition: .3s;
        }

        #feedback-form button[type=submit] {
          display: block;
          margin: 20px auto 0;
          width: 150px;
          height: 40px;
          border-radius: 25px;
          border: none;
          color: #eee;
          font-weight: 700;
          box-shadow: 1px 4px 10px 1px #aaa;

          background: #207cca; /* Old browsers */
          background: -moz-linear-gradient(left, #207cca 0%, #9f58a3 100%); /* FF3.6-15 */
          background: -webkit-linear-gradient(left, #207cca 0%,#9f58a3 100%); /* Chrome10-25,Safari5.1-6 */
          background: linear-gradient(to right, #207cca 0%,#9f58a3 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
          filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#207cca', endColorstr='#9f58a3',GradientType=1 ); /* IE6-9 */
        }
        #feedback-form button[type=reset] {
          display: block;
          margin: 20px auto 0;
          width: 150px;
          height: 40px;
          border-radius: 25px;
          border: none;
          color: #eee;
          font-weight: 700;
          box-shadow: 1px 4px 10px 1px #aaa;

          background: #207cca; /* Old browsers */
          background: -moz-linear-gradient(left, #207cca 0%, #9f58a3 100%); /* FF3.6-15 */
          background: -webkit-linear-gradient(left, #207cca 0%,#9f58a3 100%); /* Chrome10-25,Safari5.1-6 */
          background: linear-gradient(to right, #207cca 0%,#9f58a3 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
          filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#207cca', endColorstr='#9f58a3',GradientType=1 ); /* IE6-9 */
        }
    </style>
    </head>
    <body>
     <div id="feedback-form">
        <h1 align="center">Add New Customer</h1>
        <form action="CustomerServlet" method="POST">
            <table align="center">
                <tr>
                    <td><label>Name: </label></td>
                    <td><input type="text" name="cust_name"></td>
                </tr>
                <tr>
                    <td><label>Gender: </label></td>
                    <td><input type="text" name="cust_gender"></td>
                </tr>
                <tr>
                    <td><label>Age: </label></td>
                    <td><input type="text" name="cust_age"></td>
                </tr>
                 <tr>
                    <td><label>Phone number: </label></td>
                    <td><input type="text" name="cust_phoneno"></td>
                </tr>
                <tr>
                    <td><label>Email: </label></td>
                    <td><input type="text" name="cust_email"></td>
                </tr>
                <tr>
                    <td><label>Username: </label></td>
                    <td><input type="text" name="cust_username"></td>
                </tr>
                <tr>
                    <td><label>Password: </label></td>
                    <td><input type="text" name="cust_password"></td>
                </tr>
                <!--<tr>
                     <td><label>Customer ID: </label></td>
                             <td><select name="cust_id">
                                     <%--<%  //Iterate over the ResultSet
                                        while(rs.next()){ 
                                     %>
                                     <option value="<%=rs.getString("CUST_ID") %>">
                                        <%=rs.getString("CUST_NAME")%>
                                     </option>
                                     <% }%>--%>
                        </select>
                        
                     </td>
                </tr>!-->
                <tr>
                    <td><input type="hidden" name="operation" value="C" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Save" class="buttonbasic">
                        <input type="reset" value="Reset" class="buttonbasic">
                    </td>
                </tr>
             
            </table>
                         <p>Already have account? <a href="login.jsp">Sign in</a>
        </form>
     </div>       
    </body>
</html>


