<%-- 
    Document   : admin
    Created on : Jan 11, 2022, 6:02:10 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
      <style>
          .register{
              margin-top:100px;
              margin-bottom:100px;
              max-width:500px;
          }
     </style>
    </head>
    <body>
       
        <div class="register">
             <h1 class="text-center">Online payroll System</h1>
             <hr>
            <h1 class="text-center">Admin Login</h1>
            <hr>
          <form action="admin" method="post">
            <div>
                <label>Enter Name</label>
                <input type="email" name="email" placeholder="eg:- saumik@somaiya.edu" />
            </div>
             <div>
                <label>password</label>
                <input type="password" name="password" placeholder="Enter Your Password" />
            </div>
             
            
            <div>
                <input type="submit" value="login"/>
            </div>
        </form>
        </div>
    </body>
</html>
