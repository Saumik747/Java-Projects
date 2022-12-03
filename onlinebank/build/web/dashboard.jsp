<%-- 
    Document   : dashboard
    Created on : Jan 16, 2022, 3:25:39 PM
    Author     : saumik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*,java.sql.*,java.util.*,java.text.*;"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashbaord</title>
          <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/custom.css" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <style>
            header .navbar,header{
                background-color:lightblue;
            }
            .navbar a{
                padding:10px;
                background-color:orange;
            }
            
            .footer{
                    background-color: dimgrey;
    padding: 10px;
            }
            
            .services a{
                padding:10px;
                background-color:orange;
                margin:5px;
                color:white;
            }
             .title{
                background-color:orange;
                padding:10px;
                border-radius:10px;
                text-align:center;
            }
            
        </style>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            String uname = (String) session.getAttribute("uname");
            String account_no=(String) session.getAttribute("account_no");
if(uname==null&&email==null)
{
    response.sendRedirect("index.jsp");
}
          %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <header>
<h1 class="text-center" style=" padding:10px;border-radius:10px;margin:5px;" >
                            <span class="title" >
                                FYP Bank pvt.ltd
                            </span>
                        </h1>
                        
                          <nav class="navbar">
               
                    <a class="" href="index.jsp">Welcome,&nbsp<span class="text-white"><%=uname%></span></a>
              
               
                    <a class="" href="account.jsp">Account Details</a>
              
               
                    <a class="" href="deposit.jsp">Add money to A/c</a>
              
                <a class="" href="withdraw.jsp">Withdraw</a>
                
                                <a class="" href="chk_deposit.jsp">check withdrawals and deposits</a>
               
                    <a class="" href="chk_bal.jsp">Check Balance</a>
              
               
                    <a class="" href="transfer.jsp">Transfer Amount</a>
              
               
                    <a class="" href="chk_trans.jsp">View Fund Transfers</a>
              
               
                    <a class="" href="logout.jsp">Logout</a>
              
            </nav>                    </header>
                
                <section class="register">
                    <h1>Welcome,&nbsp<%=uname%></h1>
                    <hr>
                    <div class="services">
                        <h4>Services</h4>
                        <div class="">
                    <a class="navbar-brand" href="account.jsp">Account Details</a>
                </div>
                <div class="">
                    <a class="navbar-brand" href="deposit.jsp">Add money to A/c</a>
                </div>
                
                <div class="">
                    <a class="navbar-brand" href="withdraw.jsp">Withdraw</a>
                </div>
                <div class="">
                    <a class="navbar-brand" href="chk_bal.jsp">Check Balance</a>
                </div>
                <div class="">
                    <a class="navbar-brand" href="transfer.jsp">Transfer Amount</a>
                </div>
                <div class="">
                    <a class="navbar-brand" href="chk_trans.jsp">View Fund Transfers</a>
                </div>
                <div class="">
                    <a class="navbar-brand" href="logout.jsp">Logout</a>
                </div>
                    </div>
                </section>
                
                
                
                 <footer   class="footer text-center" style =" bottom:0;font-size:18px;height:50px;" >
                        Copyright © By Saumik Dutta
                    </footer>
                </div>
            </div>
            
        </div>
    </body>
</html>
