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
        url="jdbc:mysql://localhost:3306/onlpayroll" 
        user="root" password="" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit employee</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<style>
    header{
    background-color:lightblue;
}

.nav a{
    background-color:orange;
    color:white;padding:10px;
}

.register{
    max-width:700px;
}
.btn{
    margin:2px;
}
</style>
    </head>
    <body>
  <%
            String admin=(String)session.getAttribute("admin");
        if(session.getAttribute("admin")==null)
        {
            response.sendRedirect("admin.jsp?message=please+login+with+correect+credentials");
        }
        %>
        <div>
             <header>
                <h1 class="text-center">Online Payroll System Admin Section</h1>
                <nav class="nav text-center">
                    <ul>
                        <li> <a href="adindex.jsp">Welcome <%=admin%> </a></li> 
                        <li> <a href="emprec.jsp">View List of employees </a></li> 
                        <li> <a href="ademp.jsp">Add employees </a></li>
                        <li><a href="logout,jsp?user=admin">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="register">
                 <h1>Update record</h1>
          <sql:query dataSource="${db}" var="emprec">
            Select * from emp where  id='${param.id}' ;
           
        </sql:query>
            
           
            
              <form action="adupdate.jsp" method="get" onsubmit="chkval()">
                  <c:forEach var="emp" items="${emprec.rows}">
                <div>
                    <label for="">Enter name: </label> 
                     <input type="hidden" name="id" value="<c:out value="${emp.id}" />" required />
                    <input type="text" name="name" value="<c:out value="${emp.name}" />" required />
                </div>

                <div>
                    <label for="">Enter Email: </label>
                    <input type="email" value="<c:out value="${emp.email}" />" name="email" readonly required />
                </div>

                <div>
                    <label for="">Enter Password: </label>
                    <input type="password" value="<c:out value="${emp.password}" />" name="password" id="password" required />
                </div>

                <div>
                    <label for="">confirm Password: </label>
                    <input type="password" value="<c:out value="${emp.password}" />" name="cpassword" id="cpassword" required />
                </div>

                <div>
                    <label for="">Enter Address </label>
                    <input type="text"value="<c:out value="${emp.address}" />" name="address" id="" required/>
                </div>
                <div>
                    <label for="">Enter date of birth</label>
                    <input type="date" value="<c:out value="${emp.dob}" />" name="dob" required >
                </div>

                <div>
                    <label for="">Enter Mobile no </label>
                    <input type="number" value="<c:out value="${emp.mobno}" />" name="mobno" id="mobno" onkeypress="chknum()" required/>
                </div>


                <div>
                    <label for="">Select Gender</label>
                    <select name="gender">
                        <option value="<c:out value="${emp.gender}" />" selected> <c:out value="${emp.gender}" /></option>
                        <option value="male" >Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>

                <div>
                    <label for="department"><b>Department: </b></label>
                    <input type="text" placeholder="Enter Department" value="<c:out value="${emp.dept}" />" name="dept" required>
                </div>
                
                <div>
                    <label for="">Enter Date of Joining</label>
                    <input type="date" name="joindate" value="<c:out value="${emp.joindate}" />" required/>

                </div>



                <div>
                    <input type="submit" name="action" value="update">
                </div>
                  </c:forEach>
            </form>
            </div>
        </div>
       
        
    </body>
</html>
