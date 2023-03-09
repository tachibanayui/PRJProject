/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Viet
 */
public class Order {
    private int OrderID;
    private String Username;
    private Date OrderDate;
    private String ShipAddress;
    // 0 - pending
    // 1 - ordered
    // 2 - shipped
    private int Status;
    
    public Order() {
    }

    public Order(int OrderID, String Username, Date OrderDate, String ShipAddress, int Status) {
        this.OrderID = OrderID;
        this.Username = Username;
        this.OrderDate = OrderDate;
        this.ShipAddress = ShipAddress;
        this.Status = Status;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getShipAddress() {
        return ShipAddress;
    }

    public void setShipAddress(String ShipAddress) {
        this.ShipAddress = ShipAddress;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
    
    
    
}
