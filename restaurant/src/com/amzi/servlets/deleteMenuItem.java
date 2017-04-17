package com.amzi.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.db.DatabaseConnection;

/**
 * Servlet implementation class deleteMenuItem
 * @author Adrien
 * Description: Remove menuitem from database
 */
@WebServlet("/deleteMenuItem")
public class deleteMenuItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMenuItem() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Connection conn = null;
		Statement pst = null;
		
		String test = request.getParameter("id");
		try {
			conn = new DatabaseConnection().getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		int foodId=Integer.parseInt(test);
		
		try {
			pst=conn.createStatement();
			pst.executeUpdate("delete from menuitems where id='"+foodId+"'");
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		finally{
			if(pst!=null){
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
