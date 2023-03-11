/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.SQLException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author Viet
 */
public class OrdersDAO extends MyDAO {

    public List<Order> getOrderList(String username, Date from, Date to, int pageIndex, int pageSize) throws SQLException {
        String fromQuery = "1 = 1";
        if (from != null) {
            fromQuery = String.format("OrderDate => %s", fromQuery);
        }

        String toQuery = "1 = 1";
        if (to != null) {
            toQuery = String.format("OrderDate <= %s", fromQuery);
        }

        int offset = pageIndex * pageSize;
        int limit = pageSize;

        xSql = String.format("select * from Orders where Status <> 0 and Username = ? and %s and %s order by OrderDate desc offset %d rows fetch next %d rows only", fromQuery, toQuery, offset, limit);
        this.ps = this.connection.prepareStatement(xSql);
        ps.setString(1, username);
        this.rs = ps.executeQuery();

        List<Order> result = new ArrayList<>();
        while (rs.next()) {
            Order o = new Order(rs.getInt("OrderID"), rs.getString("Username"), rs.getDate("OrderDate"), rs.getString("ShipAddress"), rs.getInt("Status"));
            result.add(o);
        }

        return result;
    }

    public int getOrderListCount(String username, Date from, Date to) throws SQLException {
        String fromQuery = "1 = 1";
        if (from != null) {
            fromQuery = String.format("OrderDate => %s", fromQuery);
        }

        String toQuery = "1 = 1";
        if (to != null) {
            toQuery = String.format("OrderDate <= %s", fromQuery);
        }

        xSql = String.format("select count(distinct OrderID)as[numOrd] from Orders where Status <> 0 and Username = ? and %s and %s", fromQuery, toQuery);
        this.ps = this.connection.prepareStatement(xSql);
        ps.setString(1, username);
        this.rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("numOrd");
        } else {
            return -1;
        }
    }

    public void insert(String username) throws SQLException {
        this.xSql = "Insert into Orders(Username) values (?)";
        ps = this.connection.prepareStatement(xSql);
        ps.setString(1, username);
        ps.execute();
    }

    public void update(Order o) throws SQLException {
        this.xSql = "Update Orders set Username = ?, OrderDate = ?, ShipAddress = ?, Status = ? where OrderID = ?";
        this.ps = this.connection.prepareStatement(xSql);
        ps.setString(1, o.getUsername());
        ps.setDate(2, o.getOrderDate());
        ps.setString(3, o.getShipAddress());
        ps.setInt(4, o.getOrderID());
        ps.setInt(5, o.getOrderID());

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

    public void placeOrder(String username, String shipAddress) throws SQLException {
        Order o = getCart(username);
        OrderDetailsDAO dod = new OrderDetailsDAO();
        if (!dod.getDetails(o.getOrderID()).isEmpty()) {
            o.setShipAddress(shipAddress);
            o.setStatus(1);

            Date sqlDate = new Date(java.util.Date.from(Instant.now()).getTime());
            o.setOrderDate(sqlDate);
            update(o);
        }
    }
}
