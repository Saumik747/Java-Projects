<%-- 
    Document   : updresult
    Created on : Jan 12, 2022, 12:28:59 AM
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
    </head>
    <body>
          <%
        out.println(session.getAttribute("name"));
        int course=Integer.parseInt(request.getParameter("course"));
        int sem=Integer.parseInt(request.getParameter("semester"));
        
out.println("course id: "+course);
out.println("sem id: "+sem);
        %>
        
        
        
     
            <sql:update dataSource="${db}" var="stures">
                insert into result(email,c_id,sem_id,rollno,s1,s2,s3,s4,s5) 
                values('${param.email}',${param.course},${param.semester},${param.rollno},${param.s1},${param.s2},${param.s3},${param.s4},${param.s5});
            </sql:update> 
          <%response.sendRedirect("adform.jsp");%>
      
    </body>
</html>
