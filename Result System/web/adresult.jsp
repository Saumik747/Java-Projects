<%-- 
    Document   : adresult
    Created on : Jan 11, 2022, 11:47:54 PM
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
        <title>Upload Result</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <style>
            table,tr,td{
                border:1px solid black;
            }
            
            .register{
                max-width:900px;
            }
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
                     <sql:query dataSource="${db}" var="chkres">
            Select * from result where c_id=${param.course} and sem_id=${param.semester} and email='${param.email}';
        </sql:query>
            <c:if test="${chkres.rowCount >0}">
                <h1>  record exists for this student </h1>
            </c:if>   
                 <c:if test="${chkres.rowCount < 1}">
                <h1>Upload result</h1>
                     <table>
             <sql:query dataSource="${db}" var="stures">
            Select * from subject where c_id=${param.course} and sem_id=${param.semester};
        </sql:query>
             
                 <tr>
                     <td>Subject name</td>
                     <c:forEach var="restable" items="${stures.rows}">
                         <td>
                             <c:out value="${restable.sname}"/>
                         </td>
                         </c:forEach>
                 </tr>
                 
                 <tr>
                     <td>Marks</td>
                 <form action="updresult.jsp" method="get">
                      <input type="hidden" name="email" value="<c:out value="${param.email}"/>"/>
                        <input type="hidden" name="course" value="<c:out value="${param.course}"/>"/>
                        <input type="hidden" name="semester" value="<c:out value="${param.semester}"/>"/>
                        <input type="hidden" name="rollno" value="<c:out value="${param.rollno}"/>"/>
                     <c:forEach var="restable" items="${stures.rows}">
                         <td>
                            
                             <input type="text" name="s<c:out value="${restable.s_id}"/>" placeholder="enter marks" />
                             
                         </td>
                         </c:forEach>
                         <td><input type="submit" value="Update Result"/></td>
                 </form> 
                 </tr>
                 
             
        </table>
            </c:if>
            </div>
        </div>
         
    </body>
</html>
