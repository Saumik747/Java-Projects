/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.*;
import java.util.*;

/**
 *
 * @author saumik
 */
public class register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
 PrintWriter out=response.getWriter();
out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet register</title>");  
            out.println(
"<link href='css/bootstrap.min.css' rel='stylesheet' type='text/css' />"
                      + "<link href='css/custom.css' rel='stylesheet' type='text/css' />" );
            out.println("</head>");
            out.println("<body>");
 out.println("<div class=\"register\">");

String name=request.getParameter("name");;
String password=request.getParameter("password");
String email=request.getParameter("email");
String dept=request.getParameter("dept");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
int mobno=Integer.parseInt(request.getParameter("mobno"));
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");

try
{
Class.forName("com.mysql.jdbc.Driver");

String url="jdbc:mysql://localhost:3306/onlpayroll"; 
Connection con= DriverManager.getConnection (url, "root", "");

//PreparedStatement p = con.prepareStatement("insert into student(name,email,password,mobno,dob,gender,course,sem,rollno) "
                                                     // + "values(?,?,?,?,?,?,?,?,?)");
//p.setString(1,email);
//p.setString(2,password);
//p.setString(3,course);
//ResultSet rs = p.executeQuery();

PreparedStatement chkem=con.prepareStatement("select email from emp where email= ?");
chkem.setString(1,email);
ResultSet chk=chkem.executeQuery();
if(chk.next())
{
    out.println("<h1>email already exists</h1> <br>");
    out.println("<a href=\"emplogin.jsp\">\n" +
"                    <img src=\"img/student.png\" style=\"height:100px;width:100px;border-radius:60%;\" />\n" +
"                    <br>\n" +
"                    Employee login\n" +
"                </a>");
}

else
{
     out.println("inside else");
    PreparedStatement pst=con.prepareStatement("Insert into emp (name,password,email,dept,dob,gender,mobno,address,joindate)"
                                                       + "values(?   ,?       ,?    ,?   ,?  ,?     ,?     ,?     ,?  ) ");
      pst.setString(1,name);
      pst.setString(2,password);
      pst.setString(3,email);
      pst.setString(4,dept);
      pst.setString(5,dob); 
      pst.setString(6,gender); 
      pst.setInt(7,mobno); 
      pst.setString(8,address);
      pst.setString(9,joindate);
   
    int ins=pst.executeUpdate();
    if(ins==1)
        
    {
        out.println("Record Inserted");
        out.println("your email"+email);
        out.println("Your Password"+password);
         out.println("<a href=\"emplogin.jsp\">\n" +
"                    <img src=\"img/employee.png\" style=\"height:100px;width:100px;border-radius:60%;\" />\n" +
"                    <br>\n" +
"                    Employee login\n" +
"                </a>");
         String action=request.getParameter("action");
         if(action.equals("update"))
         {
             response.sendRedirect("emprec.jsp?message=employee+added");
         }
    }
    
    else
    {
        out.println("Record not Inserted");
    }
    
}


}

catch(ClassNotFoundException ce)
{
    ce.getStackTrace();
    System.out.println(ce);
}

catch(SQLException se)
{
    se.getStackTrace();
    System.out.println("Sql error"+se);
}

catch(Exception e)
{
    e.getStackTrace();
    
    System.out.println("NO record found");
}

out.println("</div>");
 out.println("</body>");
            out.println("</html>");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       PrintWriter out=response.getWriter();
out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet register</title>");  
            out.println(
"<link href='css/bootstrap.min.css' rel='stylesheet' type='text/css' />"
                      + "<link href='css/custom.css' rel='stylesheet' type='text/css' />" );
            out.println("</head>");
            out.println("<body>");
 out.println("<div class=\"register\">");

String name=request.getParameter("name");;
String password=request.getParameter("password");
String email=request.getParameter("email");
String dept=request.getParameter("dept");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
int mobno=Integer.parseInt(request.getParameter("mobno"));
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");

try
{
Class.forName("com.mysql.jdbc.Driver");

String url="jdbc:mysql://localhost:3306/onlpayroll"; 
Connection con= DriverManager.getConnection (url, "root", "");

//PreparedStatement p = con.prepareStatement("insert into student(name,email,password,mobno,dob,gender,course,sem,rollno) "
                                                     // + "values(?,?,?,?,?,?,?,?,?)");
//p.setString(1,email);
//p.setString(2,password);
//p.setString(3,course);
//ResultSet rs = p.executeQuery();

PreparedStatement chkem=con.prepareStatement("select email from emp where email= ?");
chkem.setString(1,email);
ResultSet chk=chkem.executeQuery();
if(chk.next())
{
    out.println("<h1>email already exists</h1> <br>");
    out.println("<a href=\"emplogin.jsp\">\n" +
"                    <img src=\"img/student.png\" style=\"height:100px;width:100px;border-radius:60%;\" />\n" +
"                    <br>\n" +
"                    Employee login\n" +
"                </a>");
}

else
{
     out.println("inside else");
    PreparedStatement pst=con.prepareStatement("Insert into emp (name,password,email,dept,dob,gender,mobno,address,joindate)"
                                                       + "values(?   ,?       ,?    ,?   ,?  ,?     ,?     ,?     ,?  ) ");
      pst.setString(1,name);
      pst.setString(2,password);
      pst.setString(3,email);
      pst.setString(4,dept);
      pst.setString(5,dob); 
      pst.setString(6,gender); 
      pst.setInt(7,mobno); 
      pst.setString(8,address);
      pst.setString(9,joindate);
   
    int ins=pst.executeUpdate();
    if(ins==1)
        
    {
        out.println("Record Inserted");
        out.println("your email"+email);
        out.println("Your Password"+password);
         out.println("<a href=\"emplogin.jsp\">\n" +
"                    <img src=\"img/employee.png\" style=\"height:100px;width:100px;border-radius:60%;\" />\n" +
"                    <br>\n" +
"                    Employee login\n" +
"                </a>");
         String action=request.getParameter("action");
         if(action.equals("update"))
         {
             response.sendRedirect("emprec.jsp?message=employee+added");
         }
    }
    
    else
    {
        out.println("Record not Inserted");
    }
    
}


}

catch(ClassNotFoundException ce)
{
    ce.getStackTrace();
    System.out.println(ce);
}

catch(SQLException se)
{
    se.getStackTrace();
    System.out.println("Sql error"+se);
}

catch(Exception e)
{
    e.getStackTrace();
    
    System.out.println("NO record found");
}

out.println("</div>");
 out.println("</body>");
            out.println("</html>");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
