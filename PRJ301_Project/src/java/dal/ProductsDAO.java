/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author Viet
 */
public class ProductsDAO extends MyDAO {
    public List<Product> getProductList(String qName, int categoryId, double priceLow, double priceHigh, int page, int pageSize, boolean sortAsc) throws SQLException {
        String queryName = "1 = 1";
        if (qName != null && !qName.isEmpty()) {
            queryName = String.format("ProductName like '%%%s%%'", qName);
        }
        
        String queryCategory = "1 = 1";
        if(categoryId != (-1)) {
            queryCategory = String.format("CategoryId = %d", categoryId);
        }
        
        String queryPriceLow = "1 = 1";
        if(priceLow != -1) {
            queryPriceLow = String.format("UnitPrice >= %f", priceLow);
        }
        
        String queryPriceHigh= "1 = 1";
        if(priceLow != -1) {
            queryPriceHigh = String.format("UnitPrice <= %f", priceHigh);
        }
        
        String sort = sortAsc ? "ASC" : "DESC";
        
        int offset = page * pageSize;
        int limit = pageSize;
        
        
        this.xSql = String.format("Select * from Products where %s and %s and %s and %s order by UnitPrice %s offset %d rows fetch next %d rows only", queryName, queryCategory, queryPriceLow, queryPriceHigh, sort, offset, limit);
        ps = this.connection.prepareStatement(this.xSql);
        this.rs = this.ps.executeQuery();
        
        ArrayList<Product> result = new ArrayList<>();
        while(this.rs.next()) {
            Product p = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("ImageUrl"), rs.getInt("UnitsInStock"), rs.getDouble("UnitPrice"), rs.getInt("CategoryID"));
            result.add(p);
        }
        
        return result;
    }
    
        public int getProductListCount(String qName, int categoryId, double priceLow, double priceHigh, int page, int pageSize, boolean sortAsc) throws SQLException {
        String queryName = "1 = 1";
        if (qName != null && !qName.isEmpty()) {
            queryName = String.format("ProductName like '%%%s%%'", qName);
        }
        
        String queryCategory = "1 = 1";
        if(categoryId != (-1)) {
            queryCategory = String.format("CategoryId = %d", categoryId);
        }
        
        String queryPriceLow = "1 = 1";
        if(priceLow != -1) {
            queryPriceLow = String.format("UnitPrice >= %f", priceLow);
        }
        
        String queryPriceHigh= "1 = 1";
        if(priceLow != -1) {
            queryPriceHigh = String.format("UnitPrice <= %f", priceHigh);
        }
        
        this.xSql = String.format("Select count(*) from Products where %s and %s and %s and %s", queryName, queryCategory, queryPriceLow, queryPriceHigh);
        ps = this.connection.prepareStatement(this.xSql);
        this.rs = this.ps.executeQuery();
        
        if(this.rs.next()) {
            return rs.getInt(1);
        } else {
            return -1;
        }
    }
    
    public Product getProduct(int productId) throws SQLException {
        xSql = "Select * from Products where ProductID = ? ";
        this.ps = this.connection.prepareStatement(xSql);
        this.ps.setInt(1, productId);
        this.rs = this.ps.executeQuery();
        
        if(rs.next()) {
            Product d = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("ImageUrl"), rs.getInt("UnitsInStock"), rs.getDouble("UnitPrice"), rs.getInt("CategoryID"));
            return d;
        }
        
        return null;
    }
    
    public void updateProduct(Product p) throws SQLException {
        xSql = "update Products set ProductName = ?, ImageUrl = ?, UnitsInStock = ?, UnitPrice = ?, CategoryID = ? where ProductID = ?";
        this.ps = this.connection.prepareStatement(xSql);
        ps.setString(1, p.getProductName());
        ps.setString(2, p.getImageUrl());
        ps.setInt(3, p.getUnitsInStock());
        ps.setDouble(4, p.getUnitPrice());
        ps.setInt(5, p.getCategoryID());
        ps.setInt(6, p.getProductID());

        ps.executeUpdate();
    }
}
