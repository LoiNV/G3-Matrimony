/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import chat.ChatServer;
import fpt.utils.JsonUtils;
import fpt.ws.AdvertisementsWS;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Advertisement;
import model.Users;

/**
 *
 * @author Admin
 */
public class HomeServlet extends HttpServlet {
    
    ChatServer chat = new ChatServer();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!chat.isStart()) {
            chat.startServer();
        }
        
        UsersWS uws = new UsersWS();
        List<Users> listU = JsonUtils.getListUser(uws.findAll(String.class));
        Random r = new Random();
        List<Users> list = new LinkedList<>();

        Collections.shuffle(listU);
        for (int i = 0; i < 8; i++) {
            HashMap<String, Users> urls = new HashMap<>();
            urls.put("Value", listU.get(i));
            list.add(urls.get("Value"));
        }
    
        request.setAttribute("list", list);
        
        AdvertisementsWS aws = new AdvertisementsWS();
        List<Advertisement> ls = new LinkedList<>();        
        String result = aws.findAll(String.class);
        
        ls = JsonUtils.getListAdv(result);
        for (Advertisement a : ls) {
            if (a.getStatus() == 1) {
                request.getSession().setAttribute("adv", a);
                break;
            }
        }

       request.getRequestDispatcher("index.jsp").forward(request, response);
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
