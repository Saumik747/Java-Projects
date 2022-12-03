<%-- 
    Document   : error
    Created on : Dec 8, 2021, 11:23:52 AM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Error is reported</h1>
        
        <h2>
            <%=exception%>
        </h2>
        
        <h2>
            <% exception.printStackTrace(new PrintWriter(out));%>
        </h2>
    </body>
</html>
