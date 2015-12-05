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
import java.lang.reflect.Type;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author nghiawin
 */
@WebServlet(name = "UsersFindServlet", urlPatterns = {"/UsersFindServlet"})
public class UsersFindServlet extends HttpServlet {

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
        Class<String> res = String.class;
        List<Users> ls = new LinkedList<>();
        Type collectionType = new TypeToken<List<Users>>() {}.getType();
        String result = "";
        Gson g = new Gson();
        UsersWS uws = new UsersWS();
        String gender = request.getParameter("gender");
        String age1 = request.getParameter("age1");
        String age2 = request.getParameter("age2");
        if (age1.isEmpty() && age2.isEmpty()) {
            result = uws.findByGenderUsers_JSON(res, gender);
            ls = g.fromJson(result, collectionType);
            System.out.println(ls.size());
            request.setAttribute("ListSearch", ls);
            RequestDispatcher rd = request.getRequestDispatcher("search-listing.jsp");
            rd.forward(request, response);
        } else if (gender.equalsIgnoreCase("null") && age1 != null && age2 != null) {
            result = uws.findByAgeToAgeUsers_JSON(res, age1, age2);
            ls = g.fromJson(result, collectionType);
            request.setAttribute("ListSearch", ls);
            RequestDispatcher rd = request.getRequestDispatcher("search-listing.jsp");
            rd.forward(request, response);
            System.out.println(result);
        } else if (!gender.equals("null") && age1 != null && age2 != null) {
            result = uws.findByGenderAndAgeToAgeUsers_JSON(res, gender, age1, age2);
            ls = g.fromJson(result, collectionType);
            request.setAttribute("ListSearch", ls);
            RequestDispatcher rd = request.getRequestDispatcher("search-listing.jsp");
            rd.forward(request, response);
            System.out.println(result);
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
