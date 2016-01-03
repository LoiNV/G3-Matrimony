/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.uploadFile;

import com.google.gson.Gson;
import fpt.utils.JsonUtils;
import fpt.ws.ImagesWS;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customers;
import model.Images;
import model.Users;

/**
 *
 * @author Admin
 */
public class UpLoadFileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Users user = (Users) request.getSession().getAttribute("infouser");
        if (user != null) {
            String path = UploadFile.upload(request, user.getName());

            if (!path.equals("")) {
                Images img = new Images(path, user);
                String json = new Gson().toJson(img, Images.class);
                ImagesWS iws = new ImagesWS();
                iws.create(json);

                String imgs = iws.findByUser(String.class, user.getId() + "");
                List<Images> listImg = JsonUtils.getListImages(imgs);
                request.setAttribute("listImg", listImg);
            }
            request.getRequestDispatcher("edit-profile.jsp?id=" + user.getId() + "#my-photos").forward(request, response);
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
