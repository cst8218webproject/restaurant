package com.amzi.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project.web.common.UserBean;
import project.web.dao.UserFactory;

/**
 * Servlet implementation class updateUserInfo
 */
@WebServlet("/updateUserInfo")
public class updateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateUserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserBean user = new UserBean();
		boolean flag = false;
		try {
			int id = (int)session.getAttribute("id");
			user.setId(id);
			user.setPassword(request.getParameter("pwd"));
			user.setFirstname(request.getParameter("fname"));
			user.setLastname(request.getParameter("lname"));
			user.setEmail(request.getParameter("email"));
			flag = UserFactory.getInstance().updateUser(id, user);
		} catch (Exception e) {
			response.getWriter().println(e.getMessage());
			e.printStackTrace();
		}
		if(flag){
			response.getWriter().println("Infomation updated successfully");
			response.sendRedirect("userprofile.jsp");
		}else{
			response.getWriter().println("Failed to update");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
