/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDetailsDAO;
import dal.OrdersDAO;
import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Ord;
import model.Order;
import model.OrderDetail;
import model.Product;
import utils.ServletUtils;

/**
 *
 * @author Yui
 */
@WebServlet(name = "OrdersServlet", urlPatterns = {"/orders"})
public class OrdersServlet extends HttpServlet {

    OrdersDAO dord;
    OrderDetailsDAO dod;
    ProductsDAO pd;
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
        String username = ServletUtils.getLoginUsername(request, response, true);
        if (username != null) {
            try {
                String sFrom = request.getParameter("from");
                String sTo = request.getParameter("to");
                String sPage = request.getParameter("page");
                
                Date from = null;
                Date to = null;
                int page = 0;
                try {
                    from = Date.valueOf(sFrom);
                    to = Date.valueOf(sTo);
                    page = Integer.parseInt(sPage) - 1;
                } catch (Exception e) {}
                
                List<Order> os = dord.getOrderList(username, from, to, page, 10);
                HashMap<Integer, List<Ord>> ods = new HashMap<>();
                for (Order o : os) {
                    List<Ord> x = dod.getDetail(o.getOrderID());
                    ods.put(o.getOrderID(), x);
                }
                
                int count = dord.getOrderListCount(username, from, to);
                request.setAttribute("orders", os);
                request.setAttribute("details", ods);
                request.setAttribute("count", count);
                request.getRequestDispatcher("/orders.jsp").include(request, response);
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
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
        try {
            String username = ServletUtils.getLoginUsername(request, response, true);
            String action = request.getParameter("action");
            if (username != null) {
                if (action.equals("Place Order")) {

                    String shipAddr = request.getParameter("shipAddress");
                    dord.placeOrder(username, shipAddr);
                }
            }

            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        dord = new OrdersDAO();
        dod = new OrderDetailsDAO();
        pd = new ProductsDAO();
    }

}
