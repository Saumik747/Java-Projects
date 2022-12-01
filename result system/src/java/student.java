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
/**
 *
 * @author saumik
 */
public class student extends HttpServlet {

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
            out.println("<title>Servlet student</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet student at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
//        processRequest(request, response);

 PrintWriter out= response.getWriter();
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        int course=Integer.parseInt(request.getParameter("course"));
        HttpSession session = request.getSession(true);
      //  out.println(email+"  2"+password+" 3"+course);
        try
{
Class.forName("com.mysql.jdbc.Driver");

String url="jdbc:mysql://localhost:3306/onlresult"; 
Connection con= DriverManager.getConnection (url, "root", "");

PreparedStatement p = con.prepareStatement("Select * from student where email=? AND password=? AND course=?");
p.setString(1,email);
p.setString(2,password);
p.setInt(3,course);
ResultSet rs = p.executeQuery();

 //out.println(email+"  "+password+" "+course);
  //
//id 1
//name 2
//email 3
//password 4
//address 5
//dob 6
//gender 7
//course 8
//semester 9
//rollno 10
//mobno 11
if (rs.next())
{
    String nm=rs.getString(2);
    int crs=rs.getInt(8);
    int sem=rs.getInt(9);
     int rn=rs.getInt(10);
        out.println(rs.getString(2));
    

        
        
     session.setAttribute("email",email);//email
     session.setAttribute("name",nm);//name
     session.setAttribute("course",crs);
     session.setAttribute("semester",sem);
      session.setAttribute("roll",rn);
//     
    out.println("<h1>Login Successful </h1>");
     
    
   response.sendRedirect("stuindex.jsp");
}

else
{
//     out.println("<h1>Login unSuccessful </h1>");
     response.sendRedirect("student.jsp?message=wrong+credentials");
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
