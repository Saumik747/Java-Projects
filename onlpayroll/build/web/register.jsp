<%-- 
    Document   : register
    Created on : Jan 11, 2022, 3:48:12 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Registration</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />

        <script>
            function chkval()
            {
                var passwd = document.getElementById("password").value;
                var cpasswd = document.getElementById("cpassword").value;
            }
        </script>
    </head>
    <body>
        <div class="register">
            <h1>Register Yourself</h1>
            <hr>
            <form action="register" method="post" onsubmit="chkval()">
                <div>
                    <label for="">Enter name: </label> 
                    <input type="text" name="name" required />
                </div>

                <div>
                    <label for="">Enter Email: </label>
                    <input type="email" name="email" required />
                </div>

                <div>
                    <label for="">Enter Password: </label>
                    <input type="password" name="password" id="password" required />
                </div>

                <div>
                    <label for="">confirm Password: </label>
                    <input type="password" name="cpassword" id="cpassword" required />
                </div>

                <div>
                    <label for="">Enter Address </label>
                    <input type="text" name="address" id="" required/>
                </div>
                <div>
                    <label for="">Enter date of birth</label>
                    <input type="date" name="dob" required >
                </div>

                <div>
                    <label for="">Enter Mobile no </label>
                    <input type="number" name="mobno" id="mobno" onkeypress="chknum()" required/>
                </div>


                <div>
                    <label for="">Select Gender</label>
                    <select name="gender">
                        <option value="male" selected>Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>

                <div>
                    <label for="department"><b>Department: </b></label>
                    <input type="text" placeholder="Enter Department" name="dept" required>
                </div>
                
                <div>
                    <label for="">Enter Date of Joining</label>
                    <input type="date" name="joindate" required/>

                </div>



                <div>
                    <input type="submit" value="Register">
                </div>

            </form>
        </div>
    </body>
</html>
