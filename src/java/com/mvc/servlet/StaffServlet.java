/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.servlet;

import com.mvc.bean.Staff;
import com.mvc.dao.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StaffServlet extends HttpServlet {

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
            out.println("<title>Servlet StaffServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffServlet at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException {
        try
        {
            List errorMsgs = new LinkedList();
            Staff stf = new Staff();
            String staff_Id = request.getParameter("staff_id");
            String staff_Name = request.getParameter("staff_name");
            String staff_Gender = request.getParameter("staff_gender");
            String staff_Age = request.getParameter("staff_age");
            String staff_Phoneno = request.getParameter("staff_phoneno");
            String staff_Email = request.getParameter("staff_email");
            String staff_Username = request.getParameter("staff_username");
            String staff_Password = request.getParameter("staff_password");
            String operation = request.getParameter("operation");
            if (staff_Id == null)
                staff_Id = "0";
            
            if ((staff_Name == null) || (staff_Name.trim().length() == 0))
            {
                errorMsgs.add("Please enter name. ");
            }
            if ((staff_Gender == null) || (staff_Gender.trim().length() == 0))
            {
                errorMsgs.add("Please enter the gender. ");
            }
            if ((staff_Age == null) || (staff_Age.trim().length() == 0))
            {
                errorMsgs.add("Please enter the age. ");
            }
            if ((staff_Phoneno == null) || (staff_Phoneno.trim().length() == 0))
            {
                errorMsgs.add("Please enter the phone number. ");
            }
            if ((staff_Email == null) || (staff_Email.trim().length() == 0))
            {
                errorMsgs.add("Please enter the email. ");
            }
            if ((staff_Username == null) || (staff_Username.trim().length() == 0))
            {
                errorMsgs.add("Please enter the username. ");
            }
            if ((staff_Password == null) || (staff_Password.trim().length() == 0))
            {
                errorMsgs.add("Please enter the password. ");
            }
            
            if (!errorMsgs.isEmpty())
            {
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/errorStaff.jsp");
                view.forward(request, response);
                return;
            }
            
            stf.setStaff_id(Integer.parseInt(staff_Id));
            stf.setStaff_name(staff_Name);
            stf.setStaff_gender(staff_Gender);
            stf.setStaff_age(Integer.parseInt(staff_Age));
            stf.setStaff_phoneno(staff_Phoneno);
            stf.setStaff_email(staff_Email);
            stf.setStaff_username(staff_Username);
            stf.setStaff_password(staff_Password);
            
            if (operation.equals("C"))
            {
                StaffDAO dao = new StaffDAO();
                dao.addStaff(stf);
                
                request.setAttribute("staff", stf);
                
                RequestDispatcher view = request.getRequestDispatcher("/successStaff.jsp");
                view.forward(request, response);
            }
            
            if (operation.equals("U"))
            {
                StaffDAO dao = new StaffDAO();
                dao.updateStaff(stf);
                
                request.setAttribute("staff", stf);
                
                RequestDispatcher view = request.getRequestDispatcher("/ListStaff.jsp");
                view.forward(request, response);
            }
            
            if (operation.equals("D"))
            {
                StaffDAO dao = new StaffDAO();
                dao.deleteStaff(stf.getStaff_id());
                
                request.setAttribute("staff", stf);
                
                RequestDispatcher view = request.getRequestDispatcher("/ListStaff.jsp");
                view.forward(request, response);
            }
        }
        catch (Exception ex)
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
