<%-- 
    Document   : index
    Created on : Jan 16, 2022, 8:55:28 AM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                                   url="jdbc:mysql://localhost:3306/onlbank"
                                   user="root" password="" />
<!DOCTYPE html>
<html>
    <head>
        <title>FYP Online Banking</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">

        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <style>

        </style>
        <script type="text/javascript">
            function ctck()
            {
                var sds = document.getElementById("dum");

            }
        </script>
        <style>
            .in{
                padding:20px;
            }

            .form-control{
                max-width:300px;
                margin-left:auto;margin-right:auto;
            }

            .title{
                background-color:orange;
                padding:10px;
                border-radius:10px;
            }
            header h1{
                padding:30px;
                text-align:center;
            }

            header,footer{
                background-color:lightblue;
                padding:10px;
            }
        </style>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <header>
                        <h1>
                            <span class="title">
                                FYP Bank pvt.ltd
                            </span>
                        </h1>

                        <a href="signup.jsp" class ="btn btn-primary">NEW ACCOUNT</a>

                    </header>
                   

                    <section class="text-center"  style="border:1px solid black;margin-left:auto;margin-right:auto;max-width:700px;padding:30px;margin-top:5px;margin-bottom:5px;">
                        <div>
                            <h1>Login to your bank account</h1>
                        </div>
                        <div>
                            <form action="forgot1.jsp" method ="POST" class="text-center" onsubmit="getdet()" >
                                <div>
                                    Username: <br><input type ="text" name ="uname" class="form-control" required/>
                                </div>

                                <div>
                                    Pin: <br> <input type="password" name="pin" class="form-control" required />
                                </div>
                                <div>

                                    <br>
                                    <a href="forgot.jsp" class ="btn btn-warning">Forgot password</a>
                                    <br>
                                    <br>

                                    <input type ="submit" name="action" value ="submit" class="btn btn-success" style="cursor:pointer;">

                                </div>



                            </form>
                        </div>
                    </section>

                    <footer   class="footer text-center" style =" bottom:0;font-size:18px;height:50px;" >
                        Copyright © By Saumik Dutta
                    </footer>

                    
                    

                    <script type="text/javascript">
                        document.onload = ctck();
                        
                    </script>



                </div>


            </div>
        </div>





    </body>
</html>
