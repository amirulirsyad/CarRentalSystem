/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.servlet;

import com.mvc.bean.LoginBean;
import com.mvc.dao.loginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginServlet extends HttpServlet {

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
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
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
        // get username & password from Login.jsp page
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        LoginBean loginBean = new LoginBean(); //creating object loginBean
        loginBean.setUsername(userName); //setting the username and password
        loginBean.setPassword(password); //through the loginBean object
        loginDAO loginDao = new loginDAO(); //creating object for loginDAO, this class
        //cotains main logic for user authentication
        String[] dataCust = loginDao.authenticateUserCust(loginBean); 
        String userValidateCust = dataCust[0];
        
        String userValidateStaff = loginDao.authenticateUserStaff(loginBean);
        if(userValidateCust.equals("SUCCESS")) //If function returns success string then user will be
        { //rooted to index.jsp
            String cust_id = dataCust[1]; 
            String cust_name = dataCust[2];
            
            HttpSession session=request.getSession(); //to register session
            session.setAttribute("userName",cust_name);
            session.setAttribute("userID",cust_id);// to set the attribute to the session
            //request.getRequestDispatcher("/index.jsp").forward( request, response);//RequestDispatcher is used
            //to redirect to Home.jsp page
            RequestDispatcher rd = request.getRequestDispatcher ("indexCust.jsp"); //RequestDispatcher is used
            rd.forward(request, response); //to redirect to index.jsp page
        }
        else if(userValidateStaff.equals("SUCCESS"))
        {
            HttpSession session=request.getSession(); //to register session
            session.setAttribute("userName",userName); // to set the attribute to the session
            //request.getRequestDispatcher("/index.jsp").forward( request, response);//RequestDispatcher is used
            //to redirect to Home.jsp page
            RequestDispatcher rd = request.getRequestDispatcher ("indexStaff.jsp"); //RequestDispatcher is used
            rd.forward(request, response); //to redirect to index.jsp page
        }
        else
        {
            request.setAttribute("errMessage", userValidateCust);//returns Invalid user credentials (fail login)
            RequestDispatcher rd = request.getRequestDispatcher ("/login.jsp"); //RequestDispatcher is used
            rd.forward(request, response); //to redirect to Login.jsp page
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
