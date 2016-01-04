/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "EditUsersServlet", urlPatterns = {"/EditUsersServlet"})
public class EditUsersServlet extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json;charsset=UTF-8");
            UsersWS uws = new UsersWS();
            Gson g = new Gson();

            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

            String birthday = request.getParameter("birthday");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yy");
            Date birthTemp = sdf.parse(birthday);
            long now = System.currentTimeMillis();
            long age1 = now - birthTemp.getTime();
            int age = (int) (age1 / ((24 * 60 * 60 * 1000) + 1)) / 365;

            String maritalstatus = request.getParameter("maritalStatus");
            String country = request.getParameter("country");
            String city = request.getParameter("city");
            String phone = request.getParameter("phone");
            String religion = request.getParameter("religion");
            String caste = request.getParameter("caste");
            String desc = new String(request.getParameter("desc").getBytes("ISO-8859-1"));
            
            String u = uws.find(String.class, id);
            Users user = g.fromJson(u, Users.class);
            user.setName(name);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setGender(gender);
            user.setBirthday(birthday);
            user.setAge(age);
            user.setMaritalStatus(maritalstatus);
            user.setCountry(country);
            user.setCity(city);
            user.setPhone(phone);
            user.setReligion(religion);
            user.setCaste(caste);
            user.setDescription(desc);
            uws.edit(user, id);

            request.getSession().setAttribute("infouser", user);
            response.sendRedirect("/Matrimony/FindIdUser?id=" + id);
        } catch (ParseException ex) {
            Logger.getLogger(EditUsersServlet.class.getName()).log(Level.SEVERE, null, ex);
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
