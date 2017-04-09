package com.amzi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import project.db.DatabaseConnection;

public class LoginDao {
	private static Connection conn = null;
	
    public static int validate(String name, String pass) {        
        int id = 0;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = new DatabaseConnection().getConnection();
            pst = conn
                    .prepareStatement("select * from Users where username=? and password=?");
            pst.setString(1, name);
            pst.setString(2, pass);

            rs = pst.executeQuery();
            if(rs.next()){
            	id = rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return id;
    }
}