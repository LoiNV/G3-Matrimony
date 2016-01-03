/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import fpt.ws.AdvertisementsWS;
import fpt.ws.CustomersWS;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Advertisement;
import model.Customers;
import servlet.uploadFile.UploadFile;

/**
 *
 * @author nghiawin
 */
@WebServlet(name = "AdvertismentCreateServlet", urlPatterns = {"/AdvertismentCreate"})
public class AdvertismentCreateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charsset=UTF-8");

        String image = "No image";
        if (request.getSession().getAttribute("imgAdv") != null) {
            image = request.getSession().getAttribute("imgAdv").toString();
        }
        String link = request.getParameter("link");
        String message = request.getParameter("message");
        int durration = Integer.parseInt(request.getParameter("duration"));
        double amount = Double.parseDouble(request.getParameter("PAYMENTREQUEST_0_AMT"));
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String createdDate = sdf.format(date);

        Advertisement adv = new Advertisement(image, link, durration, message, amount, createdDate);

        Gson gson = new Gson();
        Customers cus = (Customers) request.getSession().getAttribute("customer");
        adv.setCustomerId(cus);

        request.getSession().setAttribute("Advertisment", adv);
        request.getSession().setAttribute("paymentType", "adv");

        request.getRequestDispatcher("Checkout?PAYMENTREQUEST_0_AMT="+amount+"&&currencyCodeType=USD&&paymentType=Sale").forward(request, response);

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
