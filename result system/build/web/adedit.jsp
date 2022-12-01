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
     String admin=(String)session.getAttribute("admin");
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("admin.jsp?message=please login with correect credentials");
        }
        %>
        <div>
             <header>
                <h1 class="text-center">Online Result System Admin Section</h1>
                <nav class="nav text-center">
                    <ul>
                        <li><a href="adindex.jsp">Welcome <%=admin%></a> </li> 
                        <li> <a href="adform.jsp">View List of Students </a></li> 
                        <li><a href="adsub.jsp">Add course or Subject </a></li> 
                        <li> <a href="viewsub.jsp">view course and  Subject </a></li>
                        <li><a href="logout?user=admin">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="register">
                 <h1>Update record</h1>
          <sql:query dataSource="${db}" var="sturec">
            Select * from student where  id='${param.id}' ;
           
        </sql:query>
            
           
            
             <form action="adupdate.jsp">
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
            <input type="email" name="email" value="<c:out value="${sturec.email}"/>" required />
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
            <label for="">Select Course</label>
             <select name="course" id="">
                 <option value="<c:out value="${sturec.course}"/>" selected ><c:out value="${sturec.course}"/></option>
                  <sql:query dataSource="${db}" var="rs">
                    Select * from course;
                </sql:query>
                <c:forEach var="table" items="${rs.rows}">
                <option value="${table.id}">
                <c:out value="${table.c_name}"/>
            </option>
            </c:forEach>   
             </select>
        
        </div>
            
            <div>
            <label for="">Select SEM</label>
            <select name="semester" id="">
               <option value="<c:out value="${sturec.semester}"/>" selected>SEM<c:out value="${sturec.semester}"/> </option>
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
            <label for="">Enter rollno</label>
            <input type="number" name="rollno" value="<c:out value="${sturec.rollno}"/>" required >
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
