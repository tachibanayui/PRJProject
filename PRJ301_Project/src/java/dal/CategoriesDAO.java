/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author Viet
 */
public class CategoriesDAO extends MyDAO{
    public List<Category> getCategories() throws SQLException {
        this.xSql = "select * from Categories";
        this.ps = this.connection.prepareStatement(xSql);
        this.rs = this.ps.executeQuery();
        ArrayList<Category> result = new ArrayList<>();
        while(rs.next()) {
            Category c = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getString("Description"));
            result.add(c);
        }
        return result;
    }
}
