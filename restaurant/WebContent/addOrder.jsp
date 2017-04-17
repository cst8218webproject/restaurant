<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.web.common.MenuitemBean"%> //
<%@ page import="com.cart.ejb.CartBean"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="project.db.DatabaseConnection"%>
<%--
@author Adrien
 --%>
<%
	CartBean cart;
	BigDecimal cartPrice = new BigDecimal(0);
	cart = (CartBean) session.getAttribute("Cart");
	String userAddress = (String)request.getParameter("address");
	String userCreditCard = (String)request.getParameter("creditCard");
	String userPhone = (String)request.getParameter("phone");
    String userName = (String)session.getAttribute("username");
    
	cartPrice = cart.totalPrice();
	int id;
    int quantity;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = new DatabaseConnection().getConnection();
    Statement st = con.createStatement();
    try{
    	int i = st.executeUpdate("insert into orders (firstname, lastname, phone, price, address, user_id, order_time, CreditCard, Orderstatus_id) VALUES ('"+userName+"' ,(SELECT lastname from users WHERE username='"+userName+"'), '"+userPhone+"', '"+cartPrice+"', '"+userAddress+"', (SELECT id from users WHERE username='"+userName+"'), NOW(), '"+userCreditCard+"',(1));");
    	for (MenuitemBean j : cart.getContents()) {
    		id = j.getId();
    		quantity = j.getQuantity();
    		st.executeUpdate("insert into Order_Menuitem (order_id, menuitem_id, quantity) VALUES ((SELECT MAX(id) from orders),'"+id+"' ,'"+quantity+"')");
    	}
    	
    	if (i > 0) {
            cart.remove();
            response.sendRedirect("orderHistory.jsp");
        } else {
        	out.print("Error");
        }
    }catch(Exception e){
    	//response.sendRedirect("checkOut.jsp");
    	out.print(e.toString());
    }
%>