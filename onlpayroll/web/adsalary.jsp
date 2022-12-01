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
        <title>edit Employee</title>
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
    max-width:100%;
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
                        <li><a href="logout?user=admin">Logout</a></li>
                    </ul>
                </nav>
            </header>
            <div class="register">
                <h1>Update record</h1>
                <sql:query dataSource="${db}" var="emprec">
                    Select * from emp where  id='${param.id}' ;

                </sql:query>



                <form action="salary" method="get" onsubmit="chkval()">
                    <c:forEach var="emp" items="${emprec.rows}">
                        <div>
                            <label for="">name: </label> 
                            <input type="hidden" name="id" value="<c:out value="${emp.id}" />" required />
                            <input type="text" name="name" value="<c:out value="${emp.name}" />" readonly required />
                        </div>
                        <div>
                            <label for="">Email </label> 
                            
                            <input type="email" name="email" value="<c:out value="${emp.email}" />" readonly required />
                        </div>

                        <div>
                            <label for="">Enter Month </label> 
                            <select id="month" name="month" required>
                                
                                <option value="january">January</option>
                                <option value="february">February</option>
                                <option value="march">March</option>
                                <option value="april">April</option>
                                <option value="may">May</option>
                                <option value="june">June</option>
                                <option value="july">July</option>
                                <option value="august">August</option>
                                <option value="september">September</option>
                                <option value="october">October</option>
                                <option value="november">November</option>
                                <option value="december">December</option>
                            </select>
                        </div>

                        <div>
                            <label>Enter Year</label>
                            <select name="year" required style="width:100px;">
                                <c:forEach var="i" begin="2000" end="2050" step="1">
                                    <option value="<c:out value="${i}"/>"> 
                                        <c:out value="${i}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label for="">Enter Salary for that month </label>
                            <input type="text" value="" name="salary" required />
                        </div>

                        <div>
                            <label for="">Enter Bonus for that month </label>
                            <input type="text" value="" name="bonus" required />
                        </div>






                        <div>
                            <input type="submit" name="action" value="update salary">
                        </div>
                    </c:forEach>
                </form>
            </div>
        </div>


    </body>
</html>
