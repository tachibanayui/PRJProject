/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import model.Order;

/**
 *
 * @author Viet
 */
public class OrdersDAO extends MyDAO {

    public void insert(String username) throws SQLException {
        this.xSql = "Insert into Orders(Username) values (?)";
        ps = this.connection.prepareStatement(xSql);
        ps.setString(1, username);
        ps.execute();
    }
    
    public void delete(int orderId) throws SQLException {
        this.xSql = "Delete from Orders where OrderID = ?";
        this.ps = this.connection.prepareStatement(xSql);
        ps.setInt(1, orderId);
        ps.execute();
    }
    
    public Order getCart(String username) throws SQLException {
        this.xSql = "Select * from Orders where Username = ? and Status = 0";
        this.ps = this.connection.prepareStatement(xSql);
        ps.setString(1, username);
        this.rs = ps.executeQuery();
        if (rs.next()) {
            Order o = new Order(rs.getInt("OrderID"), rs.getString("Username"), rs.getDate("OrderDate"), rs.getString("ShipAddress"), rs.getInt("Status"));
            return o;
        } else {
            insert(username);
            return getCart(username);
        }
    }
    
    public void deleteAllCartItems(String username) throws SQLException {
        Order o = getCart(username);
        delete(o.getOrderID());
    }

    public void addProductToCart(String username, int productId, int quantity) throws SQLException {
        Order o = getCart(username);
        OrderDetailsDAO dod = new OrderDetailsDAO();
        dod.addProductQuantity(o.getOrderID(), productId, quantity);
    }

    public void setProductToCart(String username, int productId, int quantity) throws SQLException {
        Order o = getCart(username);
        OrderDetailsDAO dod = new OrderDetailsDAO();
        dod.setProductQuantity(o.getOrderID(), productId, quantity);
    }
}
