/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entiry.Article;
import com.model.DBContext;
import java.io.Serializable;
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
public class ArticleBean implements Serializable {

    //Get most recent article
    public Article getNewestArticle()
            throws Exception {
        ArrayList<Article> articles = new ArrayList<>();
        Connection conn = new DBContext().getConnection();

        String query = "SELECT * FROM Article";
        PreparedStatement ps = conn.prepareStatement(query);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("ID"),
                    tempCategoryId = rs.getInt("CategoryID");
            String name = rs.getNString("Name"),
                    imagePath = rs.getNString("ImagePath"),
                    content = rs.getNString("Content");
            Date postedDate = new Date(rs.getDate("PostedDate").getTime());
            articles.add(
                    new Article(id, tempCategoryId,
                            name, imagePath, content, postedDate));

        }

        Collections.sort(articles);
        if (articles.size() > 0) {
            return articles.get(0);
        } else {
            return null;
        }
    }

    //Get article with specific Id
    public Article getArticleById(int Id)
            throws Exception {
        Article article = null;
        Connection conn = new DBContext().getConnection();

        String query = "SELECT * FROM Article WHERE ID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, Id);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("ID"),
                    tempCategoryId = rs.getInt("CategoryID");
            String name = rs.getNString("Name"),
                    imagePath = rs.getNString("ImagePath"),
                    content = rs.getNString("Content");
            Date postedDate = new Date(rs.getDate("PostedDate").getTime());
            article = new Article(id, tempCategoryId,
                    name, imagePath, content, postedDate);
        }

        return article;
    }

    //Get all articles, sort by posted Date
    public List<Article> getRecentArticles()
            throws Exception {
        ArrayList<Article> articles = new ArrayList<>();
        Connection conn = new DBContext().getConnection();

        String query = "SELECT * FROM Article";
        PreparedStatement ps = conn.prepareStatement(query);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("ID"),
                    tempCategoryId = rs.getInt("CategoryID");
            String name = rs.getNString("Name"),
                    imagePath = rs.getNString("ImagePath"),
                    content = rs.getNString("Content");
            Date postedDate = new Date(rs.getDate("PostedDate").getTime());
            articles.add(
                    new Article(id, tempCategoryId,
                            name, imagePath, content, postedDate));

        }

        Collections.sort(articles);
        if (articles.size() > 2) {
            return articles.subList(0, 3);
        } else {
            return articles;
        }
    }

    //Get all articles with specific Id, sort by posted Date
    public ArrayList<Article> getArticlesByCategoryId(int categoryId)
            throws Exception {
        ArrayList<Article> articles = new ArrayList<>();
        Connection conn = new DBContext().getConnection();

        String query = "SELECT * FROM Article WHERE CategoryID = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, categoryId);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("ID"),
                    tempCategoryId = rs.getInt("CategoryID");
            String name = rs.getNString("Name"),
                    imagePath = rs.getNString("ImagePath"),
                    content = rs.getNString("Content");
            Date postedDate = new Date(rs.getDate("PostedDate").getTime());
            articles.add(
                    new Article(id, tempCategoryId,
                            name, imagePath, content, postedDate));

        }

        Collections.sort(articles);
        return articles;
    }
}
