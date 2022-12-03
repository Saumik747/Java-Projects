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
import conn.connection;

/**
 *
 * @author saumik
 */
public class signup extends HttpServlet {

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
            out.println("<title>Servlet signup</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signup at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        int pin = Integer.parseInt(request.getParameter("pin"));
        String uname = request.getParameter("uname");
        String name = request.getParameter("name");
        String nominee = request.getParameter("nominee");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int mobno = Integer.parseInt(request.getParameter("mobno"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        String zip = request.getParameter("zip");

        String dob = request.getParameter("dob");
        out.println("username" + uname);

        String religion = request.getParameter("religion");
        String catogery = request.getParameter("catogery");
        String education = request.getParameter("education");

//        long account = Long.parseLong(request.getParameter("account"));
        String account = request.getParameter("account");

        String account_type = request.getParameter("account_type");
        int balance = Integer.parseInt(request.getParameter("balance"));

        try {
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/onlbank";
            Connection con = DriverManager.getConnection(url, "root", "");

           PreparedStatement chk=con.prepareStatement("Select * from customer where uname=? and account_no=?");
           chk.setString(1,uname);
           chk.setString(2,account);
           ResultSet chkacc=chk.executeQuery();
            if(chkacc.next())
            {
             out.println( " Record already exist");
             response.sendRedirect("signup.jsp?message=signup+unsuccessfull+account+exists");
            }
            
            
            else
            {
          String customer = "Insert into customer(pin,uname,name,fname,address,zip,email,password,mobno,gender,dob,religion,category,qualification,account_no) "
                    + "values(" + pin + ",'" + uname + "','" + name + "','" + nominee + "','" + address + "','" + zip + "','" + email + "','" + password + "'," + mobno + ",'" + gender + "','" + dob + "','" + religion + "','" + catogery + "','" + education + "','" + account + "')";

            String custacc = "Insert into cust(pin,account_no,uname,account_type) "
                    + "values(" + pin + ",'" + account + "','" + uname + "','" + account_type + "')";

            out.println(customer);
            out.println(custacc);
            out.println();
            Statement inst = con.createStatement();
            int cust = inst.executeUpdate(customer);
            int custacct = inst.executeUpdate(custacc);
//            inst.executeUpdate(custacc);
            if (cust == 1 && custacct == 1) {
                out.println("record inserted on both table");
                out.println("<a href='index.jsp'>Click here to login </a>");
                response.sendRedirect("index.jsp?message=signup+successfull");
            }
            else
            {
                out.println("no record  inserted on both table");
            }
        }

          

//            inst.executeUpdate();
//            response.sendRedirect("index.jsp");
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
