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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Online Result</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/custom.css\" type=\"text/css\"/>\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" type=\"text/css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("        <div class=\"container register\"  style=\"max-width:500px;height:600px;\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("              <div class=\"col-md-12\" style=\"margin-bottom:100px;\">\n");
      out.write("                   <h1 class=\"text-center\" >Online result system</h1>\n");
      out.write("                   <hr>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"col-md-6\">\n");
      out.write("               \n");
      out.write("                  <a href=\"student.jsp\">\n");
      out.write("                    <img src=\"img/student.png\" style=\"height:100px;width:100px;border-radius:60%;\" />\n");
      out.write("                    <br>\n");
      out.write("                     Student login\n");
      out.write("                </a>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"col-md-6\">\n");
      out.write("                   <a href=\"admin.jsp\">\n");
      out.write("                    <img src=\"img/admin.png\" style=\"height:100px;width:100px;border-radius:60%;\" />\n");
      out.write("                    <br>\n");
      out.write("                  Admin login\n");
      out.write("                   </a>\n");
      out.write("              </div>\n");
      out.write("          </div>\n");
      out.write("      </div>\n");
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
