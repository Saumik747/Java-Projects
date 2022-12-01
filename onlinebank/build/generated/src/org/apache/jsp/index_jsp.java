package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write(" <!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>FYP Online Banking</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width\">\n");
      out.write("\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/custom.css\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\" />\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function ctck()\n");
      out.write("            {\n");
      out.write("                var sds = document.getElementById(\"dum\");\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <style>\n");
      out.write("            .in{\n");
      out.write("                padding:20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control{\n");
      out.write("                max-width:300px;\n");
      out.write("                margin-left:auto;margin-right:auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .title{\n");
      out.write("                background-color:orange;\n");
      out.write("                padding:10px;\n");
      out.write("                border-radius:10px;\n");
      out.write("            }\n");
      out.write("            header h1{\n");
      out.write("                padding:30px;\n");
      out.write("                text-align:center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            header,footer{\n");
      out.write("                background-color:lightblue;\n");
      out.write("                padding:10px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <header>\n");
      out.write("                        <h1>\n");
      out.write("                      <h1 class=\"text-center\" style=\" padding:10px;border-radius:10px;margin:5px;\" >\n");
      out.write("                            <span class=\"title\" >\n");
      out.write("                                FYP Bank pvt.ltd\n");
      out.write("                            </span>\n");
      out.write("                        </h1>\n");
      out.write("                        \n");
      out.write("                          <nav class=\"navbar\">\n");
      out.write("               \n");
      out.write("                    <a class=\"\" href=\"index.jsp\">Welcome,&nbsp<span class=\"text-white\">");
      out.print(uname);
      out.write("</span></a>\n");
      out.write("              \n");
      out.write("               \n");
      out.write("                    <a class=\"\" href=\"account.jsp\">Account Details</a>\n");
      out.write("              \n");
      out.write("               \n");
      out.write("                    <a class=\"\" href=\"deposit.jsp\">Add money to A/c</a>\n");
      out.write("              \n");
      out.write("                <a class=\"\" href=\"withdraw.jsp\">Withdraw</a>\n");
      out.write("                \n");
      out.write("                                <a class=\"\" href=\"chk_deposit.jsp\">check withdrawals and deposits</a>\n");
      out.write("               \n");
      out.write("                    <a class=\"\" href=\"chk_bal.jsp\">Check Balance</a>\n");
      out.write("              \n");
      out.write("               \n");
      out.write("                    <a class=\"\" href=\"transfer.jsp\">Transfer Amount</a>\n");
      out.write("              \n");
      out.write("               \n");
      out.write("                    <a class=\"\" href=\"chk_trans.jsp\">View Fund Transfers</a>\n");
      out.write("              \n");
      out.write("               \n");
      out.write("                    <a class=\"\" href=\"logout.jsp\">Logout</a>\n");
      out.write("              \n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("                    </header>\n");
      out.write("                   \n");
      out.write("\n");
      out.write("                    <section class=\"text-center\"  style=\"border:1px solid black;margin-left:auto;margin-right:auto;max-width:700px;padding:30px;margin-top:5px;margin-bottom:5px;\">\n");
      out.write("                        <div>\n");
      out.write("                            <h1>Login to your bank account</h1>\n");
      out.write("                        </div>\n");
      out.write("                        <div>\n");
      out.write("                            <form action=\"login\" method =\"POST\" class=\"text-center\" >\n");
      out.write("                                <div>\n");
      out.write("                                    Username: <br><input type =\"text\" name =\"uname\" class=\"form-control\" required/>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div>\n");
      out.write("                                    Password: <br> <input type=\"password\" name=\"password\" class=\"form-control\" required />\n");
      out.write("                                </div>\n");
      out.write("                                <div>\n");
      out.write("\n");
      out.write("                                    <br>\n");
      out.write("                                    <a href=\"forgot.jsp\" class =\"btn btn-warning\">Forgot password</a>\n");
      out.write("                                    <br>\n");
      out.write("                                    <br>\n");
      out.write("\n");
      out.write("                                    <input type =\"submit\" value =\"submit\" class=\"btn btn-success\" style=\"cursor:pointer;\">\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </section>\n");
      out.write("\n");
      out.write("                    \n");
      out.write("                    <footer   class=\"footer text-center\" style =\" bottom:0;font-size:18px;height:50px;\" >\n");
      out.write("                        Copyright © By Saumik Dutta\n");
      out.write("                    </footer>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <script type=\"text/javascript\">\n");
      out.write("                        document.onload = ctck();\n");
      out.write("                    </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
