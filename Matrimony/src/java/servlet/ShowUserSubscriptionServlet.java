/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import fpt.ws.UserSubcriptionsWS;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserSubcription;
import model.Users;

/**
 *
 * @author Admin
 */
public class ShowUserSubscriptionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserSubcriptionsWS uws = new UserSubcriptionsWS();
        List<UserSubcription> ls = new LinkedList<>();
        Type collection = new TypeToken<List<UserSubcription>>() {
        }.getType();
        Gson g = new Gson();
        Class<String> res = String.class;
        String result = uws.findAll(res);
        ls = g.fromJson(result, collection);
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            long currentTime = System.currentTimeMillis();
            for (UserSubcription us : ls) {
                String createDate = us.getChargedDate();
                if (createDate.contains("-")) {
                    createDate = createDate.replaceAll("-", "/");
                }
                Date exp = sdf.parse(createDate);
                long time = currentTime - exp.getTime();
                int day = (int) (time / (1000 * 60 * 60 * 24));
                int duration = us.getSubId().getDuration();
                us.getSubId().setDuration(duration-day);
            }
        } catch (ParseException ex) {
            Logger.getLogger(ShowUserSubscriptionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        Collections.sort(ls, new Comparator<UserSubcription>() {

            @Override
            public int compare(UserSubcription t, UserSubcription t1) {
                if (t.getId() > t1.getId()) {
                    return -1;
                }
                if (t.getId() < t1.getId()) {
                    return 1;
                }
                return 0;
            }
        });
        request.setAttribute("listUS", ls);
        RequestDispatcher rd = request.getRequestDispatcher("layer_admin/showUsersSubscription.jsp");
        rd.forward(request, response);
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
