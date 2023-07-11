<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <title>CAR RENTAL SYSTEM</title>
    <script>
        function validate() {
        var username = document.form.username.value;
        var password = document.form.password.value;
        if (username==null || username=="") {
        alert("Username cannot be blank");
        return false;
        } else if(password==null || password=="") {
        alert("Password cannot be blank");
        return false;
        }
        }
    </script>
</head>
<body>
    <div id="feedback-form">
    <div style="text-align:center"><h1>WELCOME TO CAR RENTAL MANAGEMENT SYSTEM</h1> </div>
    <br>
    <form name="form" action="loginServlet" method ="post" onsubmit="return validate()">
    <!-- Do not use table to format fields. As a good practice use CSS -->
    <table align="center">
        <tr>
            <td>Username</td>
            <td><input type="text" name="username" /></td>
        </tr>
        <tr>
            <td> Password</td>
            <td> <input type="text" name="password" /></td>
        </tr>
        <tr> <!-- refer to the video to understand request.getAttribute() -->
            <td><span style="color:red">
            <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
            </span>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
               <button type="submit">Login</button> 
               <button type="reset">Reset</button>
            </td>
        </tr>
        <tr>
            <td colspan="2" style='text-align:center'>
                <p>Don't have account? <a href="createCustomer.jsp">Register now</a>
            </td>
        </tr>
    </table>
    </form>
    </div>
</body>
</html>

