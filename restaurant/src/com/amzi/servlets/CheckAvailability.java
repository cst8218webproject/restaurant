package com.amzi.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import project.db.DatabaseConnection;
/**
 * This class check if username already exists in the database
 * @author Chen Deng
 *
 */
public class CheckAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAvailability() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Connection connection = new DatabaseConnection().getConnection();
            String uname = request.getParameter("uname");
            PreparedStatement ps = connection.prepareStatement("select * from Users where username=?");
            ps.setString(1,uname);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                out.println("<font color=green>"+uname+" is avaliable</font>");
            }
            else{
            	out.println("<font color=red>"+uname+" is already in use</font>");
            }
            //out.println();

        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
