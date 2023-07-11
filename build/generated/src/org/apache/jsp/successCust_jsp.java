package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class successCust_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menuStaff.jsp", out, false);
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      com.mvc.bean.Customer customer = null;
      customer = (com.mvc.bean.Customer) _jspx_page_context.getAttribute("customer", PageContext.REQUEST_SCOPE);
      if (customer == null){
        throw new java.lang.InstantiationException("bean customer not found within scope");
      }
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <a href=\"../src/java/com/mvc/servlet/customerServlet.java\"></a>\n");
      out.write("         <link rel=\"stylesheet\" href=\"css/formcss.css\">\n");
      out.write("        <title>Add Customer Success</title> \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"feedback-form\"> \n");
      out.write("        <h1>Update Customer Success</h1>\n");
      out.write("        You have add the following customer:<br>\n");
      out.write("        Name: ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((com.mvc.bean.Customer)_jspx_page_context.findAttribute("customer")).getCust_name())));
      out.write("<br>\n");
      out.write("        Gender: ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((com.mvc.bean.Customer)_jspx_page_context.findAttribute("customer")).getCust_gender())));
      out.write("<br>\n");
      out.write("        Age: ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((com.mvc.bean.Customer)_jspx_page_context.findAttribute("customer")).getCust_age())));
      out.write("<br>\n");
      out.write("        Phone Number: ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((com.mvc.bean.Customer)_jspx_page_context.findAttribute("customer")).getCust_phoneno())));
      out.write("<br>\n");
      out.write("        Email: ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((com.mvc.bean.Customer)_jspx_page_context.findAttribute("customer")).getCust_email())));
      out.write("<br>\n");
      out.write("        Username: ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((com.mvc.bean.Customer)_jspx_page_context.findAttribute("customer")).getCust_username())));
      out.write("<br>\n");
      out.write("        Password: ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((com.mvc.bean.Customer)_jspx_page_context.findAttribute("customer")).getCust_password())));
      out.write("<br>\n");
      out.write("        <br><hr>\n");
      out.write("        <button href=\"index.jsp\">HOME</button>\n");
      out.write("        </div>       \n");
      out.write("    </body>\n");
      out.write("     ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
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
