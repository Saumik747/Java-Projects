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
         String date = new java.util.Date().toString();
        %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <header>
                     <%@ include file="header.jsp" %>  
                    </header>
                
                <section class="register">

                    <div class="services">
                        <h4>View Fund Transfers</h4>
                        <div class="">
                            <form action='chk_trans1.jsp' method="get">
                                
                                <div>
                                    <label>Account no</label>
                                    <input type="text" name="account_no" value="<%=account_no%>" placeholder="" readonly />
                                    <input type="hidden" name="uname" value="<%=uname%>"/>
                                </div>
                                                               
                                <div>
                                    <label>Enter Pin</label>
                                    <input type="password" name="pin" id="pin" placeholder="4-digit pin"/>
                                                                     
                                </div>
                                    <div>
                                        <input type="submit" name="action" value="check"/>
                                    </div>
                            </form>
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
