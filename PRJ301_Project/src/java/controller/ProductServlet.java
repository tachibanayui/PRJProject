/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrdersDAO;
import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import utils.ServletUtils;

/**
 *
 * @author Yui
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/product/*"})
public class ProductServlet extends HttpServlet {

    ProductsDAO dp;
    OrdersDAO dord;

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
        try {
            String id = request.getPathInfo();
            Product p = ServletUtils.getProduct(id, dp);
            if (p != null) {
                request.setAttribute("product", p);
                request.getRequestDispatcher("/product.jsp").include(request, response);
            } else {
                response.sendRedirect("/");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
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
        try {
            String username = ServletUtils.getLoginUsername(request, response, true);
            if (username != null) {
                Product p = ServletUtils.getProduct(request.getPathInfo(), dp);
                if (p == null) {
                    response.sendRedirect("/");
                } else {
                    String sQuantity = request.getParameter("quantity");
                    int xQuantity = Integer.parseInt(sQuantity);
                    dord.addProductToCart(username, p.getProductID(), xQuantity);
                    response.sendRedirect("/cart");
                }
            }

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
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

    @Override
    public void init() throws ServletException {
        super.init(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
        dp = new ProductsDAO();
        dord = new OrdersDAO();
    }

}
