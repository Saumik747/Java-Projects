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
                max-width:900px;
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
                 <sql:query dataSource="${db}" var="rs" >
                    SELECT * from customer where uname ='<%=uname%>' AND email='<%=email%>';
                </sql:query>
                    
                   
                <section class="register">
                    

                    <h1>Welcome,&nbsp<%=uname%></h1>
                    <hr>
                     
                    <div class="services text-center">
                     
                           
                     <h4 class="text-center">Your Account details</h4>
                         <sql:query dataSource="${db}" var="acc" >
                    SELECT * from cust where uname ='<%=uname%>' AND account_no='<%=account_no%>';
                </sql:query>
                        <hr>
                        <table class="table">
                            <tr>
                                <td>Account no</td>
                           
                                <td>USername</td>
                            
                                <td>Balance</td>
                            </tr>
                             <tr>
                            <c:forEach var="actdet" items="${acc.rows}">
                                
                                <td><c:out value="${actdet.account_no}"/></td>
                           
                                <td><c:out value="${actdet.uname}"/></td>
                            
                                <td><c:out value="${actdet.balance}"/>.Rs</td>
                            
                            </c:forEach>
                            </tr>
                        </table>
                       
                        
                        <hr>
                        
                        <h4 class="text-center">Your personal details</h4>
                        <table class="table">
                  
                        <c:forEach var="ress" items="${rs.rows}">
                            
                            <tr>
<!--                            <td>
                                <label>UserName</label> 
                            </td>
                            
                            <td>
                                <label>Account NO</label> 
                            </td>
                           -->
                            
                            <td  colspan="2">
                                <label>Name:</label> <c:out value="${ress.name}"/>
                            </td>
                            <td  colspan="2">
                                <label>Nominee Name:</label> <c:out value="${ress.fname}"/>
                            </td>
                            </tr>
                            
                            <tr>
                                
                                <td colspan="2">
                                <label>Address:</label> <c:out value="${ress.address}"/>
                            </td>
                            
                           
                            <td colspan="2">
                                <label>PINCODE:</label> <c:out value="${ress.zip}"/>
                            </td>
                            
                           
                          
                             </tr>
                             <tr>
                                   <td >
                                <label>Email:</label> <c:out value="${ress.email}"/>
                            </td>
                            
                            <td >
                                <label>MObile no:</label> <c:out value="${ress.mobno}"/>
                            </td>
                            <td >
                                <label>Gender:</label> <c:out value="${ress.gender}"/>
                            </td>
                            
                            
                            <td >
                                <label>Date Of Birth:</label> <c:out value="${ress.dob}"/>
                            </td>
                            
                             </tr>
                             <tr>
                            <td colspan="1">
                                <label>Qualification:</label> <c:out value="${ress.qualification}"/>
                            </td>
                            <td colspan="2">
                                <label>Religion:</label> <c:out value="${ress.religion}"/>
                            </td>
                            
                            <td colspan="1">
                                <label>Category:</label> <c:out value="${ress.category}"/>
                            </td>
                             </tr>
                            
                            </c:forEach>


</table>

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
