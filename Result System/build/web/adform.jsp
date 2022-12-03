<%-- 
    Document   : adform
    Created on : Jan 11, 2022, 8:10:05 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>
  <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
        url="jdbc:mysql://localhost:3306/onlresult" 
        user="root" password="" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student list</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
 <style>
            table,tr,td{
                border:1px solid black;
            }
            
              @media print{
    .print{
        display:none;
    }
}

header{
    background-color:orange;
}

.nav a{
    background-color:lightblue;
    color:white;
    padding:10px;
}
.register{
    max-width:900px;
}
            </style>
    </head>
    <body>
         <%
               String admin=(String)session.getAttribute("admin");
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("admin.jsp?message=please login with correect credentials");
        }
        %>
        
        <div>
             
             <header>
                <h1 class="text-center">Online Result System Admin Section</h1>
                <nav class="nav text-center print">
                    <ul>
                        <li> <a href="adindex.jsp">Welcome <%=admin%> </a></li> 
                        <li> <a href="adform.jsp">View List of Students </a></li> 
                        <li><a href="adsub.jsp">Add course or Subject </a></li> 
                        <li> <a href="viewsub.jsp">view course and  Subject </a></li>
                        <li><a href="logout.jsp?user=admin">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="register">
                  <form action="studentrec.jsp" method="get">
           
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
            <label for="">Select SEM</label>
            <select name="semester" id="">
               
                <option value="1">Sem1 </option>
                <option value="2">Sem2 </option>
                <option value="3">Sem3 </option>
                <option value="4">Sem4 </option>
                <option value="5">Sem5 </option>
                <option value="6">Sem6 </option>
                <option value="7">Sem7 </option>
                <option value="8">Sem8 </option>
            </select>
        
        </div>
            
            <div>
                <input type="submit" value="login"/>
            </div>
        </form>
            </div>
        </div>
      
    </body>
</html>
