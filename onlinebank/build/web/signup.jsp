<%-- 
    Document   : signup
    Created on : Jan 15, 22, 11:46:17 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,conn.connection;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up </title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <style>
            .in{
                padding:20px;
            }

            .form-control{
                /*                max-width:300px;
                                margin-left:auto;margin-right:auto;*/
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

                        <div class="menu">
                            <nav class="navbar navbar-expand-lg navbar-light">
                                <div class="px-2">
                                    <a class="navbar-brand" href="index.jsp">Login</a>
                                </div>
                                <div class="px-2">
                                    <a class="navbar-brand" href="#">Signup</a>
                                </div>
                                <div class="px-2">
                                    <a class="navbar-brand" href="aboutpage.jsp">About</a>
                                </div>
                                <div class="px-2">
                                    <a class="navbar-brand" href="#">Contact</a>
                                </div>
                            </nav>
                        </div>

                    </header>


                    <section class="text-center container"  style="border:1px solid black;margin-left:auto;margin-right:auto;max-width:900px;padding:30px;margin-top:5px;margin-bottom:5px;">
                        <div>
                            <h1>Signup for your account</h1>
                        </div>
                        <div>
                          
                            <form action="signup" method ="get" class="text-center row" >
                                <%
                                    Random ran = new Random();
                                    int first3 = (ran.nextInt() % 9000) + 1000;
                                    int pin = Math.abs(first3);

                                    long first7 = (ran.nextLong() % 90000000L) + 5040936000000000L;
                                    long accno = Math.abs(first7);
                                %>

                                <div class="col-md-6">
                                    <label for="03" class="form-label">Unique Pin</label>
                                    <input type="text" name="pin" class="form-control" value="<%out.println(pin);%>" required readonly>
                                </div>
                                <div class="col-md-6">
                                    <label for="" class="form-label">Username</label>
                                    <input type="text" name="uname" class="form-control" placeholder="enter name" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="" class="form-label">Name</label>
                                    <input type="text" name="name"class="form-control" placeholder="enter name" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="" class="form-label">Nominee name</label>
                                    <input type="text" name="nominee" class="form-control" placeholder="XYZ" >
                                </div>

                                 <div class="col-md-6">
                                    <label for="03" class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" aria-describedby="emailHelp" required>
                                </div>


                                <div class="col-md-3">
                                    <label for="03" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" required>
                                </div>

                                <div class="col-md-3">
                                    <label for="03" class="form-label">Confirm Password</label>
                                    <input type="password" name="cpassword" class="form-control" required>
                                </div>
                                <br>
                                 <div class="col-md-3">
                                    <label for="03" class="form-label">Mobile no</label>
                                    <input type="text" name="mobno" class="form-control" placeholder="" onkeypress="chknum()" required>
                                </div>
                                <div class="col-md-3">
                                    <label for="">Gender</label>
                                    <select name="gender" class="form-control" required>
                                        <option value="male" selected>Male</option>
                                        <option value="female" >Female</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="03" class="form-label">Enter Address</label>
                                    <input type="text" name="address" class="form-control" placeholder="Bombay" required>
                                </div>


                                <div class="col-md-4">
                                    <label for="05" class="form-label">Zip</label>
                                    <input type="text" name="zip" class="form-control" placeholder="400031" required>
                                </div>

                               
                                <div class="col-md-3">
                                    <label for="05" class="form-label">Date of Birth</label>
                                    <input type="date" name="dob" class="form-control" required>
                                </div>

                               
                                <br>
                                <div class="col-12 text-center">
                                    <h5 class="text-primary">Customer Personal Details</h5>
                                </div>



                                <div class="col-md-4">
                                    <label for="" class="form-label">Religion</label>
                                    <input type="text" name="religion"class="form-control" placeholder="Hindu" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="" class="form-label">Catogery</label>
                                    <input type="text" name="catogery" class="form-control" placeholder="General/OBC" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="03" class="form-label">Education</label>
                                    <input type="text" name="education" class="form-control" placeholder="Post,Under Gre." required>
                                </div>

                                <br>
                                <div class="col-12 text-center">
                                    <h5 class="text-primary">Customer Account Details</h5>
                                </div>
                                <div class="col-md-4">
                                    <label for="" class="form-label">Account No</label>
                                    <input type="password" name="account" class="form-control" value="<%out.println(accno);%>" readonly  required>
                                </div>
                                <div class="col-md-4">
                                    <label for="" class="form-label">Account Type</label>
                                    <input type="text" name="account_type" class="form-control" placeholder="saving/current" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="03" class="form-label">Opening Balance</label>
                                    <input type="number" name="balance" class="form-control" placeholder="Min 500" required>
                                </div>
                                <br>
                                <div class="col-12 text-center ">
                                    <br>
                                    <input type="submit" value="Register" class="btn btn-primary" />
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
