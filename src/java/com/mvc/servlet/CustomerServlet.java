/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.servlet;

import com.mvc.bean.Customer;
import com.mvc.dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
            throws ServletException, IOException 
    {
        try{
            List errorMsgs = new LinkedList();
            Customer cust = new Customer();
            String cust_id = request.getParameter("cust_id");
            String cust_name = request.getParameter("cust_name");
            String cust_gender = request.getParameter("cust_gender");
            String cust_age = request.getParameter("cust_age");
            String cust_phoneno = request.getParameter("cust_phoneno");
            String cust_email = request.getParameter("cust_email");
            String cust_username = request.getParameter("cust_username");
            String cust_password = request.getParameter("cust_password");
            String operation = request.getParameter("operation");
            if(cust_id==null) cust_id = "0";
            
            if(cust_name == null || cust_name.trim().length() == 0)
            {
                errorMsgs.add("Please enter the customer name");
            }
            if(cust_gender == null || cust_gender.trim().length() == 0)
            {
                errorMsgs.add("Please enter the right gender");
            }
            if(cust_age == null || cust_age.trim().length() == 0)
            {
                errorMsgs.add("Please enter the customer age");
            }
            if(cust_phoneno == null || cust_phoneno.trim().length() == 0)
            {
                errorMsgs.add("Please enter the customer phone number");
            }
            if(cust_email == null || cust_email.trim().length() == 0)
            {
                errorMsgs.add("Please enter the customer email");
            }
            if(cust_username == null || cust_username.trim().length() == 0)
            {
                errorMsgs.add("Please enter the customer username");
            }
            if(cust_password == null || cust_password.trim().length() == 0)
            {
                errorMsgs.add("Please enter the customer password");
            }
            
            if(!errorMsgs.isEmpty())
            {
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/errorCust.jsp");
                view.forward(request, response);
                return;
            }
            
            cust.setCust_id(cust_id);
            cust.setCust_name(cust_name);
            cust.setCust_gender(cust_gender);
            cust.setCust_age(cust_age);
            cust.setCust_phoneno(cust_phoneno);
            cust.setCust_email(cust_email);
            cust.setCust_username(cust_username);
            cust.setCust_password(cust_password);
            
            if(operation.equals("C"))
            {
                CustomerDAO dao = new CustomerDAO();
                dao.addCustomer(cust);
                request.setAttribute("customer", cust);
                RequestDispatcher view = request.getRequestDispatcher("/indexCust.jsp");
                view.forward(request, response);
            }
            
            if(operation.equals("U"))
            {
                CustomerDAO dao = new CustomerDAO();
                dao.updateCustomer(cust);
                request.setAttribute("customer", cust);
                RequestDispatcher view = request.getRequestDispatcher("/successCust.jsp");
                view.forward(request, response); 
            }
            
            if(operation.equals("D"))
            {
                CustomerDAO dao = new CustomerDAO();
                dao.deleteCustomer(cust);
                request.setAttribute("customer", cust);
                RequestDispatcher view = request.getRequestDispatcher("/listCustomer.jsp");
                view.forward(request, response);
                
            }
        }
            catch(Exception ex)
            {
                System.out.println(ex);
            }
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
