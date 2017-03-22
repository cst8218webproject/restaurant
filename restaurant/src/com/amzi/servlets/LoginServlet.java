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

public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  

		String n=request.getParameter("uname");  
		String p=request.getParameter("pass"); 

		HttpSession session = request.getSession(false);
		if(session!=null){
			session.setAttribute("username", n);
		}
		int id = LoginDao.validate(n, p);
		if(id > 0){
			session.setAttribute("id", id);
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");  
			rd.forward(request,response);  
		}  
		else{
			request.setAttribute("errorMessage", "Please input correct account and password");
			RequestDispatcher rd=request.getRequestDispatcher("signin.jsp");  
			rd.include(request,response);  
		}  

		out.close();
	}  
} 