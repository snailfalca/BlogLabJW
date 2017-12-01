/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.Article;
import com.entity.Category;
import com.model.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 *
 * @author rat
 */
public class CategoryBean {

    //Get all categories
    public List<Category> getAllCategories()
            throws Exception {
        ArrayList<Category> articles = new ArrayList<>();
        Connection conn = new DBContext().getConnection();

        String query = "SELECT * FROM Category";
        PreparedStatement ps = conn.prepareStatement(query);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("ID");
            String name = rs.getString("Name");
            articles.add(
                    new Category(id, name));

        }

        return articles;
    }
}
