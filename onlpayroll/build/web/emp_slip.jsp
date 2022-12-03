<%-- 
    Document   : emp_slip
    Created on : 13 Jan, 2022, 12:58:30 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%
            String uname = (String) session.getValue("username");
            out.print("<body>");
            out.print("<h1>");
            out.print("Hello: " + uname);
            out.print("</h1>");
            out.print("</body>");
        %>
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url
                           ="jdbc:mysql://localhost:3306/rp" user="root" password="" />
        <sql:query dataSource="${ds}" var="result">
            SELECT * from salary where name='${param.uname}';
        </sql:query>
    <h1>Your Salary Details</h1>
        <br><br><hr>
        <div class="container">
            <table class="table" >
                <thead>
                    <tr class="table-dark">
                        <th>Id</th>
                        <th>User Name</th>
                        <th>Email</th>
                        <th>Salary</th>
                        <th>Bonus</th>
                        <th>Total Salary</th>
                        <th>Annual Salary</th>
                    </tr>
                </thead>
                <c:forEach var="row" items="${result.rows}">
                    <tbody>
                        <tr class="table-info">
                            <td><c:out value="${row.id}"/></td>
                            <td><c:out value="${row.name}"/></td>
                            <td><c:out value="${row.email}"/></td>
                            <td><c:out value="${row.salary}"/></td>
                            <td><c:out value="${row.bonus}"/></td>
                            <td><c:out value="${row.ts}"/></td>
                            <td><c:out value="${row.asal}"/></td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
        <div>
            <button onclick="window.print()">
                print
            </button>
        </div>
    </body>
</html>
