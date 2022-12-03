<%-- 
    Document   : student
    Created on : Jan 11, 2022, 6:01:30 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp"%>
<%@page session="true"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>
  <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
        url="jdbc:mysql://localhost:3306/onlresult" 
        user="root" password="" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    </head>
    <body>
        <div class="register">
            <h1 class="text-center">Student Login</h1>
            <hr>
            
              <form action="student" method="post">
            <div>
                <label>Enter Name</label>
                <input type="email" name="email" placeholder="eg:- saumik@somaiya.edu" />
            </div>
             <div>
                <label>password</label>
                <input type="password" name="password" placeholder="Enter Your Password" />
            </div>
             <div>
            <label for="">Select Course</label>
            <select name="course" id="">
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
                <a href="register.jsp">Register if new Student</a>
                <br>
                <input type="submit" value="login"/>
            </div>
        </form>
           
        </div>
      
    </body>
</html>
