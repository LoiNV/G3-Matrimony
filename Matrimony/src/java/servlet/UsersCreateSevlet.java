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
import fpt.utils.JsonUtils;
import fpt.utils.MD5;
import fpt.ws.UsersWS;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
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

            Gson gson = new Gson();
            UsersWS uws = new UsersWS();

            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = MD5.encodePwd(request.getParameter("password"));
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            String birthday = request.getParameter("birthday");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Date birthTemp = sdf.parse(birthday);
            long currentTime = System.currentTimeMillis();
            long time = currentTime - birthTemp.getTime();
            int age = (int) (time / ((24 * 60 * 60 * 1000) + 1)) / 365;          

            String u2 = uws.findByEmailUsers(String.class, email);
            Users user = JsonUtils.getUser(u2);
            if (user == null) {
                if (age >= 18) {
                    Users u = new Users(username, password, email, gender, birthday, age);
                    
                    u.setAvatar(request.getScheme() +"://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() +"/img/default.png");
                    uws.create(u);
                    System.out.println(email);
                    String u3 = uws.findByEmailUsers(String.class, email);
                    System.out.println(u3);
                    Users user2 = JsonUtils.getUser(u3);
                    System.out.println(user2.getName() + "");

                    request.setAttribute("alert", "Register successful!");
                    request.getSession().setAttribute("infouser", user2);
                    request.getSession().setAttribute("login", "true");
                    request.getSession().setAttribute("timeActive", 0);
                    request.getRequestDispatcher("FindIdUser?id=" + user2.getId()).forward(request, response);
                } else {
                    request.setAttribute("alert", "You you are under age!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("alert", "Email already exist!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } catch (ParseException ex) {
            request.setAttribute("alert", "Register Failed!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
