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
            Product p = getProduct(id);
            if (p != null) {
                request.setAttribute("product", p);
                request.getRequestDispatcher("/product.jsp").include(request, response);
            } else {
                response.sendRedirect("/index");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    Product getProduct(String id) throws SQLException {
        if (id == null) {
            return null;
        }
        id = id.substring(1);

        int xId;
        try {
            xId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            return null;
        }

        return dp.getProduct(xId);
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
            Object xus = request.getSession().getAttribute("username");
            if (xus == null) {
                response.sendRedirect("/login");
            } else {
                String username = xus.toString();
                Product p = getProduct(request.getPathInfo());
                if (p == null) {
                    response.sendRedirect("/index");
                } else {
                    String sQuantity = request.getParameter("quantity");
                    int xQuantity = Integer.parseInt(sQuantity);
                    dord.addProductToCart(username, p.getProductID(), xQuantity);
                    response.sendRedirect(request.getRequestURI());
                    request.setAttribute("status", "Add to cart successful");
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
