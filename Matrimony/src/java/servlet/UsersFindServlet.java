/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import check.CheckFriend;
import fpt.utils.JsonUtils;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charsset=UTF-8");
        String result = "";

        UsersWS uws = new UsersWS();

        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String age1 = request.getParameter("age1");
        String age2 = request.getParameter("age2");
        String city = request.getParameter("city");
        String country = request.getParameter("country");

        if (name.isEmpty()) {
            name = " ";
        }
        if (city.isEmpty()) {
            city = " ";
        }
        if (country.isEmpty()) {
            country = " ";
        }

        result = uws.searchForAll(String.class, name, gender, age1, age2, city, country);
        List<Users> list = new LinkedList<>();
        list = JsonUtils.getListUser(result);
        Users user = (Users) request.getSession().getAttribute("infouser");

        if (user != null) {
            for (Users u : list) {
                if (u.getId() == user.getId()) {
                    list.remove(u);
                    break;
                }
            }

            for (Users u2 : list) {
                if (CheckFriend.checkExistFriend(user.getId(), u2.getId())) {
                    u2.setStatus(3);
                }
            }
        }

        request.setAttribute("ListSearch", list);
        request.getRequestDispatcher("search-listing.jsp").forward(request, response);
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
