/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import fpt.utils.JsonUtils;
import fpt.utils.MD5;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsersWS uws = new UsersWS();

        String username = request.getParameter("email");
        String pass = MD5.encodePwd(request.getParameter("password"));
        String user = uws.findByEmailAndPassUsers(String.class, username, pass);
        Users u = JsonUtils.getUser(user);        

        HttpSession session = request.getSession();
        String time = "0";
        if (u != null) {
            session.setAttribute("login", "true");            
            session.setAttribute("infouser", u);
            
            time = uws.getTimesActive(u.getId() + "");
            session.setAttribute("timeActive", time);

            if (session.getAttribute("currentURI") == null) {
                if (request.getParameter("uri") == null) {
                    response.sendRedirect("index.jsp");
                }else{
                    response.sendRedirect(request.getParameter("uri"));
                }
            } else {
                response.sendRedirect(session.getAttribute("currentURI").toString());
            }
        } else {
            session.setAttribute("login", "false");
            response.sendRedirect("loginPage.jsp");
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

        processRequest(request, response);
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
