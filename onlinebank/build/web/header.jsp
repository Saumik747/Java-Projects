<%-- 
    Document   : header
    Created on : Jan 16, 2022, 4:11:11 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*,java.sql.*,java.util.*,java.text.*;"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                                   url="jdbc:mysql://localhost:3306/onlbank"
                                   user="root" password="" />
 <%
            String email = (String) session.getAttribute("email");
            String uname = (String) session.getAttribute("uname");
            String account_no=(String) session.getAttribute("account_no");
if(uname==null&&email==null)
{
    response.sendRedirect("index.jsp");
}
          %>
 <h1 class="text-center" style=" padding:10px;border-radius:10px;margin:5px;" >
                            <span class="title" >
                                FYP Bank pvt.ltd
                            </span>
                        </h1>
                        
                          <nav class="navbar">
               
                    <a class="" href="dashboard.jsp">Welcome,&nbsp<span class="text-white"><%=uname%></span></a>
              
               
                    <a class="" href="account.jsp">Account Details</a>
              
               
                    <a class="" href="deposit.jsp">Add money to A/c</a>
              
                <a class="" href="withdraw.jsp">Withdraw</a>
                
                                <a class="" href="chk_deposit.jsp">check withdrawals and deposits</a>
               
                    <a class="" href="chk_bal.jsp">Check Balance</a>
              
               
                    <a class="" href="transfer.jsp">Transfer Amount</a>
              
               
                    <a class="" href="chk_trans.jsp">View Fund Transfers</a>
              
               
                    <a class="" href="logout.jsp">Logout</a>
              
            </nav>