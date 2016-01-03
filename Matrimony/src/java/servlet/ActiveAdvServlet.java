/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import fpt.utils.JsonUtils;
import fpt.ws.AdvertisementsWS;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Advertisement;

/**
 *
 * @author Admin
 */
public class ActiveAdvServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        AdvertisementsWS aws = new AdvertisementsWS();
        List<Advertisement> ls = new LinkedList<>();
        String result = aws.findAll(String.class);
        ls = JsonUtils.getListAdv(result);
        Gson g = new Gson();
        for (Advertisement a : ls) {
            if (a.getId() == id) {
                a.setStatus(1);
                aws.edit(g.toJson(a), a.getId()+"");
                request.getSession().setAttribute("adv", a);
            }else{
                if (a.getStatus() == 1) {
                    a.setStatus(0);
                    aws.edit(g.toJson(a), a.getId()+"");
                }
                
            }
            
        }
        request.setAttribute("listAdvertisement", ls);
        
       request.getRequestDispatcher("layer_admin/showAdvertisement.jsp").forward(request, response);
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
