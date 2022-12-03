<%-- 
    Document   : adsub
    Created on : Jan 12, 2022, 11:43:53 AM
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
        <title>Add course or subject</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<style>
            table,tr,td{
                border:1px solid black;
            }
            
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
    max-width:900px;
}


            </style>
    </head>
    <body>
          <%
               String admin=(String)session.getAttribute("admin");
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
            
            <div class="register" >
                <h3>Welcome  <% out.println(session.getAttribute("admin")); %></h3>
                <div>
                    <h2>Add Course</h2>
                <hr>
                 <c:if test="${param.action=='addcrs'}" >
                        <sql:query dataSource="${db}" var="chkcrs" >
                select * from course where c_name='${param.course}';
                </sql:query>
                
                <c:if test="${chkcrs.rowCount==1}">
                    <h4> Course exist </h4>
                </c:if>
                        
                       <c:if test="${chkcrs.rowCount!= 1}">
                        <sql:update dataSource="${db}" var="adcrs">
                        insert into course(c_name) values('${param.course}');
                        </sql:update>
                
                 <c:if test="${adcrs>=1}" >
                     <h4> Record insert successful </h4>
                    
                </c:if>
                       </c:if>
                    </c:if>
                    
                
                 <form action="adsub.jsp">
             <div>
                <label for="">Enter Course name</label>
                <input type="text" name="course" />
            </div>
            <div>
                <input type="submit"  name="action" value="addcrs"/>
                </div>
              </form>
                     <hr>
                </div>
                
                
                
                <div>
                    <br>
                    <h2>Add Subject</h2>
                <hr>
                 <c:if test="${param.action=='add'}" >
         <sql:query dataSource="${db}" var="chksub" >
                select * from subject where sem_id=${param.semester};
                </sql:query>
                
                
                    <c:if test="${chksub.rowCount==5}">
                        <h4>  record exists</h4>
                    </c:if>
                        
                        <c:if test="${chksub.rowCount!=5}">
                        <sql:update dataSource="${db}" var="sub1">
                insert into subject(c_id,sem_id,sname) values(${param.course},${param.semester},'${param.s1}');
            </sql:update>
                
                 <sql:update dataSource="${db}" var="sub2">
                insert into subject(c_id,sem_id,sname) values(${param.course},${param.semester},'${param.s2}');               
            </sql:update>
                
                 <sql:update dataSource="${db}" var="sub3">
                insert  into subject(c_id,sem_id,sname) values(${param.course},${param.semester},'${param.s3}');
            </sql:update>
                
                 <sql:update dataSource="${db}" var="sub4">
                insert  into subject(c_id,sem_id,sname) values(${param.course},${param.semester},'${param.s4}');
            </sql:update>
                
                 <sql:update dataSource="${db}" var="sub5">
                insert  into subject(c_id,sem_id,sname) values(${param.course},${param.semester},'${param.s5}');
            </sql:update>
                <c:if test="${sub1>=1 && sub2>=1 && sub3>=1 && sub4>=1 && sub5>=1 }" >
                    record insert successful
                </c:if>
                    </c:if>     
        </c:if>
                 
                    <form action="adsub.jsp" class="subject">
                
            
                        <div>
                            <label>Select Course and sem</label>
                             <select name="course" id="">
                  <sql:query dataSource="${db}" var="rs">
                    Select * from course;
                </sql:query>
                <c:forEach var="table" items="${rs.rows}">
                <option value="${table.id}">
                <c:out value="${table.c_name}"/>
            </option>
            </c:forEach>   
             </select>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                              <select name="semester" id="" required>
              <option value="Select">Select </option>
                <option value="1">Sem1 </option>
                <option value="2">Sem2 </option>
                <option value="3">Sem3 </option>
                <option value="4">Sem4 </option>
                <option value="5">Sem5 </option>
                <option value="6">Sem6 </option>
                <option value="7">Sem7 </option>
                <option value="8">Sem8 </option>
            </select>
                            
                            
                            </div>
            
            
            <div>
                <label for="">Subject 1</label>
                <input type="text" name="s1" />
            </div>
            
             <div>
                <label for="">Subject 2</label>
                <input type="text" name="s2" />
            </div>
            
             <div>
                <label for="">Subject 3</label>
                <input type="text" name="s3" />
            </div>
            
             <div>
                <label for="">Subject4</label>
                <input type="text" name="s4" />
            </div>
             <div>
                <label for="">Subject 5</label>
                <input type="text" name="s5" />
            </div>
            
            <div>
                <input type="submit"  name="action" value="add"/>
                </div>
            
        </form>
                    
                </div>
            </div>
               
                
         </div>    
    </body>
</html>
