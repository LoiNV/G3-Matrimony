/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import fpt.utils.JsonUtils;
import fpt.ws.FriendsWS;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Friends;
import model.Users;

/**
 *
 * @author Admin
 */
public class AddFriendServlet extends HttpServlet {

    FriendsWS fws = new FriendsWS();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charsset=UTF-8");
        PrintWriter out = response.getWriter();

        Gson g = new Gson();

        String id = request.getParameter("fromId");
        Users fromUser = JsonUtils.getUser(new UsersWS().find(String.class, id));
        Users user = (Users) request.getSession().getAttribute("infouser");

        String answer = request.getParameter("answer");

        if (answer.equals("accept")) {

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String createDate = dateFormat.format(new Date());

            String namespace = user.getId() + "_" + fromUser.getId();
            Friends fr = new Friends(user, fromUser, createDate, namespace);

            fws.create(g.toJson(fr));

            request.setAttribute("listFriends", null);

            out.println(g.toJson("Add " + user.getName() + " success"));
        } else {
            out.println(g.toJson(user.getName() + " Not Accept"));
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
