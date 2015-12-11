/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.LinkedList;
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
        Gson g = new Gson();
        List<Users> ls = new LinkedList<>();
        Type collectionType = new TypeToken<List<Users>>() {}.getType();
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        Class<String> res = String.class;
        String result = uws.findByEmailAndPassUsers_JSON(res, username, pass);
        ls = g.fromJson(result, collectionType);
        System.out.println(ls.size());
        
        HttpSession session = request.getSession();
        if (session.getAttribute("currentURI") == null) {
            session.setAttribute("currentURI", request.getParameter("uri"));
        }
        
        if (ls.size()>0) {
            session.setAttribute("login", "true");
            session.setAttribute("infouser", ls.get(0).getId());
            response.sendRedirect(session.getAttribute("currentURI").toString());
        }else{
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
