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
import fpt.utils.JsonUtils;
import fpt.ws.UsersWS;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        try {
            response.setContentType("application/json;charsset=UTF-8");
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

            String birthday =request.getParameter("birthday");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yy");
            Date birthTemp = sdf.parse(birthday);
            long currentTime = System.currentTimeMillis();
            long time = currentTime - birthTemp.getTime();
            int age = (int) (time / ((24 * 60 * 60 * 1000)+1))/365;
            
            Users u = new Users(username, password, email, gender, birthday, age);
            Gson gson = new Gson();
            UsersWS uws = new UsersWS();
            
            uws.create_JSON(gson.toJson(u));
            
            String u2 = uws.findByEmailUsers_JSON(String.class, email);
            List<Users> listU = JsonUtils.getListJson(u2);
            int id = listU.get(0).getId();
            request.getRequestDispatcher("FindIdUser?id="+ id).forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UsersCreateSevlet.class.getName()).log(Level.SEVERE, null, ex);
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
