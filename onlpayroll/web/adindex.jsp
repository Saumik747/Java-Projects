<%-- 
    Document   : adindex
    Created on : Jan 11, 2022, 6:02:23 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>
  <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
        url="jdbc:mysql://localhost:3306/onlpayroll" 
        user="root" password="" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Index</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    </head>
    <body>
        <%
            String admin=(String)session.getAttribute("admin");
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("admin.jsp?message=please+login+with+correect+credentials");
        }
        %>
        <div>
            <header>
                <h1 class="text-center">Payroll System Admin Section</h1>
            </header>
            
            <div class="register" >
                <h3>Welcome  <% out.println(session.getAttribute("admin")); %></h3>
                <h2>Menu</h2>
                <hr>
                <a href="emprec.jsp">View List of Employees </a>
                <br>
                <a href="ademp.jsp">Add employees </a>
                <br>
                <a href="logout.jsp?user=admin">Logout</a>
        </div>
        </div>
       
         
       
        
        
    </body>
</html>
