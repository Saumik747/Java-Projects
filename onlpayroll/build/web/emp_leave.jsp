<%-- 
    Document   : emp_leave
    Created on : Jan 13, 2022, 8:12:34 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.util.*,java.text.*;"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"  %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/onlpayroll" 
                   user="root" password="" />
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
                                <li> <a href ='logout.jsp'>Logout </a></li> </ul>
                        </nav>
                    </div>


                    <div class='register'>

                        <c:if test="${param.action=='Apply'}">
                            <%
                                String DATE_FORAT = "yyyy-MM-dd";                           
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORAT);                              
                                String dateStr1 = request.getParameter("start");
                                String dateStr2 = request.getParameter("end");                        
                                Date date1 = simpleDateFormat.parse(dateStr1);
                                Date date2 = simpleDateFormat.parse(dateStr2);;
                                long date1InMs = date1.getTime();
                                long date2InMs = date2.getTime();

                                // getting the diff between two dates.
                                long timeDiff = 0;
                                if (date1InMs > date2InMs) {
                                    timeDiff = date1InMs - date2InMs;
                                } else {
                                    timeDiff = date2InMs - date1InMs;
                                }

                                // converting diff into days
                                int daysDiff = (int) (timeDiff / (1000 * 60 * 60 * 24));

                                if( daysDiff==0)
                                {
                                    daysDiff=1;
                                }
                                // print diff in days
//                                out.println("No of days diff is using String Dates : " + daysDiff);
                            %>



                            <sql:query dataSource="${db}" var="chkleave" >
                                select * from emp_leave where email='<%=email%>' AND strt_dt='${param.start}';

                            </sql:query>


                            <c:if test="${chkleave.rowCount==1}">
                                <h1>You have already applied for leave on <c:out value="'${param.start}'"/></h1>
                            </c:if>

                            <c:if test="${chkleave.rowCount!=1}">
                                <sql:update dataSource="${db}" var="updlev" >
                                    insert into emp_leave(email,strt_dt,end_dt,reason,n_days) 
                                    values('<%=email%>','${param.start}','${param.end}','${param.reason}',<%=daysDiff%>);
                                </sql:update>
                                <c:if test="${updlev==1}">
                                    <h1>leave Applied</h1>
                                </c:if>

                            </c:if>








                        </c:if>




                      

   


                            <h1 class="text-center">Leave Application</h1>
                        <form action="emp_leave.jsp">
                            <div>
                                <label for="">Enter Start date of leave</label>
                                <input type="date" name="start"/>
                            </div>

                            <div>
                                <label for="">Enter End date of leave</label>
                                <input type="date" name="end"/>
                            </div>

                            <div>
                                <label for="">Enter Reason for Leave</label>
                                <br>
                                <textarea rows="10" cols="20" name="reason" class="form-control" placeholder="Reason for applying for leave"></textarea>
                            </div>

                            <div>
                                <input type="submit" name="action" value="Apply"/> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
