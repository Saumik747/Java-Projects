<%-- 
    Document   : showres
    Created on : Jan 12, 2022, 1:21:46 AM
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
        <title>Result</title>
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
    </head>
    <body>
        <div>
             <header>
                <h1 class="text-center">Online Result System Admin Section</h1>
                <nav class="nav text-center">
                    <ul>
                        <li> <a href="adform.jsp">View List of Students </a></li> 
                        <li><a href="adsub.jsp">Add course or Subject </a></li> 
                        <li> <a href="viewsub.jsp">view course and  Subject </a></li>
                        <li><a href="logout?user=admin">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="text-center result" style="">
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
         
            </div>
        
        
        
        
     
        
      
        
        
       

       
</body>
</html>
