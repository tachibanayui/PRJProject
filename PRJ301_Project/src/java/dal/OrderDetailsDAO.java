/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author Viet
 */
public class OrderDetailsDAO extends MyDAO {

    public List<OrderDetail> getDetails(int orderId) throws SQLException {
        this.xSql = "Select * from OrderDetails where OrderID = ?";
        this.ps = this.connection.prepareStatement(xSql);
        this.ps.setInt(1, orderId);
        this.rs = this.ps.executeQuery();

        ArrayList<OrderDetail> result = new ArrayList<>();
        while (rs.next()) {
            OrderDetail od = new OrderDetail(rs.getInt("OrderID"), rs.getInt("ProductID"), rs.getInt("Quantity"), rs.getInt("UnitPrice"));
            result.add(od);
        }

        return result;
    }

    public OrderDetail getDetail(int orderId, int productId) throws SQLException {
        this.xSql = "Select * from OrderDetails where OrderID = ? and ProductID = ?";
        this.ps = this.connection.prepareStatement(xSql);
        this.ps.setInt(1, orderId);
        this.ps.setInt(2, productId);
        
        this.rs = ps.executeQuery();

        if (rs.next()) {
            OrderDetail od = new OrderDetail(rs.getInt("OrderID"), rs.getInt("ProductID"), rs.getInt("Quantity"),
                    rs.getInt("UnitPrice"));
            return od;
        }

        return null;
    }

    public void remove(int orderId, int productId) throws SQLException {
        xSql = "delete OrderDetails where OrderID = ? and ProductID = ?";
        this.ps = this.connection.prepareStatement(xSql);
        ps.setInt(1, orderId);
        ps.setInt(2, productId);
        ps.execute();
    }

    public void update(OrderDetail od) throws SQLException {
        xSql = "update OrderDetails set Quantity = ?, UnitPrice = ? where OrderID = ? and ProductID = ?";
        this.ps = this.connection.prepareStatement(xSql);
        ps.setInt(1, od.getQuantity());
        ps.setDouble(2, od.getUnitPrice());
        ps.setInt(3, od.getOrderID());
        ps.setInt(4, od.getProductID());
        ps.executeUpdate();
    }

    public void insert(OrderDetail od) throws SQLException {
        xSql = "insert OrderDetails values (?, ?, ?, ?)";
        this.ps = this.connection.prepareStatement(xSql);
        ps.setInt(1, od.getOrderID());
        ps.setInt(2, od.getProductID());
        ps.setInt(3, od.getQuantity());
        ps.setDouble(4, od.getUnitPrice());
        ps.execute();
    }
    
    public void addProductQuantity(int orderId, int productId, int quantity) throws SQLException {
        OrderDetail od = getDetail(orderId, productId);
        int q = od == null ? 0 : od.getQuantity();
        setProductQuantity(orderId, productId, quantity +  q);
    }

    public void setProductQuantity(int orderId, int productId, int quantity) throws SQLException {
        ProductsDAO dp = new ProductsDAO();
        Product p = dp.getProduct(productId);
        OrderDetail od = getDetail(orderId, productId);

        double unitPrice = p.getUnitPrice() * quantity;
        if (od != null) {
            p.addUnitsInStock(od.getQuantity());
            p.addUnitsInStock(-quantity);
            if (p.getUnitsInStock() < 0) {
                throw new RuntimeException("Cannot add more than stock!");
            }
            od.setQuantity(quantity);
            od.setUnitPrice(unitPrice);

            dp.updateProduct(p);
            if (quantity == 0) {
                remove(orderId, productId);
            } else {
                update(od);
            }
        } else {
            p.addUnitsInStock(-quantity);
            if (p.getUnitsInStock() < 0) {
                throw new RuntimeException("Cannot add more than stock!");
            }

            od = new OrderDetail(orderId, productId, quantity, unitPrice);
            dp.updateProduct(p);
            insert(od);
        }
    }
}
