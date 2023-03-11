/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
/**
 *
 * @author Viet
 */
public class Product {
    private int ProductID;
    private String ProductName;
    private String ImageUrl;
    private int UnitsInStock;
    private double UnitPrice;
    private int CategoryID;
    private String Description;
    public Product() {
    }

    public Product(int ProductID, String ProductName, String ImageUrl, int UnitsInStock, double UnitPrice, int CategoryID, String Description) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ImageUrl = ImageUrl;
        this.UnitsInStock = UnitsInStock;
        this.UnitPrice = UnitPrice;
        this.CategoryID = CategoryID;
        this.Description = Description;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }


    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getImageUrl() {
        return ImageUrl;
    }

    public void setImageUrl(String ImageUrl) {
        this.ImageUrl = ImageUrl;
    }

    public int getUnitsInStock() {
        return UnitsInStock;
    }

    public void setUnitsInStock(int UnitsInStock) {
        this.UnitsInStock = UnitsInStock;
    }

    public void addUnitsInStock(int amount) {
        this.UnitsInStock += amount;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }
    


}
