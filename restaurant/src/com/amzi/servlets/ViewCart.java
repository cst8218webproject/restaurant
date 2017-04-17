package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.ejb.*;
import com.cart.util.ItemException;

import project.web.common.MenuitemBean;
/**
 * Servlet implementation class ViewCart
 * @author Chen
 * Description: This class get Cartbean object from session and generate
 * html code to display all menuitems.
 */
@WebServlet("/ViewCart")
public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCart() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(null == session){
			out.println("Session error, please login");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		String username = (String) session.getAttribute("username");
		
		Cart cartBean = (Cart)session.getAttribute("Cart");
		if(cartBean == null){
			try {
				cartBean = new CartBean();
				cartBean.initialize(username);
				request.setAttribute("Cart", cartBean);
			} catch (ItemException e) {
				e.printStackTrace();
			}
		}
		if(cartBean.Count() == 0){
			out.println("<p>Currently no items in cart</p>");
		}else{
			out.println("<div>");
			out.println("<table>");
			out.println("<tr><td>Name</td><td>Quantity</td><td>Change quantities</td><td>Price</td><td>Remove</td></tr>");
			for (MenuitemBean item : cartBean.getContents()) {
				out.println("<tr>");
				out.println("<td>" + item.getName() + "</td>");
				out.println("<td>" + item.getQuantity() + "</td>");
				// TODO add action to modify quantity
				out.println("<td>Change quantities placeholder</td>");
				out.println("<td>"+item.getSubTotal().toString() +"</td>");
				// TODO add action to remove item
				out.println("<td>Remove placeholder</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("<p>Total: $" + cartBean.totalPrice().toString() + "</p>");
			out.println("</div>");
		}
		
		out.close();
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
