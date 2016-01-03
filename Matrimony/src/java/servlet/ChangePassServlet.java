/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import fpt.utils.MD5;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author Admin
 */
public class ChangePassServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldpass = MD5.encodePwd(request.getParameter("oldpass"));
        String newpass = MD5.encodePwd(request.getParameter("newpass"));
        String confirm = MD5.encodePwd(request.getParameter("confirm"));
        Users u = (Users) request.getSession().getAttribute("infouser");

        Gson g = new Gson();
        response.setContentType("application/json;charset=UTF-8");
        String msg;
        try (PrintWriter out = response.getWriter()) {
            if (!u.getPassword().equals(oldpass)) {                
                msg ="Password not corect";
            } else {
                if (!newpass.equals(confirm)) {
                    msg = "Password not Confirm";
                } else {
                    
                    u.setPassword(confirm);
                    UsersWS uws = new UsersWS();
                    uws.edit(u, u.getId() + "");
                    msg = "Changed success !";
                    request.getSession().setAttribute("infouser", u);
                }
            }
            out.printf(g.toJson(msg));
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
