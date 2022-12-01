<%-- 
    Document   : emp
    Created on : Jan 15, 2022, 3:52:40 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Login</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    </head>
    <body>
        <div class="register">
             <h1 class="text-center">Employee Login</h1>
            <hr>
             <form action ="employee" method="post">
                 <div>
                     <label>Enter Email</label>
                     <input type="email" id="login" class="fadeIn second" name="email" placeholder="enter email" required />
                 </div>
                 
                 <div>
                        <label>Enter Password</label>
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
                 </div>
                 <div>
                     <a href ="register.jsp">register</a>
                     <br>
                      <input type="submit" class="fadeIn fourth" value="login">
                    
                 </div>
<!--                    <input type="reset" class="fadeIn fourth" value="reset/clear">-->

<!--                    <input type="submit" class="submit" value="login" />

                    <input type="reset" class="reset" value="reset/clear" />-->



                </form>
        </div>
    </body>
</html>
