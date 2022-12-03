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
            
            .header{
        background-color:orange;
    }
   .header h1{
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
            <li> <a href ='logout.jsp'>Logout </a></li>
           
            
           
            
           
            
            
                              </ul>
                          </nav>
        </div>
                    <div class="text-center">


                        <h1>Salary Records</h1>
                        <sql:query dataSource="${db}" var="emprec">
                            Select * from empsal where email='${param.email}' ;

                        </sql:query>


                         
                         

                             <c:if test="${emprec.rowCount>0}">
                            
                       
                        <table style="margin-left: auto;margin-right: auto;">
                            <tr>
                                <td>SR no</td>
                                <td>Name</td>
                                <td>email</td>
                                <td>Month</td>
                                <td>year</td>
                                <td>Salary</td>
                                <td>bonus</td>



                            </tr>

                            <c:forEach var="table" items="${emprec.rows}">
                                <tr>
                                    <td><c:out value="${table.id}"/></td>
                                    <td><c:out value="${table.name}"/></td>
                                    <td><c:out value="${table.email}"/></td>
                                    <td><c:out value="${table.mnth}"/></td>
                                    <td><c:out value="${table.year}"/>
                                    </td>
                                    <td><c:out value="${table.salary}"/></td>
                                    <td><c:out value="${table.bonus}"/></td>




                                </tr>   
                            </c:forEach>   



                        </table>
                                 
                                  </c:if>
                            
                             <c:if test="${emprec.rowCount<1}">
                            <h1>No Record Found contact authorities</h1>
                        </c:if>

                        <hr>
                        <h1>Your Annual Salary Records</h1>
                        <sql:query dataSource="${db}" var="empsal">
                            Select * from empsal2 where email='${param.email}' ;

                        </sql:query>
                            
                             <c:if test="${empsal.rowCount>0}">
                           
                      
                        <table style="margin-left: auto;margin-right: auto;">
                            <tr>
                                <td>SR no</td>
                                <td>Name</td>
                                <td>email</td>

                                <td>year</td>
                                <td>Annual Salary</td>




                            </tr>

                            <c:forEach var="table" items="${empsal.rows}">
                                <tr>
                                    <td><c:out value="${table.id}"/></td>
                                    <td><c:out value="${table.name}"/></td>
                                    <td><c:out value="${table.email}"/></td>

                                    <td><c:out value="${table.year}"/>
                                    </td>
                                    <td><c:out value="${table.asal}"/></td>





                                </tr>   
                            </c:forEach>   



                        </table>
  </c:if>
                            
                             <c:if test="${empsal.rowCount<1}">
                            <h1>No Record Found</h1>
                        </c:if>
                        <button class="print" onclick="window.print()">Print</button>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
