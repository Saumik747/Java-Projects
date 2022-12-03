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
            .register{
                max-width:1000px;
            }
            
            .services div{
                border:1px solid black;
                    
            }
        </style>
    </head>
    <body>
        
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <header>
                     <%@ include file="header.jsp" %>  
                    </header>
                 
                    
                   
                <section class="register">
                    

                    <h1>Welcome,&nbsp<%=uname%></h1>
                    <hr>
                     
                    <div class="services text-center">
                     
                           
                     <h4 class="text-center">Your Bank statement</h4>
                     <c:if test="${param.action=='check'}">
                         <sql:query dataSource="${db}" var="acc" >
                    SELECT * from history where account_no ='${param.account_no}' AND  pin=${param.pin}  order by id desc;
                </sql:query>
                        <hr>
                        <table class="table">
                            <tr>
                                                          
                                <td>Account number</td>
                            
                                    <td>Type</td> 
                                    <td>amount</td>
                                    <td>Balance</td>
                                    <td>Date of transaction</td> 
                               
                            </tr>
                            
                            <c:forEach var="actdet" items="${acc.rows}">
                                
                                 <tr>
                               
                           
                                <td><c:out value="${actdet.account_no}"/></td>
                            <td><c:out value="${actdet.operation}"/></td> 
                                <td><c:out value="${actdet.amt}"/></td>
                                    
                                    
                                    
                                    <td><c:out value="${actdet.final_bal}"/></td>
                                    <td><c:out value="${actdet.date}"/></td> 
                            </tr>
                            </c:forEach>
                            
                        </table>
                       
                        </c:if>
                        
                        
                        <hr>
                        
                        <button class="print" onclick="window.print()">Print</button>

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
