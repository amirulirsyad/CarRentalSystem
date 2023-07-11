/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.servlet;

import com.mvc.bean.Rental;
import com.mvc.dao.RentalDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RentalServlet extends HttpServlet {

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
            out.println("<title>Servlet RentalServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RentalServlet at " + request.getContextPath() + "</h1>");
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
        //PrintWriter out = response.getWriter();
        try
        {
            List errorMsgs = new LinkedList();
            Rental rent = new Rental();

            String rent_id = request.getParameter("rent_id");
            String rent_rentdate = request.getParameter("rent_rentdate");
            String rent_days = request.getParameter("rent_days");
            String rent_deposit = request.getParameter("rent_deposit");
            String rent_status = request.getParameter("rent_status");
            String cust_id = request.getParameter("cust_id");
            String car_id = request.getParameter("car_id");
            String staff_id = request.getParameter("staff_id");
            String operation = request.getParameter("operation");

            if(rent_id == null)
                rent_id = "0";

            if((rent_rentdate == null) || (rent_rentdate.trim().length() == 0))
                errorMsgs.add("Please choose rent date.");

            if((rent_days == null) || (rent_days.trim().length() == 0))
                errorMsgs.add("Please enter the number of days.");

            if((rent_deposit == null) || (rent_deposit.trim().length() == 0))
                errorMsgs.add("Please enter payment amount");

            if((rent_status == null) || (rent_status.trim().length() == 0))
                errorMsgs.add("Please enter rental status.");

            if(cust_id == null)
                cust_id = "0";

            if(car_id == null)
                car_id = "0";

            if(staff_id == null)
                staff_id = "0";

            if(!errorMsgs.isEmpty())
            {
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/errorRental.jsp");
                view.forward(request, response);
                return;
            }

            rent.setRent_id(Integer.parseInt(rent_id));
            rent.setRent_rentdate(rent_rentdate);
            rent.setRent_days(Integer.parseInt(rent_days));
            rent.setRent_deposit(Double.parseDouble(rent_deposit));
            rent.setRent_status(rent_status);
            rent.setCust_id(Integer.parseInt(cust_id));
            rent.setCar_id(Integer.parseInt(car_id));
            rent.setStaff_id(Integer.parseInt(staff_id));
            //out.println(rent);
            
            if(operation.equals("C"))
            {
                RentalDAO dao = new RentalDAO();
                dao.addRent(rent);
                request.setAttribute("rent", rent);
                RequestDispatcher view = request.getRequestDispatcher("/successRental.jsp");
                view.forward(request, response);
            }
            
            if(operation.equals("U"))
            {
                RentalDAO dao = new RentalDAO();
                dao.updateRent(rent);
                request.setAttribute("rent", rent);
                RequestDispatcher view = request.getRequestDispatcher("/listRental.jsp");
                view.forward(request, response);
            }
            
            if(operation.equals("D"))
            {
                RentalDAO dao = new RentalDAO();
                dao.deleteRent(rent.getRent_id());
                request.setAttribute("rent", rent);
                RequestDispatcher view = request.getRequestDispatcher("/listRental.jsp");
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
