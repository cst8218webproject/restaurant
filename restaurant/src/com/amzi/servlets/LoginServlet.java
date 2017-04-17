package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.LoginDao;
/**
 * Description: Get username and password from request and validate
 * if success set attribute in session else output error message.
 *
 */
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();  

		String n=request.getParameter("uname");  
		String p=request.getParameter("pass"); 

		HttpSession session = request.getSession();
		
		int id = LoginDao.validate(n, p);
		int roleId = LoginDao.validateRole(id);
		if(id > 0){
			session.setAttribute("id", id);
			session.setAttribute("username", n);
			session.setAttribute("roleId", roleId);
//			response.sendRedirect("welcome.jsp");
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
			rd.forward(request,response);  
		}  
		else{
			request.setAttribute("errorMessage", "Please input correct account and password");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request,response);  
		}  

		out.close();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(null == session.getAttribute("username")){
			doPost(request, response);
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
			rd.forward(request,response);
		}
	}
} 