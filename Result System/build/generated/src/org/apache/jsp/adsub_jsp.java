package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adsub_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("          \n");
      out.write("        ");

        out.println(session.getAttribute("name"));
        
        
      out.write("\n");
      out.write("        \n");
      out.write("        <form action=\"adsub.jsp\">\n");
      out.write("           \n");
      out.write("                        <div>\n");
      out.write("            <label for=\"\">Select Course</label>\n");
      out.write("             <select name=\"course\" id=\"\">\n");
      out.write("                 <option value=\"<c:out value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sturec.course}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\" selected ><c:out value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sturec.course}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/></option>\n");
      out.write("                  <sql:query dataSource=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${db}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" var=\"rs\">\n");
      out.write("                    Select * from course;\n");
      out.write("                </sql:query>\n");
      out.write("                <c:forEach var=\"table\" items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${rs.rows}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                <option value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${table.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                <c:out value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${table.c_name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"/>\n");
      out.write("            </option>\n");
      out.write("            </c:forEach>   \n");
      out.write("             </select>\n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("              <select name=\"semester\" id=\"\" required>\n");
      out.write("              \n");
      out.write("                <option value=\"1\">Sem1 </option>\n");
      out.write("                <option value=\"2\">Sem2 </option>\n");
      out.write("                <option value=\"3\">Sem3 </option>\n");
      out.write("                <option value=\"4\">Sem4 </option>\n");
      out.write("                <option value=\"5\">Sem5 </option>\n");
      out.write("                <option value=\"6\">Sem6 </option>\n");
      out.write("                <option value=\"7\">Sem7 </option>\n");
      out.write("                <option value=\"8\">Sem8 </option>\n");
      out.write("            </select>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <div>\n");
      out.write("                <label for=\"\">Subject 1</label>\n");
      out.write("                <input type=\"text\" name=\"\" />\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        \n");
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
