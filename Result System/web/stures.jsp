<%-- 
    Document   : stures
    Created on : Jan 12, 2022, 3:20:50 PM
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
        <title>Student result</title>
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

        </style>
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
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            int course = (Integer) session.getAttribute("course");
            int semester = (Integer) session.getAttribute("semester");
            int roll = (Integer) session.getAttribute("roll");

            if (name == null) {
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
                        
                        <div class="print text-center register">
                             <h3>courses list</h3>
        
        <table>
            <tr>
            <td>id</td>
            <td>course</td>
             
            </tr>
             <sql:query dataSource="${db}" var="rs">
                    Select * from course;
                </sql:query>
             <c:forEach var="table" items="${rs.rows}">
            <tr>
                 
               
                    <td><c:out value="${table.id}"/></td>
                    <td><c:out value="${table.c_name}"/></td>            
            
            </tr>
            </c:forEach>   
        </table>
                        </div>

            <div class=" register text-center result" style="">
                <h1>Current sem result</h1>
                name: <c:out value="${param.name}" /> <br>
                email: <c:out value="${param.email}" /> <br>
                course: <c:out value="${param.course}" /> <br>
                semester: <c:out value="${param.semester}" /> <br>
                rollno : <c:out value="${param.rollno}" />

                <table>
                    <tr>
                        <sql:query dataSource="${db}" var="stures">
                            Select * from subject where c_id=${param.course} and sem_id=${param.semester};

                        </sql:query>
                        <td>Subject name</td>
                        <c:forEach var="restable" items="${stures.rows}">
                            <td>
                                <c:out value="${restable.sname}"/>
                            </td>
                        </c:forEach>
                    </tr>

                    <tr>
                        <td>Marks</td>
                        <sql:query dataSource="${db}" var="res">
                            Select * from result where c_id=${param.course} and sem_id=${param.semester} and email='${param.email}';

                        </sql:query>
                        <c:forEach var="result" items="${res.rows}">
                            <td>
                                <c:out value="${result.s1}"/>
                            </td>
                            <td>
                                <c:out value="${result.s2}"/>
                            </td>
                            <td>
                                <c:out value="${result.s3}"/>
                            </td>
                            <td>
                                <c:out value="${result.s4}"/>
                            </td>
                            <td>
                                <c:out value="${result.s5}"/>
                            </td>
                        </c:forEach>
                    </tr>

                    <tr>
                        <td>pass of fail</td>

                        <c:forEach var="result" items="${res.rows}">
                            <td>
                                <c:choose>
                                    <c:when test="${result.s1 >40 }">
                                        <p class="pass">pass</p>
                                    </c:when>

                                    <c:when test="${result.s1 <40 }">
                                        <p>fail , reappear for exam </p>
                                    </c:when>

                                    <c:otherwise>
                                        no result found contact coordinator
                                    </c:otherwise>
                                </c:choose>                            
                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${result.s2 >40 }">
                                        <p class="pass">pass</p>
                                    </c:when>

                                    <c:when test="${result.s2 <40 }">
                                        <p>fail</p>
                                    </c:when>

                                    <c:otherwise>
                                        no result found contact coordinator
                                    </c:otherwise>
                                </c:choose>

                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${result.s3 >40 }">
                                        <p>pass</p>
                                    </c:when>

                                    <c:when test="${result.s3 <40 }">
                                        <p class="pass">fail</p>
                                    </c:when>

                                    <c:otherwise>
                                        no result found contact coordinator
                                    </c:otherwise>
                                </c:choose>

                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${result.s4 >40 }">
                                        <p class="pass">pass</p>
                                    </c:when>

                                    <c:when test="${result.s4 <40 }">
                                        <p>fail</p>
                                    </c:when>

                                    <c:otherwise>
                                        no result found contact coordinator
                                    </c:otherwise>
                                </c:choose>

                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${result.s5 >40 }">
                                        <p class="pass">pass</p>
                                    </c:when>

                                    <c:when test="${result.s5 <40 }">
                                        <p>fail</p>
                                    </c:when>

                                    <c:otherwise>
                                        no result found contact coordinator
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </c:forEach>
                    </tr>

                </table>



                <h1>ALL sem result</h1>
                <c:if test="${param.semester>=1}">
                    <div>
                        <h1>Sem1</h1>
                        name: <c:out value="${param.name}" /> <br>
                        email: <c:out value="${param.email}" /> <br>
                        course: <c:out value="${param.course}" /> <br>
                        semester: 1 <br>
                        rollno : <c:out value="${param.rollno}" />

                        <table>
                            <tr>
                                <sql:query dataSource="${db}" var="stures">
                                    Select * from subject where c_id=${param.course} and sem_id=1;

                                </sql:query>
                                <td>Subject name</td>
                                <c:forEach var="restable" items="${stures.rows}">
                                    <td>
                                        <c:out value="${restable.sname}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>Marks</td>
                                <sql:query dataSource="${db}" var="res">
                                    Select * from result where c_id=${param.course} and sem_id=1 and email='${param.email}';

                                </sql:query>
                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:out value="${result.s1}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s2}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s3}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s4}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s5}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>pass of fail</td>

                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s1 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s1 <40 }">
                                                <p>fail , reappear for exam </p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>                            
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s2 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s2 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s3 >40 }">
                                                <p class="pass"> pass</p>
                                            </c:when>

                                            <c:when test="${result.s3 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s4 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s4 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s5 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s5 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </c:forEach>
                            </tr>

                        </table>
                    </div>
                </c:if>


                <c:if test="${param.semester>=2}">
                    <div>
                        <h1>Sem2</h1>


                        <table>
                            <tr>
                                <sql:query dataSource="${db}" var="stures">
                                    Select * from subject where c_id=${param.course} and sem_id=2;

                                </sql:query>
                                <td>Subject name</td>
                                <c:forEach var="restable" items="${stures.rows}">
                                    <td>
                                        <c:out value="${restable.sname}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>Marks</td>
                                <sql:query dataSource="${db}" var="res">
                                    Select * from result where c_id=${param.course} and sem_id=2 and email='${param.email}';

                                </sql:query>
                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:out value="${result.s1}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s2}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s3}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s4}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s5}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>pass of fail</td>

                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s1 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s1 <40 }">
                                                <p>fail , reappear for exam </p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>                            
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s2 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s2 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s3 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s3 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s4 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s4 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s5 >40 }">
                                                <p>pass</p>
                                            </c:when>

                                            <c:when test="${result.s5 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </c:forEach>
                            </tr>

                        </table>
                    </div>
                </c:if>

                <c:if test="${param.semester>=3}">
                    <div>
                        <h1>Sem3</h1>


                        <table>
                            <tr>
                                <sql:query dataSource="${db}" var="stures">
                                    Select * from subject where c_id=${param.course} and sem_id=3;

                                </sql:query>
                                <td>Subject name</td>
                                <c:forEach var="restable" items="${stures.rows}">
                                    <td>
                                        <c:out value="${restable.sname}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>Marks</td>
                                <sql:query dataSource="${db}" var="res">
                                    Select * from result where c_id=${param.course} and sem_id=3 and email='${param.email}';

                                </sql:query>
                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:out value="${result.s1}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s2}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s3}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s4}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s5}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>pass of fail</td>

                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s1 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s1 <40 }">
                                                <p>fail , reappear for exam </p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>                            
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s2 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s2 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s3 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s3 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s4 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s4 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s5 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s5 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </c:forEach>
                            </tr>

                        </table>
                    </div>
                </c:if>

                <c:if test="${param.semester>=4}">
                    <div>
                        <h1>Sem4</h1>


                        <table>
                            <tr>
                                <sql:query dataSource="${db}" var="stures">
                                    Select * from subject where c_id=${param.course} and sem_id=4;

                                </sql:query>
                                <td>Subject name</td>
                                <c:forEach var="restable" items="${stures.rows}">
                                    <td>
                                        <c:out value="${restable.sname}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>Marks</td>
                                <sql:query dataSource="${db}" var="res">
                                    Select * from result where c_id=${param.course} and sem_id=4 and email='${param.email}';

                                </sql:query>
                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:out value="${result.s1}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s2}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s3}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s4}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s5}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>pass of fail</td>

                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s1 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s1 <40 }">
                                                <p>fail , reappear for exam </p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>                            
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s2 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s2 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s3 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s3 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s4 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s4 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s5 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s5 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </c:forEach>
                            </tr>

                        </table>
                    </div>
                </c:if>


                <c:if test="${param.semester>=5}">
                    <div>
                        <h1>Sem5</h1>


                        <table>
                            <tr>
                                <sql:query dataSource="${db}" var="stures">
                                    Select * from subject where c_id=${param.course} and sem_id=5;

                                </sql:query>
                                <td>Subject name</td>
                                <c:forEach var="restable" items="${stures.rows}">
                                    <td>
                                        <c:out value="${restable.sname}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>Marks</td>
                                <sql:query dataSource="${db}" var="res">
                                    Select * from result where c_id=${param.course} and sem_id=5 and email='${param.email}';

                                </sql:query>
                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:out value="${result.s1}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s2}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s3}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s4}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s5}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>pass of fail</td>

                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s1 >40 }">
                                                <p>pass</p>
                                            </c:when>

                                            <c:when test="${result.s1 <40 }">
                                                <p>fail , reappear for exam </p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>                            
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s2 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s2 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s3 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s3 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s4 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s4 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s5 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s5 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </c:forEach>
                            </tr>

                        </table>
                    </div>
                </c:if>

                <c:if test="${param.semester==6}">
                    <div>
                        <h1>Sem6</h1>


                        <table>
                            <tr>
                                <sql:query dataSource="${db}" var="stures">
                                    Select * from subject where c_id=${param.course} and sem_id=6;

                                </sql:query>
                                <td>Subject name</td>
                                <c:forEach var="restable" items="${stures.rows}">
                                    <td>
                                        <c:out value="${restable.sname}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>Marks</td>
                                <sql:query dataSource="${db}" var="res">
                                    Select * from result where c_id=${param.course} and sem_id=6 and email='${param.email}';

                                </sql:query>
                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:out value="${result.s1}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s2}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s3}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s4}"/>
                                    </td>
                                    <td>
                                        <c:out value="${result.s5}"/>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <td>pass of fail</td>

                                <c:forEach var="result" items="${res.rows}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s1 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s1 <40 }">
                                                <p>fail , reappear for exam </p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>                            
                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s2 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s2 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s3 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s3 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s4 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s4 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${result.s5 >40 }">
                                                <p class="pass">pass</p>
                                            </c:when>

                                            <c:when test="${result.s5 <40 }">
                                                <p>fail</p>
                                            </c:when>

                                            <c:otherwise>
                                                no result found contact coordinator
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </c:forEach>
                            </tr>

                        </table>
                    </div>
                </c:if>
                <br>
                <br><br><br><br><br><br>
                <button class="print" onclick="window.print()">Print</button>
            </div>

    </body>
</html>
