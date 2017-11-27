/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entiry;

import java.util.Date;

/**
 *
 * @author rat
 */
public class Article implements Comparable<Article> {

    private int id, categoryId;
    private String name, imagePath, content;
    private Date postedDate;

    public Article(int id, int categoryId, String name, String imagePath, String content, Date postedDate) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.imagePath = imagePath;
        this.content = content;
        this.postedDate = postedDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }

    @Override
    public int compareTo(Article article) {
        return article.getPostedDate().compareTo(postedDate);
    }

}
