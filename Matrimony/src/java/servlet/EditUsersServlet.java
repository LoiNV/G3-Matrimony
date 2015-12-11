/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import fpt.ws.UsersWS;
import java.io.IOException;
import java.io.PrintWriter;
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

        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charsset=UTF-8");
        String id = request.getParameter("id");
        int idTemp = Integer.parseInt(id);
        
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        int status = Integer.parseInt(request.getParameter("status"));
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String birthday = request.getParameter("birthday");
        String maritalstatus = request.getParameter("maritalStatus");
        int height = Integer.parseInt(request.getParameter("height"));
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String religion = request.getParameter("religion");
        String caste = request.getParameter("caste");
        System.out.println("ID:"+id+"\nFirstName:"+firstName +"\nLátN:"+ lastName +"\nGender:"+ gender+"\nBirdthday:"+birthday+"\nMari:"+maritalstatus
                +"\nHegith"+height+"\nCoutry:"+country+"\nCity:"+city+"\nPhone"+phone+"\nReli:"+religion+"\nCaste:"+caste);
        Users u = new Users(idTemp, name, password, email, gender, birthday, firstName, lastName, maritalstatus,
                height, age, country, city, phone, religion, caste, status);
        Gson g = new Gson();
        String result = g.toJson(u);
        System.out.println(result);
        UsersWS uws = new UsersWS();
        //sak sao ông lại đi truyền vào chuỗi json chỗ đó
        uws.edit_JSON(u, id);
        response.sendRedirect("/Matrimony/FindIdUser?id="+id);
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
