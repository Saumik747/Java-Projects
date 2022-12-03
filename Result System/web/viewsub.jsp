<%-- 
    Document   : viewsub
    Created on : Jan 12, 2022, 1:25:54 PM
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
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
          <style>
            table,tr,td{
                border:1px solid black;
            }
            table{
                margin-left: auto;
                margin-right:auto;
            }
            </style>
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
                             <h1>All courses</h1>
        
        <table>
            <tr>
            <td>id</td>
            <td>course</td>
             
            </tr>
             <sql:query dataSource="${db}" var="rs">
                    Select * from course;
                </sql:query>
             <c:forEach var="table" items="${rs.rows}">
            <tr>
                 
               
                    <td><c:out value="${table.id}"/></td>
                    <td><c:out value="${table.c_name}"/></td>            
            
            </tr>
            </c:forEach>   
        </table>

        
        <div>
            <h1> All subjects</h1> 
            
        </div>
        
         <table>
            <tr>
            <td>id</td>
            <td>course</td>
            <td>SEM</td>
            <td>Subject name</td>
            </tr>
            
            <sql:query dataSource="${db}" var="rs">
                    Select * from course;
                </sql:query>
                <c:forEach var="table" items="${rs.rows}">
            <tr>
                 
                    <td><c:out value="${table.id}"/></td>
                    <td><c:out value="${table.c_name}"/></td>            
            
                    <td></td>
                    <td></td>
                   
                    
            </tr>
            </c:forEach>
           
                <sql:query dataSource="${db}" var="rs">
                    Select * from course;
                </sql:query>
                
                    <c:forEach var="table" items="${rs.rows}">          
             <sql:query dataSource="${db}" var="rs">
                    Select * from subject where c_id=${table.id};
                </sql:query>
                <c:forEach var="tbl" items="${rs.rows}">
                     <tr>
                         <td><c:out value="${table.id}"/></td>
                    <td><c:out value="${table.c_name}"/></td>
                    <td><c:out value="${tbl.sem_id}"/></td>
                    <td><c:out value="${tbl.sname}"/></td>  
                     </tr>
            </c:forEach>    
                   
            </c:forEach>
                
           
         </table>
                        </div>
        </div>
       
        

    </body>
</html>
