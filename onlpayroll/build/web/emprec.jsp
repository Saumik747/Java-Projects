<%-- 
    Document   : emprec
    Created on : Jan 15, 2022, 4:10:42 PM
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
        <title>Employee list</title>
         <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<style>
    @media print{
    .print{
        display:none;
    }
}
header{
    background-color:lightblue;
}

.nav a{
    background-color:orange;
    color:white;padding:10px;
}

.register{
    max-width:100%;
}
.btn{
    margin:2px;
}
</style>
    </head>
    <body>
         <%
            String admin=(String)session.getAttribute("admin");
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("admin.jsp?message=please+login+with+correect+credentials");
        }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                     <header>
                <h1 class="text-center">Online Payroll System Admin Section</h1>
                <nav class="nav text-center">
                    <ul>
                        <li> <a href="adindex.jsp">Welcome <%=admin%> </a></li> 
                        <li> <a href="emprec.jsp">View List of employees </a></li> 
<li> <a href="ademp.jsp">Add employees </a></li>
                        <li><a href="logout?user=admin">Logout</a></li>
                    </ul>
                </nav>
            </header>
                    <div class="register text-center">
                  
        
                   <h1>Employee Records</h1>
          <sql:query dataSource="${db}" var="emprec">
            Select * from emp ;
           
        </sql:query>
            
            
	
            
            <table style="margin-left: auto;margin-right: auto;">
                <tr>
                    <td>SR no</td>
                    <td>Name</td>
                    <td>email</td>
                    <td>Address</td>
                    <td>Mob no</td>
                    <td>Gender</td>
                    <td>Department</td>
                   <td>Join Date</td>
                   
                    <td class="print">Action</td>
                </tr>
                
                <c:forEach var="table" items="${emprec.rows}">
                  <tr>
                    <td><c:out value="${table.id}"/></td>
                    <td><c:out value="${table.name}"/></td>
                    <td><c:out value="${table.email}"/></td>
                    <td><c:out value="${table.address}"/></td>
                    <td><c:out value="${table.mobno}"/></td>
                    <td><c:out value="${table.gender}"/></td>
                    <td><c:out value="${table.dept}"/></td>
                    <td><c:out value="${table.joindate}"/></td>
                    
                   
                    <td class="print"><a href="adedit.jsp?id=<c:out value="${table.id}"/>" class="btn btn-primary">edit</a>
                        <a href="adupdate.jsp?action=delete&id=<c:out value="${table.id}"/>" class="btn btn-danger">delete</a>
                    <br>
                    <a href="adsalary.jsp?id=<c:out value="${table.id}"/>" class="btn btn-success">Add Salary</a>
                    <a href="empsalary.jsp?id=<c:out value="${table.id}"/>&email=<c:out value="${table.email}"/>" class="btn btn-success">View Salary</a>
                     <a href="adleave.jsp?id=<c:out value="${table.id}"/>&email=<c:out value="${table.email}"/>&name=<c:out value="${table.name}"/>" class="btn btn-success">View Leaves</a>
                     <br>
                    </td>
                </tr>   
                </c:forEach>   
                
                
                
            </table>
            
            <button class="print" onclick="window.print()">Print</button>
            </div>
                </div>
            </div>
            
        </div>
    </body>
</html>
