<%-- 
    Document   : studentrec
    Created on : Jan 11, 2022, 8:19:10 PM
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
    max-width:100%;
}
</style>
    </head>
    <body>
         <%
             String admin=(String)session.getAttribute("admin");
        out.println();
        int course=Integer.parseInt(request.getParameter("course"));
        int sem=Integer.parseInt(request.getParameter("semester"));
         
        if(admin==null)
        {
            response.sendRedirect("admin.jsp?message=please login with correect credentials");
        }
//out.println("course id: "+course);
//out.println("sem id: "+sem);
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
                        <li><a href="logout?user=admin">Logout</a></li>
                    </ul>
                </nav>
            </header>
            
            <div class="register text-center">
                  <h1 class="print"></h1>
        
                   <h1>Student Records</h1>
          <sql:query dataSource="${db}" var="sturec">
            Select * from student where  course='${param.course}' AND semester='${param.semester}';
           
        </sql:query>
            
            <table style="margin-left: auto;margin-right: auto;">
                <tr>
                    <td>SR no</td>
                    <td>Name</td>
                    <td>email</td>
                    <td>Address</td>
                    <td>Mob no</td>
                    <td>Gender</td>
                    <td>Course</td>
                    <td>Semester</td>
                    <td>Rollno</td>
                    <td class="print">Action</td>
                </tr>
                
                <c:forEach var="table" items="${sturec.rows}">
                  <tr>
                    <td><c:out value="${table.id}"/></td>
                    <td><c:out value="${table.name}"/></td>
                    <td><c:out value="${table.email}"/></td>
                    <td><c:out value="${table.address}"/></td>
                    <td><c:out value="${table.mobno}"/></td>
                    <td><c:out value="${table.gender}"/></td>
                    <td><c:out value="${table.course}"/></td>
                    <td><c:out value="${table.semester}"/></td>
                    <td><c:out value="${table.rollno}"/></td>
                   
                    <td class="print"><a href="adedit.jsp?id=<c:out value="${table.id}"/>">edit</a>
                    <a href="adupdate.jsp?action=delete&id=<c:out value="${table.id}"/>">delete</a>
                    
                    <form action="adresult.jsp">
                        <input type="hidden" name="id" value="<c:out value="${table.id}"/>"/>
                        <input type="hidden" name="email" value="<c:out value="${table.email}"/>"/>
                        <input type="hidden" name="course" value="<c:out value="${table.course}"/>"/>
                        <input type="hidden" name="semester" value="<c:out value="${table.semester}"/>"/>
                        <input type="hidden" name="rollno" value="<c:out value="${table.rollno}"/>"/>
                        <input type="submit" name="action" value="upload"/>
                         <input type="submit" name="action" value="edit"/>
                    </form>
                        
                         <form action="showres.jsp">
                        <input type="hidden" name="id" value="<c:out value="${table.id}"/>"/>
                        <input type="hidden" name="name" value="<c:out value="${table.name}"/>"/>
                        <input type="hidden" name="email" value="<c:out value="${table.email}"/>"/>
                        <input type="hidden" name="course" value="<c:out value="${table.course}"/>"/>
                        <input type="hidden" name="semester" value="<c:out value="${table.semester}"/>"/>
                        <input type="hidden" name="rollno" value="<c:out value="${table.rollno}"/>"/>
                        <input type="submit" value="show result"/>
                    </form>
                    </td>
                </tr>   
                </c:forEach>   
                
                
                
            </table>
            
            <button class="print" onclick="window.print()">Print</button>
            </div>
        </div>
      
        
       
      
    </body>
</html>
