/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dal.ProductsDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import model.Product;

/**
 *
 * @author Yui
 */
public class ServletUtils {
    public static String getLoginUsername(HttpServletRequest request, HttpServletResponse response, boolean redirectLogin) throws IOException {
        Object xus = request.getSession().getAttribute("username");
        if (xus != null) {
            return xus.toString();
        } else {
            if(redirectLogin) {
                response.sendRedirect("/login");
            }
            return null;
        }
    }
    
    public static Product getProduct(String id, ProductsDAO dp) throws SQLException {
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
    
    public static String getParamSetAttr(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        request.setAttribute(name, value);
        return value;
    }
}
