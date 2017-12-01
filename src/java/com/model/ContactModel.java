/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author rat
 */
public class ContactModel {

    public void insertContact(Contact contact) throws Exception {
        Connection conn = new DBContext().getConnection();
        String query = "INSERT INTO CONTACT(Name, Email, Phone, Company, Content) "
                + "VALUES (?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(query);

        ps.setNString(1, contact.getName());
        ps.setString(2, contact.getEmail());
        ps.setString(3, contact.getPhone());
        ps.setNString(4, contact.getCompany());
        ps.setNString(5, contact.getMessage());

        ps.execute();
    }
}
