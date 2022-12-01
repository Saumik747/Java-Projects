<%-- 
    Document   : stuprof
    Created on : Jan 13, 2022, 9:11:18 AM
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
        <title>Profile</title>
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
            .register{
                max-width:1000px;
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
                <nav class="nav text-center">
                    <ul class="print">
                        <li><a href="stuindex.jsp">Welcome <%=name%></a> </li> 
                         <li>  <form action="stuprof.jsp">
            <input type="hidden" name="email" value="<%= email%>"/>
            <input type="hidden" name="name" value="<%=name%>"/>
                        <input type="hidden" name="course" value="<%=course%>"/>
                        <input type="hidden" name="semester" value="<%=semester%>"/>
                        <input type="hidden" name="rollno" value="<%=roll%>"/>
                        
                        <input type="submit" class="btn btn-primary" value="View profile"/>
        </form> </li> 
                        <li><a href="logout.jsp?user=student">logout</a></li> 
                      
                    </ul>
                </nav>
            </header>
            
            <div class="register">
                   <sql:query dataSource="${db}" var="sturec">
            Select * from student where email='${param.email}'AND course='${param.course}' AND semester='${param.semester}';
           
        </sql:query>
            
            <h1>Your Profile Details</h1>
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
                   
                    <td class="print"><a href="stuedit.jsp?id=<c:out value="${table.id}"/>">edit profile</a>                        
                         <form action="stures.jsp">
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
