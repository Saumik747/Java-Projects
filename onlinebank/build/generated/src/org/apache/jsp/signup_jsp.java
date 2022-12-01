package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import conn.connection;;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Sign up </title>\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/custom.css\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\" />\n");
      out.write("        <style>\n");
      out.write("            .in{\n");
      out.write("                padding:20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control{\n");
      out.write("                /*                max-width:300px;\n");
      out.write("                                margin-left:auto;margin-right:auto;*/\n");
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <header>\n");
      out.write("                        <h1>\n");
      out.write("                            <span class=\"title\">\n");
      out.write("                                FYP Bank pvt.ltd\n");
      out.write("                            </span>\n");
      out.write("                        </h1>\n");
      out.write("\n");
      out.write("                        <div class=\"menu\">\n");
      out.write("                            <nav class=\"navbar navbar-expand-lg navbar-light\">\n");
      out.write("                                <div class=\"px-2\">\n");
      out.write("                                    <a class=\"navbar-brand\" href=\"index.jsp\">Login</a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"px-2\">\n");
      out.write("                                    <a class=\"navbar-brand\" href=\"#\">Signup</a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"px-2\">\n");
      out.write("                                    <a class=\"navbar-brand\" href=\"aboutpage.jsp\">About</a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"px-2\">\n");
      out.write("                                    <a class=\"navbar-brand\" href=\"#\">Contact</a>\n");
      out.write("                                </div>\n");
      out.write("                            </nav>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </header>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <section class=\"text-center container\"  style=\"border:1px solid black;margin-left:auto;margin-right:auto;max-width:900px;padding:30px;margin-top:5px;margin-bottom:5px;\">\n");
      out.write("                        <div>\n");
      out.write("                            <h1>Signup for your account</h1>\n");
      out.write("                        </div>\n");
      out.write("                        <div>\n");
      out.write("                            pin,uname,name,fname,email,password,mobno,gender,address,zip,dob\n");
      out.write("                            <form action=\"signup\" method =\"get\" class=\"text-center row\" >\n");
      out.write("                                ");

                                    Random ran = new Random();
                                    int first3 = (ran.nextInt() % 9000) + 1000;
                                    int pin = Math.abs(first3);

                                    long first7 = (ran.nextLong() % 90000000L) + 5040936000000000L;
                                    long accno = Math.abs(first7);
                                
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Unique Pin</label>\n");
      out.write("                                    <input type=\"text\" name=\"pin\" class=\"form-control\" value=\"");
out.println(pin);
      out.write("\" required readonly>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label for=\"\" class=\"form-label\">Username</label>\n");
      out.write("                                    <input type=\"text\" name=\"uname\" class=\"form-control\" placeholder=\"enter name\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label for=\"\" class=\"form-label\">Name</label>\n");
      out.write("                                    <input type=\"text\" name=\"name\"class=\"form-control\" placeholder=\"enter name\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label for=\"\" class=\"form-label\">Nominee name</label>\n");
      out.write("                                    <input type=\"text\" name=\"nominee\" class=\"form-control\" placeholder=\"XYZ\" >\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                 <div class=\"col-md-6\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Email</label>\n");
      out.write("                                    <input type=\"email\" name=\"email\" class=\"form-control\" aria-describedby=\"emailHelp\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-3\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Password</label>\n");
      out.write("                                    <input type=\"password\" name=\"password\" class=\"form-control\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-3\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Confirm Password</label>\n");
      out.write("                                    <input type=\"password\" name=\"cpassword\" class=\"form-control\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <br>\n");
      out.write("                                 <div class=\"col-md-3\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Mobile no</label>\n");
      out.write("                                    <input type=\"text\" name=\"mobno\" class=\"form-control\" placeholder=\"\" onkeypress=\"chknum()\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-3\">\n");
      out.write("                                    <label for=\"\">Gender</label>\n");
      out.write("                                    <select name=\"gender\" class=\"form-control\" required>\n");
      out.write("                                        <option value=\"male\" selected>Male</option>\n");
      out.write("                                        <option value=\"female\" >Female</option>\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Enter Address</label>\n");
      out.write("                                    <input type=\"text\" name=\"address\" class=\"form-control\" placeholder=\"Bombay\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <label for=\"05\" class=\"form-label\">Zip</label>\n");
      out.write("                                    <input type=\"text\" name=\"zip\" class=\"form-control\" placeholder=\"400031\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                               \n");
      out.write("                                <div class=\"col-md-3\">\n");
      out.write("                                    <label for=\"05\" class=\"form-label\">Date of Birth</label>\n");
      out.write("                                    <input type=\"date\" name=\"dob\" class=\"form-control\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                               \n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"col-12 text-center\">\n");
      out.write("                                    <h5 class=\"text-primary\">Customer Personal Details</h5>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <label for=\"\" class=\"form-label\">Religion</label>\n");
      out.write("                                    <input type=\"text\" name=\"religion\"class=\"form-control\" placeholder=\"Hindu\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <label for=\"\" class=\"form-label\">Catogery</label>\n");
      out.write("                                    <input type=\"text\" name=\"catogery\" class=\"form-control\" placeholder=\"General/OBC\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Education</label>\n");
      out.write("                                    <input type=\"text\" name=\"education\" class=\"form-control\" placeholder=\"Post,Under Gre.\" required>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"col-12 text-center\">\n");
      out.write("                                    <h5 class=\"text-primary\">Customer Account Details</h5>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <label for=\"\" class=\"form-label\">Account No</label>\n");
      out.write("                                    <input type=\"password\" name=\"account\" class=\"form-control\" value=\"");
out.println(accno);
      out.write("\" readonly  required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <label for=\"\" class=\"form-label\">Account Type</label>\n");
      out.write("                                    <input type=\"text\" name=\"account_type\" class=\"form-control\" placeholder=\"saving/current\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-md-4\">\n");
      out.write("                                    <label for=\"03\" class=\"form-label\">Opening Balance</label>\n");
      out.write("                                    <input type=\"number\" name=\"balance\" class=\"form-control\" placeholder=\"Min 500\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"col-12 text-center \">\n");
      out.write("                                    <br>\n");
      out.write("                                    <input type=\"submit\" value=\"Register\" class=\"btn btn-primary\" />\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </section>\n");
      out.write("\n");
      out.write("\n");
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
