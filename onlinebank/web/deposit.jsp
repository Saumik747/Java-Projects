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
                        <h4>Add  money to account</h4>
                        <div class="">
                            <form action='deposit' method="get">
                                <div>
                                    <label>Enter Money</label>
                                    <input type="text" name="amt" id="amt" placeholder="Min 500" onclick="chknum()" required/>
                                    
                                </div>
                                <div>
                                    <label>Account no</label>
                                    <input type="text" name="account_no" value="<%=account_no%>" placeholder="" readonly />
                                    <input type="hidden" value="<%=uname%>"/>
                                </div>
                                <div>
                                    <label>Operation</label>
                                    <input type="text" name="operation" value="deposit"  placeholder="" readonly required/>
                                    
                                </div>
                                <div>
                                    <label>Date: </label>
                                   
                                    <%=date%>
                                    <input type="hidden" name="date" value="<%=date%>"  placeholder="4-digit pin"/>
                                    
                                </div>
                                <div>
                                    <label>Enter Pin</label>
                                    <input type="password" name="pin" id="pin" placeholder="4-digit pin"/>
                                    
                                </div>
                                    <div>
                                        <input type="submit" name="action" value="deposit"/>
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
