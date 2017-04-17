package com.amzi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import project.db.DatabaseConnection;
/**
 * 
 * @author Chen Deng
 * This class is used to connect database and get user info
 * when login.
 */
public class LoginDao {
	private static Connection conn = null;
	/**
	 * This method first get connection to database and use
	 * parameters to validate if user exist.
	 * @param name username of user
	 * @param pass password
	 * @return user id
	 */
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
    /**
     * This method get the role id of user from database
     * @author Chen Deng
     * @param id id of user
     * @return role id
     */
    public static int validateRole(int id) {        
        int roleId = 0;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = new DatabaseConnection().getConnection();
            pst = conn
                    .prepareStatement("select * from Users where id=?");
            pst.setInt(1, id);

            rs = pst.executeQuery();
            if(rs.next()){
            	roleId = rs.getInt(10);
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
        return roleId;
    }
}