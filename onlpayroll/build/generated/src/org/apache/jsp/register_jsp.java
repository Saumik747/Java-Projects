package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"error.jsp", true, 8192, true);
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student Registration</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/custom.css\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function chkval()\n");
      out.write("            {\n");
      out.write("                var passwd = document.getElementById(\"password\").value;\n");
      out.write("                var cpasswd = document.getElementById(\"cpassword\").value;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"register\">\n");
      out.write("            <h1>Register Yourself</h1>\n");
      out.write("            <hr>\n");
      out.write("            <form action=\"register\" method=\"post\" onsubmit=\"chkval()\">\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Enter name: </label> \n");
      out.write("                    <input type=\"text\" name=\"name\" required />\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Enter Email: </label>\n");
      out.write("                    <input type=\"email\" name=\"email\" required />\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Enter Password: </label>\n");
      out.write("                    <input type=\"password\" name=\"password\" id=\"password\" required />\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">confirm Password: </label>\n");
      out.write("                    <input type=\"password\" name=\"cpassword\" id=\"cpassword\" required />\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Enter Address </label>\n");
      out.write("                    <input type=\"text\" name=\"address\" id=\"\" required/>\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Enter date of birth</label>\n");
      out.write("                    <input type=\"date\" name=\"dob\" required >\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Enter Mobile no </label>\n");
      out.write("                    <input type=\"text\" name=\"mobno\" id=\"mobno\" onkeypress=\"chknum()\" required/>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Select Gender</label>\n");
      out.write("                    <select name=\"gender\">\n");
      out.write("                        <option value=\"male\" selected>Male</option>\n");
      out.write("                        <option value=\"female\">Female</option>\n");
      out.write("                    </select>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <label for=\"department\"><b>Department: </b></label>\n");
      out.write("                    <input type=\"text\" placeholder=\"Enter Department\" name=\"dept\" required>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <div>\n");
      out.write("                    <label for=\"\">Enter Date of Joining</label>\n");
      out.write("                    <input type=\"date\" name=\"joining\" required/>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div>\n");
      out.write("                    <input type=\"submit\" value=\"Register\">\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </form>\n");
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
