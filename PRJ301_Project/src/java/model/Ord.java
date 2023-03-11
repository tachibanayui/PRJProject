/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Viet
 */
public class Ord {
    private int OrderID;
    private Product Product;
    private int Quantity;
    private double UnitPrice;

    public Ord(int OrderID, Product Product, int Quantity, double UnitPrice) {
        this.OrderID = OrderID;
        this.Product = Product;
        this.Quantity = Quantity;
        this.UnitPrice = UnitPrice;
    }

    public Ord() {
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public Product getProduct() {
        return Product;
    }

    public void setProduct(Product Product) {
        this.Product = Product;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }
    
}
