<%-- 
    Document   : adupdate
    Created on : Jan 11, 2022, 10:36:54 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*,java.util.*,java.sql.*;" %>
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
        <title>JSP Page</title>
    </head>
    <body>
         <%
//        if(session.getAttribute("admin")==null)
//        {
//            response.sendRedirect("admin.jsp?message=please login with correect credentials");
//        }
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
                            <%int mobno1=Integer.parseInt(request.getParameter("mobno"));%>
                              <sql:update dataSource="${db}" var="updemprec">
                    update emp set 
                    name='${param.name}',address='${param.address}',email='${param.email}',mobno=<%=mobno1%>,
                    gender='${param.gender}',dob='${param.dob}',joindate='${param.joindate}',dept='${param.dept}'
                    where  id=${param.id};
                </sql:update>
        <% 
           response.sendRedirect("emprec.jsp?message=record+updated");
out.println("record updated");
        %> 
                        </c:when>
                    
                    
                      <c:when test="${param.action=='update emp'}">
                          <%
//                              int mobno=Integer.parseInt(request.getParameter("mobno"));
                          %>
                              <sql:update dataSource="${db}" var="updemprec">
                    update emp set 
                    name='${param.name}',address='${param.address}',email='${param.email}',mobno=${param.mobno},
                    gender='${param.gender}',dob='${param.dob}',joindate='${param.joindate}',dept='${param.dept}'
                    where  email='${param.email}';
                </sql:update>
        <% 
           response.sendRedirect("emp_pro.jsp?message=profile+updated");
out.println("record updated");
        %> 
                        </c:when>
                    
                    
                    
                    
                  
                    
                    <c:when test="${param.action=='delete'}">
                         <sql:update dataSource="${db}" var="delsturec">
                   delete from emp where  id='${param.id}';
                </sql:update>
        <% 
          response.sendRedirect("emprec.jsp?message=record+deleted");
//out.println("record deleted");
        %>
                        
                    </c:when>
                    
                     <c:otherwise>
         
                 </c:otherwise>
                    </c:choose>
                 
    </body>
</html>
