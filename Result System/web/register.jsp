<%-- 
    Document   : register
    Created on : Jan 11, 2022, 3:48:12 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp"%>
<%@page session="true"%>
<%@include file= "connection.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />

    <script>
        function chkval()
        {
            var passwd=document.getElementById("password").value;
            var cpasswd=document.getElementById("cpassword").value;
        }
    </script>
    </head>
    <body>
        <h1 class="text-center">Online Result System</h1>
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
            <input type="text" name="mobno" id="mobno" onkeypress="chknum()" required/>
        </div>
                 

        <div>
            <label for="">Select Gender</label>
            <select name="gender">
                <option value="male" selected>Male</option>
                <option value="female" >Female</option>
            </select>
        </div>

        <div>
            <label for="">Select Course</label>
            <select name="course" id="" required>
                <sql:query dataSource="${db}" var="rs">
                    Select * from course;
                </sql:query>
                <c:forEach var="table" items="${rs.rows}">
                <option value="${table.id}">
                <c:out value="${table.c_name}"/>
            </option>
            </c:forEach>   
            </select>
        
        </div>

        <div>
            <input type="submit" value="Register">
        </div>

        </form>
        </div>
    </body>
</html>
