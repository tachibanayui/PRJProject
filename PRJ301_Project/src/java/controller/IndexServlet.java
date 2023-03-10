/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoriesDAO;
import dal.CustomersDAO;
import dal.ProductsDAO;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Product;

/**
 *
 * @author Yui
 */
@WebServlet(name = "IndexServlet", urlPatterns = {"/index"})
public class IndexServlet extends HttpServlet {
 private ProductsDAO dp;
    private CategoriesDAO dc;
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String sSort = request.getParameter("sort");
            String sCategory = request.getParameter("category");
            String sPriceLow = request.getParameter("priceLow");
            String sPriceHigh = request.getParameter("priceHigh");
            String sPage = request.getParameter("page");
            
            String sSearch = request.getParameter("search");
            boolean xSort = sSort != null && sSort.equals("asc");
            
            int xCat = -1;
            try {
                xCat = Integer.parseInt(sCategory);
            } catch (Exception e ){}
            
            double xLow = -1;
            try {
                xLow = Double.parseDouble(sPriceLow);
            } catch (Exception e ){}
            
            double xHigh = -1;
            try {
                xHigh = Double.parseDouble(sPriceHigh);
            } catch (Exception e ){}
            
            int xPage = 0;
            try {
               xPage = Integer.parseInt(sPage) - 1;
            } catch (Exception e) {}
            List<Product> ps = dp.getProductList(sSearch, xCat, xLow, xHigh, xPage, 8, xSort);
            request.setAttribute("categories", dc.getCategories());
            request.setAttribute("products", ps);
            request.getRequestDispatcher("index.jsp").include(request, response);
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
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
        // throw new RuntimeException("fuck");
         process(request, response);
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
        process(request, response);
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
    public void init(ServletConfig config) throws ServletException {
        super.init(config); 
        this.dc = new CategoriesDAO();
        this.dp = new ProductsDAO();
    }
}
