/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.servlet;

import com.mvc.bean.Car;
import com.mvc.dao.CarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CarServlet extends HttpServlet {

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
            out.println("<title>Servlet CarServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CarServlet at " + request.getContextPath() + "</h1>");
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
        try
        {
            List errorMsgs = new LinkedList();
            Car cr = new Car();
            
            String car_id = request.getParameter("car_id");
            String car_plateno = request.getParameter("car_plateno");
            String car_model = request.getParameter("car_model");
            String car_status = request.getParameter("car_status");
            String car_rentprice = request.getParameter("car_rentprice");
            String operation = request.getParameter("operation");
            
            if(car_id == null)
                car_id = "0";
            if((car_plateno == null || car_plateno.trim().length() == 0))
                errorMsgs.add("Please enter the plate number");
            if((car_model == null || car_model.trim().length() == 0))
                errorMsgs.add("Please enter the car model");
            if((car_status == null || car_status.trim().length() == 0))
                errorMsgs.add("Please enter the car status");
            if((car_rentprice == null || car_rentprice.trim().length() == 0))
                errorMsgs.add("Please enter the car rent price");
            
            if(!errorMsgs.isEmpty())
            {
                request.setAttribute("errorMsgs", errorMsgs);
                RequestDispatcher view = request.getRequestDispatcher("/ErrorCar.jsp");
                view.forward(request, response);
                return;
            }
            
            cr.setCar_id(Integer.parseInt(car_id));
            cr.setCar_plateno(car_plateno);
            cr.setCar_model(car_model);
            cr.setCar_status(car_status);
            cr.setCar_rentprice(Integer.parseInt(car_rentprice));
            
            if(operation.equals("C"))
            {
                CarDAO dao = new CarDAO();
                dao.addCar(cr);
                request.setAttribute("car", cr);
                RequestDispatcher view = request.getRequestDispatcher("/SuccessCar.jsp");
                view.forward(request, response);
            }
            if(operation.equals("U"))
            {
                CarDAO dao = new CarDAO();
                dao.updateCar(cr);
                request.setAttribute("car", cr);
                RequestDispatcher view = request.getRequestDispatcher("/SuccessCar.jsp");
                view.forward(request, response);
            }
            
            if(operation.equals("D"))
            {
                CarDAO dao = new CarDAO();
                dao.deleteCar(cr.getCar_id());
                request.setAttribute("car", cr);
                RequestDispatcher view = request.getRequestDispatcher("/SuccessCar.jsp");
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
