<%-- 
    Document   : emp_pro
    Created on : 13 Jan, 2022, 1:13:06 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/onlpayroll" 
                   user="root" password="" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<style>
    .header{
        background-color:orange;
    }
    h1{
        background-color:lightblue;
        text-align:center;
    }
</style>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("employee");
            String email = (String) session.getAttribute("email");
            if(name==null)
            {
                response.sendRedirect("emplogin.jsp");
            }

        %>
        
        
        <div class="container-fluid">
            <div class="row" >
                <div class="col-md-12 text-center">
                    <div class="header">
                          <h1 class="text-center">Online Payroll System</h1>
                          <nav class="navbar nav" style="margin-left:auto;margin-right:auto;">
                              <ul>
                                   <li> <a href ='empindex.jsp'>Hello  <%=name%></a></li>
                                  <li> <a href ='empsal.jsp?email=<%=email%>'>Generate Salary Slip</a></li>
                                  <li> <a href ='emp_pro.jsp'>view profile</a></li>
                                  <li> <a href ='empedit.jsp?email=<%=email%>'>Edit profile</a></li>
                                  <li> <a href ='emp_leave.jsp'>Apply For leave</a></li>
                                  
            <li> <a href ='view_leave.jsp'>view leave applied </a></li>
            <li> <a href ='logout.jsp'>Logout </a></li>
           
            
           
            
           
            
            
                              </ul>
                          </nav>
        </div>
                
            <div>
                
                <br><br><br>
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url
                           ="jdbc:mysql://localhost:3306/onlpayroll" user="root" password="" />
        <sql:query dataSource="${ds}" var="result">
            SELECT * from emp where email='<%=email%>';
        </sql:query>
        <h1>Account Details</h1>
       <hr>
        <div class="container">
            <table class="table" >
                <thead>
                    <tr class="" style="background-color:black;color:white;">
                        <th>Id</th>
                        <th>User Name</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Dept</th>
                        <th>Date of Joining</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>City</th>
                        <th>date of joining</th>
                    </tr>
                </thead>
                <c:forEach var="row" items="${result.rows}">
                    <tbody>
                        <tr class="" style="background-color:lightblue; color:white;">
                            <td><c:out value="${row.id}"/></td>
                            <td><c:out value="${row.name}"/></td>
                            <td><c:out value="${row.password}"/></td>
                            <td><c:out value="${row.email}"/></td>
                            <td><c:out value="${row.dept}"/></td>

                            <td><c:out value="${row.dob}"/></td>
                            <td><c:out value="${row.gender}"/></td>
                            <td><c:out value="${row.mobno}"/></td>
                            <td><c:out value="${row.address}"/></td>
                            <td><c:out value="${row.joindate}"/></td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <div>
            <button onclick="window.print()">
                print
            </button>
        </div>
        </div>
        </div>
            </div>
        </div>
    </body>
</html>

