<%-- 
    Document   : adupdate
    Created on : Jan 11, 2022, 10:36:54 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*;" %>
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
    </head>
    <body>
         <%
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("admin.jsp?message=please login with correect credentials");
        }
        %>
        <%
//        out.println(session.getAttribute("name"));
//        int id=Integer.parseInt(request.getParameter("id"));
//       
//        
//out.println(" id: "+id);

        %>
                 <c:choose>
                        <c:when test="${param.action=='update'}">
                              <sql:update dataSource="${db}" var="updsturec">
                    update student set 
                    name='${param.name}',address='${param.address}',email='${param.email}',mobno='${param.mobno}',
                    gender='${param.gender}',dob='${param.dob}',course='${param.course}',semester='${param.semester}',
                    rollno='${param.rollno}' where  id='${param.id}';
                </sql:update>
        <% 
          response.sendRedirect("adform.jsp?message=record+updated");
out.println("record updated");
        %> 
                        </c:when>
                    
                    
                    <c:when test="${param.action=='delete'}">
                         <sql:update dataSource="${db}" var="delsturec">
                   delete from student where  id='${param.id}';
                </sql:update>
        <% 
          response.sendRedirect("adform.jsp?message=record+deleted");
//out.println("record deleted");
        %>
                        
                    </c:when>
                    
                     <c:otherwise>
          <h1>Table Records</h1>
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
                    <td>Action</td>
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
                    <td><a href="adedit.jsp?id=<c:out value="${table.id}"/>">edit</a>
                    <a href="adupdate.jsp?action=delete&id=<c:out value="${table.id}"/>">delete</a>
                    
                    <form action="adresult.jsp">
                        <input type="hidden" name="id" value="<c:out value="${table.id}"/>"/>
                        <input type="hidden" name="email" value="<c:out value="${table.email}"/>"/>
                        <input type="hidden" name="course" value="<c:out value="${table.course}"/>"/>
                        <input type="hidden" name="semester" value="<c:out value="${table.semester}"/>"/>
                        <input type="hidden" name="rollno" value="<c:out value="${table.rollno}"/>"/>
                        <input type="submit" value="upload result"/>
                    </form>
                    </td>
                </tr>   
                </c:forEach>   
                
                
                
            </table>
                 </c:otherwise>
                    </c:choose>
                 
    </body>
</html>
