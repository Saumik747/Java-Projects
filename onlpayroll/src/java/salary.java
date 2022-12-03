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
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author saumik
 */
public class salary extends HttpServlet {

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
            out.println("<title>Servlet salary</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet salary at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String month = request.getParameter("month");
        int year = Integer.parseInt(request.getParameter("year"));
        int salary = Integer.parseInt(request.getParameter("salary"));
        int bonus = Integer.parseInt(request.getParameter("bonus"));
        int id = Integer.parseInt(request.getParameter("id"));
        int asal = 0;
        int tsal;
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/onlpayroll";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement pst = con.prepareStatement("Select * from empsal2 where email=? and year=?");
            pst.setString(1, email);
            pst.setInt(2, year);
            ResultSet rs = pst.executeQuery();
            Statement inst = con.createStatement();
            if (rs.next()) {
                asal = asal + salary + bonus;
                out.println("Record found");
                String updsal = "Update empsal2 set asal=asal+" + asal + " where email='" + email + "' AND year=" + year + "";
                String insal = "Insert into empsal(name,email,mnth,year,salary,bonus) values('" + name + "','" + email + "','" + month + "'," + year + "," + salary + "," + bonus + ")";
              out.println(insal);
               int a, b;
              PreparedStatement pst2 = con.prepareStatement("Select * from empsal where email=? and year=? and mnth=?");
            pst2.setString(1, email);
            pst2.setInt(2, year);
            pst2.setString(3, month);
               ResultSet rs1 = pst2.executeQuery();
            if(rs1.next())
            {
                
                a = inst.executeUpdate(updsal);
              

                if (a == 1) {
                    out.println("Salary record");
                    response.sendRedirect("emprec.jsp?message=success");

                }
                else
                {
                out.println("Salary update failure");
                                                    response.sendRedirect("emprec.jsp?message=failure");

                }
            }
            
            else
            {
                a = inst.executeUpdate(updsal);
                  b = inst.executeUpdate(insal);
                   if (a == 1 && b==1) {
                    out.println("Salary updated");
                    response.sendRedirect("emprec.jsp?message=success");

                }
                else
                {
                out.println("Salary update failure");           
                response.sendRedirect("emprec.jsp?message=failure");

                }
            }
                
            } 
            
            
            else {
                String updsal1 = "Insert into empsal2(name,email,year,asal) values('" + name + "','" + email + "'," + year + "," + asal + ")";
                String insal1 = "Insert into empsal(name,email,mnth,year,salary,bonus) values('" + name + "','" + email + "','" + month + "'," + year + "," + salary + "," + bonus + ")";
                 int c, d;


               PreparedStatement pst3 = con.prepareStatement("Select * from empsal where email=? and year=? and mnth=?");
            pst3.setString(1, email);
            pst3.setInt(2, year);
            pst3.setString(3, month);
               ResultSet rs3 = pst3.executeQuery();
            if(rs3.next())
            {
                
                c = inst.executeUpdate(updsal1);
              

                if (c == 1) {
                    out.println("Salary record");
                    response.sendRedirect("emprec.jsp?message=success");

                }
                else
                {
                out.println("Salary update failure");
                                                    response.sendRedirect("emprec.jsp?message=failure");

                }
            }
            
            else
            {
                c = inst.executeUpdate(updsal1);
                  d = inst.executeUpdate(insal1);
                   if (c == 1 && d==1) {
                    out.println("Salary updated");
                    response.sendRedirect("emprec.jsp?message=success");

                }
                else
                {
                out.println("Salary update failure");
                                    response.sendRedirect("emprec.jsp?message=failure");

                }
            }
            }
        } catch (ClassNotFoundException ce) {
            ce.getStackTrace();
            System.out.println(ce);
        } catch (SQLException se) {
            se.getStackTrace();
            System.out.println("Sql error" + se);
        } catch (Exception e) {
            e.getStackTrace();

            System.out.println("NO record found");
        }
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
        processRequest(request, response);
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
