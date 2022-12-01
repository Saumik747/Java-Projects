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
public class employee extends HttpServlet {

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
            out.println("<title>Servlet employee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet employee at " + request.getContextPath() + "</h1>");
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
        //  processRequest(request, response);
 PrintWriter out= response.getWriter();
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        HttpSession session = request.getSession(true);
      //  out.println(email+"  2"+password+" 3"+course);
      out.println("<h1>inside post method </h1>");
        try
{
Class.forName("com.mysql.jdbc.Driver");

String url="jdbc:mysql://localhost:3306/onlpayroll"; 
Connection con= DriverManager.getConnection (url, "root", "");

PreparedStatement p = con.prepareStatement("Select * from emp where email=? AND password=?");
p.setString(1,email);
p.setString(2,password);

ResultSet rs = p.executeQuery();

if (rs.next())
{
    String nm=rs.getString(2);
    

        
        
     session.setAttribute("email",email);//email
     session.setAttribute("employee",nm);//email
//     
    out.println("<h1>Login Successful </h1>");
     
    
   response.sendRedirect("empindex.jsp");
}

else
{
     out.println("<h1>Login unSuccessful </h1>");
      response.sendRedirect("emplogin.jsp?message=wrong+login");
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
