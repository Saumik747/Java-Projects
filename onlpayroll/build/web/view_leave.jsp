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
        <title>Leave Applied</title>
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
            <div class="row">
                <div class="col-md-12">
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
                                <li> <a href ='logout.jsp'>Logout </a></li> </ul>
                        </nav>
                    </div>
                                
                                <div class="register">
                                     <sql:query dataSource="${db}" var="showleave" >
            select * from emp_leave where email='<%=email%>';
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
                <h3>Congratulations!, You have applied for  0 leaves</h3>
                <a href ='emp_leave.jsp'>Apply For leave if you want</a>
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
