<%-- 
    Document   : stuindex
    Created on : Jan 11, 2022, 6:01:54 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.sql.*,javax.servlet.http.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<style>
    header{
    background-color:orange;
}

.nav a{
    background-color:lightblue;
    color:white;
    padding:10px;
}
</style>
    </head>
    <body>
        <%
        String name=(String)session.getAttribute("name");
        String email=(String)session.getAttribute("email");
        int course=(Integer)session.getAttribute("course");
        int semester=(Integer)session.getAttribute("semester");
        int roll=(Integer)session.getAttribute("roll");
        
if(name==null)
{
    response.sendRedirect("student.jsp?message=login+again");
}
        %>
                      
                          <div>
            <header>
                <h1 class="text-center">Online Result System </h1>
            </header>
            
            <div class="register" >
                <h3>Welcome  <% out.println(name); %></h3>
                <h2>Menu</h2>
                <hr>
                 <form action="stures.jsp">
            <input type="hidden" name="email" value="<%= email%>"/>
            <input type="hidden" name="name" value="<%=name%>"/>
                        <input type="hidden" name="course" value="<%=course%>"/>
                        <input type="hidden" name="semester" value="<%=semester%>"/>
                        <input type="hidden" name="rollno" value="<%=roll%>"/>
<!--                         <select name="semester" id="">
               
                <option value="1">Sem1 </option>
                <option value="2">Sem2 </option>
                <option value="3">Sem3 </option>
                <option value="4">Sem4 </option>
                <option value="5">Sem5 </option>
                <option value="6">Sem6 </option>
                <option value="7">Sem7 </option>
                <option value="8">Sem8 </option>
            </select>-->
                        <input type="submit" value="View Result"/>
        </form>
                <br>
                <form action="stuprof.jsp">
            <input type="hidden" name="email" value="<%= email%>"/>
            <input type="hidden" name="name" value="<%=name%>"/>
                        <input type="hidden" name="course" value="<%=course%>"/>
                        <input type="hidden" name="semester" value="<%=semester%>"/>
                        <input type="hidden" name="rollno" value="<%=roll%>"/>
                        
                        <input type="submit" value="View profile"/>
        </form>
                        <br>
                        
                        <a href="logout.jsp?user=student" class="btn btn-primary">logout</a>
<!--                        stures.jsp?email=saumikdutta203%40gmail.com&name=saumik+d1&course=1&semester=1&rollno=40-->
               
        </div>
        </div>
    </body>
</html>
