/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import model.Customer;

/**
 *
 * @author Viet
 */
public class CustomersDAO extends MyDAO{
    public Customer findByUsername(String username) throws SQLException {
        this.xSql = "select * from Customers where Username = ?";
        this.ps = this.connection.prepareStatement(this.xSql);
        this.ps.setString(1, username);
        
        this.rs = this.ps.executeQuery();
        if(rs.next()) {
            return new Customer(rs.getString("Username"), rs.getString("Password"), rs.getString("CustomerName"), rs.getString("PhoneNumber"));
        } else {
            return null;
        }
    }
    
    public void createCustomer(String username, String password) throws SQLException {
        this.xSql = "insert into Customers (Username, Password) values (?, ?)";
        this.ps = this.connection.prepareStatement(this.xSql);
        this.ps.setString(1, username);
        this.ps.setString(2, password);
        this.ps.execute();
    }
}
