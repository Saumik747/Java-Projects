package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;;

public final class chk_005fdeposit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Dashbaord</title>\n");
      out.write("          <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/custom.css\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\" />\n");
      out.write("        <style>\n");
      out.write("            header .navbar,header{\n");
      out.write("                background-color:lightblue;\n");
      out.write("            }\n");
      out.write("            .navbar a{\n");
      out.write("                padding:10px;\n");
      out.write("                background-color:orange;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .footer{\n");
      out.write("                    background-color: dimgrey;\n");
      out.write("    padding: 10px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .services a{\n");
      out.write("                padding:10px;\n");
      out.write("                background-color:orange;\n");
      out.write("                margin:5px;\n");
      out.write("                color:white;\n");
      out.write("            }\n");
      out.write("             .title{\n");
      out.write("                background-color:orange;\n");
      out.write("                padding:10px;\n");
      out.write("                border-radius:10px;\n");
      out.write("                text-align:center;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String email = (String) session.getAttribute("email");
            String uname = (String) session.getAttribute("uname");
            String account_no=(String) session.getAttribute("account_no");
if(uname==null&&email==null)
{
    response.sendRedirect("index.jsp");
}
        
         String date = new java.util.Date().toString();
        
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <header>\n");
      out.write("\n");
      out.write("                    </header>\n");
      out.write("                \n");
      out.write("                <section class=\"register\">\n");
      out.write("\n");
      out.write("                    <div class=\"services\">\n");
      out.write("                        <h4>View Withdrawals</h4>\n");
      out.write("                        <div class=\"\">\n");
      out.write("                            <form action='chk_trans1.jsp' method=\"get\">\n");
      out.write("                                \n");
      out.write("                                <div>\n");
      out.write("                                    <label>Account no</label>\n");
      out.write("                                    <input type=\"text\" name=\"account_no\" value=\"");
      out.print(account_no);
      out.write("\" placeholder=\"\" readonly />\n");
      out.write("                                    <input type=\"hidden\" name=\"uname\" value=\"");
      out.print(uname);
      out.write("\"/>\n");
      out.write("                                </div>\n");
      out.write("                                                               \n");
      out.write("                                <div>\n");
      out.write("                                    <label>Enter Pin</label>\n");
      out.write("                                    <input type=\"text\" name=\"pin\" id=\"pin\" placeholder=\"4-digit pin\"/>\n");
      out.write("                                                                     \n");
      out.write("                                </div>\n");
      out.write("                                    <div>\n");
      out.write("                                        <input type=\"submit\" name=\"action\" value=\"check\"/>\n");
      out.write("                                    </div>\n");
      out.write("                            </form>\n");
      out.write("                </div>\n");
      out.write("                    </div>\n");
      out.write("                </section>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                 <footer   class=\"footer text-center\" style =\" bottom:0;font-size:18px;height:50px;\" >\n");
      out.write("                        Copyright © By Saumik Dutta\n");
      out.write("                    </footer>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
