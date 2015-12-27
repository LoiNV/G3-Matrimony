/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import fpt.ws.AdvertisementWS;
import fpt.ws.CustomersWS;
import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Advertisement;
import model.Customers;
import model.Users;

/**
 *
 * @author nghiawin
 */
@WebServlet(name = "AdvertismentCreateServlet", urlPatterns = {"/AdvertismentCreateServlet"})
public class AdvertismentCreateServlet extends HttpServlet {

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
        response.setContentType("application/json;charsset=UTF-8");

        String customerId = request.getParameter("customerId");
        String image = request.getParameter("image");
        String link = request.getParameter("link");
        String message = request.getParameter("message");
        double price = Double.parseDouble(request.getParameter("price"));
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String createdDate = sdf.format(date);
        System.out.println("\nimage:" + image + "\nlink:" + link + "\nmessage" + message + "\nprice:" + price + "\nDate:" + createdDate);
        Advertisement adv = new Advertisement(image, link, message, price, createdDate);
//        Advertisement adv = new Advertisement("BBBBB", "AA", "AAAAA", 99, "19-12-2015");
        CustomersWS cws = new CustomersWS();
        Class<String> res = String.class; 
        String result = cws.find_JSON(res, customerId);
        Gson gson = new Gson();
        Customers u = gson.fromJson(result, Customers.class);
        adv.setCustomerId(u);
        AdvertisementWS aws = new AdvertisementWS();
        System.out.println(gson.toJson(adv));
        aws.create_JSON(gson.toJson(adv));
        response.sendRedirect("Thanksyou.jsp");
        
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
