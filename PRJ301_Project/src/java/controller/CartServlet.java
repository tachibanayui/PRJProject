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
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.Product;
import utils.ServletUtils;

/**
 *
 * @author Yui
 */
@WebServlet(name="CartServlet", urlPatterns={"/cart/*"})
public class CartServlet extends HttpServlet {
    ProductsDAO dp;
    OrdersDAO dord;
    OrderDetailsDAO dod;
    
    void process(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String username = ServletUtils.getLoginUsername(request, response, true);
        if(username != null) {
            Order o = dord.getCart(username);
            List<OrderDetail> ods = dod.getDetails(o.getOrderID());
            HashMap<Integer, Product> products = new HashMap<>();
            double total = 0;
            
            for(OrderDetail od: ods) {
                Product p = dp.getProduct(od.getProductID());
                products.put(od.getProductID(), p);
                total += od.getUnitPrice();
            }
            
            request.setAttribute("cartItems", ods);
            request.setAttribute("products", products);
            request.setAttribute("total", total);
            request.setAttribute("shipAddress", o.getShipAddress());
            request.getRequestDispatcher("/cart.jsp").include(request, response);
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            process(request, response);
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = ServletUtils.getLoginUsername(request, response, true);
        String action = request.getParameter("action");
        
        if(username != null && action != null) {
            try {
                Product p = ServletUtils.getProduct(request.getPathInfo(), dp);
                
                if(action.equals("Delete All")) {
                    dord.deleteAllCartItems(username);
                } else if (action.equals("Remove") && p != null) {
                    dord.setProductToCart(username, p.getProductID(), 0);
                } else if (action.equals("Update") && p != null) {
                    String sNum = request.getParameter("quantity");
                    int xNum = Integer.parseInt(sNum);
                    dord.setProductToCart(username, p.getProductID(), xNum);
                } else if (action.equals("Add To Cart") && p != null) {
                    String sNum = request.getParameter("quantity");
                    int xNum = Integer.parseInt(sNum);
                    dord.setProductToCart(username, p.getProductID(), xNum);
                }
                
                process(request, response);
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        }
    }
    
    /** 
     * Returns a short description of the servlet.
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
        dod = new OrderDetailsDAO();
    }
    
    

}
