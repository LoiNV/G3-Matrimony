/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import fpt.ws.UsersWS;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Users;


/**
 *
 * @author nghiawin
 */
@WebServlet(name = "UsersCreateSevlet", urlPatterns = {"/UsersCreateSevlet"})
public class UsersCreateSevlet extends HttpServlet {

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
        response.setContentType("application/json;charsset=UTF-8");
      
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String birthday = day+"/"+month+"/"+year;
        Date d = new Date();
        SimpleDateFormat fo = new SimpleDateFormat("dd/MM/yyyy");
        int datenow = Integer.parseInt(fo.format(d).substring(6, 10));
        int age = datenow - Integer.parseInt(year);
        Users u = new Users(username, password, email, gender, birthday, age);
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();
        UsersWS uws = new UsersWS();
        System.out.println(gson.toJson(u));
        uws.create_JSON(gson.toJson(u));
        
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
