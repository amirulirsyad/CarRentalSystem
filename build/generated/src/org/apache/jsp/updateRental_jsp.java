package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mvc.bean.Rental;
import java.sql.ResultSet;
import java.sql.Statement;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import com.mvc.dao.RentalDAO;

public final class updateRental_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menuStaff.jsp", out, false);
      out.write('\n');

    Connection conn = DBConnection.createConnection();
    Statement stmt = conn.createStatement();
    String sql = "SELECT car_id, car_model||' - '||car_plateno car_model, car_rentprice FROM car where car_status='Available' ORDER BY car_id";
    ResultSet rs = stmt.executeQuery(sql);
    
    String username = (String)session.getAttribute("userName");
    String userID = (String)session.getAttribute("userID");//get attributes from session
    if (username == null) 
    { //if null (user not login) redirect to login page
        request.setAttribute("errMessage", "You have not login");
        out.println( "<script> location.href='./login.jsp'; </script>");
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>CAR RENTAL</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         ");

            int rent_id = Integer.parseInt(request.getParameter("rent_id"));
            Rental rent;
            RentalDAO dao = new RentalDAO();
            rent = dao.getRent(rent_id);
        
      out.write("\n");
      out.write("        <h1>Update Car Booking</h1>\n");
      out.write("        <form action=\"RentalServlet\" method=\"POST\">\n");
      out.write("            <table>\n");
      out.write("                 <tr>\n");
      out.write("                    <td>Staff:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"staff_id\" value=\"");
      out.print(rent.getStaff_id());
      out.write("\"</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Rent Date:</td>\n");
      out.write("                    <td><input type=\"date\" name=\"rent_rentdate\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Car Model:</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"car_id\">\n");
      out.write("                            ");

                                while(rs.next())
                                {
                            
      out.write("  \n");
      out.write("                            <option value=\"");
      out.print(rs.getString("car_id"));
      out.write("\">\n");
      out.write("                                ");
      out.print(rs.getString("car_model") );
      out.write("\n");
      out.write("                            </option>\n");
      out.write("                              ");
}
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Rent Days:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"rent_days\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Deposit:RM</td>\n");
      out.write("                    <td><input type=\"text\" name=\"rent_deposit\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Rental Status</td>\n");
      out.write("                    <td><select name=\"rent_status\">\n");
      out.write("                           <option value=\"In progress\">In progress</option>\n");
      out.write("                           <option value=\"Approved\">Approved</option>\n");
      out.write("                           <option value=\"Decline\">Decline</option>\n");
      out.write("                    </select></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"hidden\" name=\"staff_id\" value=\"1\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"hidden\" name=\"operation\" value=\"U\"/></td>\n");
      out.write("                    <td>\n");
      out.write("                        <button type=\"submit\">Save</button>\n");
      out.write("                        <button type=\"reset\">Reset</button>\n");
      out.write("                    </td>\n");
      out.write("                </tr> \n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        ");

            rs.close();
            stmt.close();
            conn.close();
        
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
