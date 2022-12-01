<%-- 
    Document   : empindex
    Created on : Jan 15, 2022, 4:10:14 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<style>
    .header{
        background-color:orange;
    }
    h1{
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
                                  
                                  <div class="register">
                                      <h2>Welcome <%=name%></h2>
                                      <h2>Your Valuable Contribution to the company is beneficial to the company and your own career</h2>
                                  </div>
                                  
                                  
                                  
                </div>
            </div>
         </div>
    </body>
</html>
