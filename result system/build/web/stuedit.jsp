<%-- 
    Document   : stuedit
    Created on : Jan 13, 2022, 9:35:06 AM
    Author     : saumik
--%>

<%-- 
    Document   : adedit
    Created on : Jan 11, 2022, 8:59:57 PM
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
        <title>edit student</title>
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
<!--        <h1>Hello World!</h1>-->
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
                  <c:if test="${param.action=='update'}">
                              <sql:update dataSource="${db}" var="updsturec">
                    update student set 
                    name='${param.name}',address='${param.address}',mobno='${param.mobno}',password='${param.password}',
                    gender='${param.gender}',dob='${param.dob}' where  id='${param.id}';
                </sql:update>
        <% 
          
out.println("record updated");
        %> 
                        </c:if>
        <div>
             
          
        </div>
            </div>
                        
                          <div class="register">
                 <h1>Update Your details</h1>
          <sql:query dataSource="${db}" var="sturec">
            Select * from student where  id='${param.id}' ;
           
        </sql:query>
            
           
            
             <form action="stuedit.jsp">
                 <c:forEach var="sturec" items="${sturec.rows}">
                      <div>
             <label for="">Student id</label>
             <input type="number" name="id"  value="${sturec.id}" readonly/>
         </div>
                      <div>
             <label for="">Enter name</label>
             <input type="text" name="name" value="<c:out value="${sturec.name}"/>" required />
         </div>

         <div>
            <label for="">Enter email</label>
            <input type="email" name="email" value="<c:out value="${sturec.email}"/>" required readonly/>
        </div>

        <div>
            <label for="">Enter password</label>
            <input type="password" name="password" value="<c:out value="${sturec.password}"/>" id="password" required />
        </div>

        <div>
            <label for="">confirm password</label>
            <input type="password" name="cpassword" value="<c:out value="${sturec.password}"/>" id="cpassword" required />
        </div>

          <div>
            <label for="">Enter Address </label>
            <input type="text" name="address" value="<c:out value="${sturec.address}"/>" id="mobno" required/>
        </div>
        
         <div>
            <label for="">Enter Mobile no </label>
            <input type="text" name="mobno" value="<c:out value="${sturec.mobno}"/>" id="mobno" required/>
        </div>
        
        <div>
            <label for="">Enter date of birth</label>
            <input type="date" name="dob" value="<c:out value="${sturec.dob}"/>" required >
        </div>
                 
         <div>
            <label for="">Select Gender</label>
             <c:out value="${sturec.gender}"/>
            <br>
          <select name="gender">
              <option value="<c:out value="${sturec.gender}"/>" selected><c:out value="${sturec.gender}"/></option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
        </div>
        
                        <div>
            <label for=""> Your Course</label>
            
                  <sql:query dataSource="${db}" var="rs">
                    Select * from course where id=${sturec.course} ;
                </sql:query>
                <c:forEach var="table" items="${rs.rows}">
               
                <c:out value="${table.c_name}"/>
          
            </c:forEach>   
             
        
        </div>
            
            <div>
            <label for="">Your SEM :
                <c:out value="${sturec.semester}" />
            </label>
           
        
        </div>
                 <div>
            <label for="">Your  rollno :
            <c:out value="${sturec.rollno}"/>
            </label>
           
        </div>
                 </c:forEach>
                 
                 
                  <div>
            <input type="submit" name="action" value="update" />
        </div>

             </form>
            </div>
        </div>
       
        
    </body>
</html>

