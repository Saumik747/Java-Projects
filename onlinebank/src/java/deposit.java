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
public class deposit extends HttpServlet {

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
            out.println("<title>Servlet deposit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deposit at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname");
        String account_no = request.getParameter("account_no");
        int amt = Integer.parseInt(request.getParameter("amt"));
        int pin = Integer.parseInt(request.getParameter("pin"));

        String operation = request.getParameter("operation");
        String date = request.getParameter("date");
        String email = request.getParameter("email");

        String action = request.getParameter("action");
        out.println("doget called " +action);
  int balnew=0;
   int balance;
   
        try {
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/onlbank";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement chk = con.prepareStatement("Select * from cust where  account_no=? and pin=?");
            chk.setString(1, account_no);
            chk.setInt(2, pin);
            ResultSet chkacc = chk.executeQuery();
             Statement inst = con.createStatement();
            if (chkacc.next()) {
                balance=chkacc.getInt(6);
               
                
                
              
                if (action.equals("deposit")) {
                    balnew=balance+amt;
                     
                    String history = "Insert into history(pin,account_no,operation,amt,final_bal,date) "
                                                + "values("+pin+",'"+account_no+"','"+operation+"',"+amt+","+balnew+",'"+date+"')";
                    String updbal="Update cust set balance="+balnew+" where account_no='"+account_no+"' ";
                   out.println(history);
                    out.println(updbal);
                  int a=  inst.executeUpdate(history);
                    int b =inst.executeUpdate(updbal);
                    
                    if(a==1 && b==1)
                    {
                         out.println("record inserted on both table");
                         response.sendRedirect("chk_deposit.jsp?message=transaction+successfull");
                    }
                    else
                    {
                         out.println("record not inserted on both table");
                         response.sendRedirect("deposit.jsp?message=transaction+not+successfull");
                    }
                }
                
                else if(action.equals("withdraw")) {
                    balnew=balance-amt;
                     out.println("balance new"+balnew);
                    String history1 = "Insert into history(pin,account_no,operation,amt,final_bal,date) "
                                                + "values("+pin+",'"+account_no+"','"+operation+"',"+amt+","+balnew+",'"+date+"')";
                    String updbal1="Update cust set balance="+balnew+" where account_no='"+account_no+"' ";
                    int c=  inst.executeUpdate(history1);
                    int d =inst.executeUpdate(updbal1);
                    
                    if(c==1 && d==1)
                    {
                         out.println("record inserted on both table withdraw operation");
                          response.sendRedirect("chk_deposit.jsp?message=transaction+successfull");
                    }
                    else
                    {
                         out.println("record not inserted on both table");
                         response.sendRedirect("withdraw.jsp?message=transaction+not+successfull");
                    }
                }
            }
            
            else
            {
                out.println("Wrong pin enetred");
                out.println("<a class=\"\" href=\"deposit.jsp\">Click here to go back</a>");
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
