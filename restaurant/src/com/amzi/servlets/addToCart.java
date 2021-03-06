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

import com.cart.ejb.Cart;
import com.cart.ejb.CartBean;
import com.cart.util.ItemException;

import project.web.common.MenuitemBean;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if(null == session){
			out.println("Session error, please login");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		String username = (String) session.getAttribute("username");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int id = Integer.parseInt(request.getParameter("id"));
		Cart cartBean = (Cart)session.getAttribute("Cart");
		if(cartBean == null){
			try {
				cartBean = new CartBean();
				cartBean.initialize(username);
				session.setAttribute("Cart", cartBean);
			} catch (ItemException e) {
				e.printStackTrace();
			}
		}
		MenuitemBean item;
		try {
			item = CartBean.createItem(id);
			if(item != null){
				item.setQuantity(quantity);
			}
			cartBean.addItem(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("welcome.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
