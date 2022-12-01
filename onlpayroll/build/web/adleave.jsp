<%-- 
    Document   : view_leave
    Created on : Jan 13, 2022, 9:36:03 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/rp" 
                   user="root" password="" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Applied by employee</title>
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
            String admin = (String) session.getAttribute("admin");
            String email = (String) session.getAttribute("email");
            if(admin==null)
            {
                response.sendRedirect("admin.jsp");
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
                                
                                <div class="register">
                                     <sql:query dataSource="${db}" var="showleave" >
            select * from emp_leave where email='${param.email}';
        </sql:query>

            <c:if test="${showleave.rowCount>0}">
                 <table class="table">
            <tr>
                <td>Srno</td>
                <td>Start date</td>
                <td>End Date</td>
                <td>Reason</td>
            </tr>


            <c:forEach var="rec"  items="${showleave.rows}" >
                <tr>
                    <td><c:out value="${rec.id}" /></td>
                    <td><c:out value="${rec.strt_dt}" /></td>
                    <td><c:out value="${rec.end_dt}" /></td>
                    <td><c:out value="${rec.reason}" /></td>
                </tr>

            </c:forEach>
        </table>
            </c:if>
            
            <c:if test="${showleave.rowCount<1}">
                <h3>Congratulations!,<c:out value="${param.name}" /> have applied for  0 leaves</h3>
                <a href="emprec.jsp">View List of employees </a>
            </c:if>

        <c:if test="${showleave.rowCount>1}" >
            <h1>Total leaves Applied <c:out value="${showleave.rowCount}" /></h1>
        </c:if>
                                </div>
                                
                                
                </div>
            </div> 
        
        </div>


       

        
    </body>
</html>
