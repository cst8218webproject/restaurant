<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.math.BigDecimal"%>
<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet menuRS = null;
	ResultSet ingredientRS = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false", "root", "");
		pst = conn.prepareStatement("select * from menuitems");
		menuRS = pst.executeQuery();

		for (int i = 0; i < 6; i++) {
			if (menuRS.next()) {
				String imgsrc = menuRS.getString(5);
				String description = menuRS.getString(4);
				BigDecimal price = menuRS.getBigDecimal(3);
				String name = menuRS.getString(2);
				int id = menuRS.getInt(1);

				pst = conn.prepareStatement(
						"select * from ingredients where id in (select ingredient_id from menuitem_ingredient where menuitem_id = ?)");
				pst.setInt(1, id);

				ingredientRS = pst.executeQuery();

				out.println("<div class=\"col-md-4 text-center\">\n<div class=\"thumbnail\">");
				out.println("<a href=\"" + imgsrc
						+ "\" data-lightbox-gallery=\"zenda-gallery\"><img class=\"img-responsive\" src=\""
						+ imgsrc + "\" alt=\"\"></a>");
				out.println("<div class=\"caption\">");
				out.println("<h3>" + name + " </h3>");

				StringBuilder sb = new StringBuilder();
				if(ingredientRS.next())
					sb.append(ingredientRS.getString(2));
				while(ingredientRS.next()){
					sb.append("/").append(ingredientRS.getString(2));
				}
				out.println("<p>" + sb.toString() + "</p>");
				out.println("$" + price.toString());
				out.println("<p>"+description + "</p>");
				out.println("<div id=\"page-wrap\"><div>");// Add action to put good into cart
				out.println("<div class=\"numbers-row\">");
				out.println("<label for=\"name\">Quantity</label>");
				out.println("<input type=\"text\" name=\"french-hens\" id=\"" + id + "\" value=\"0\">");
				out.print("</div></div><button id=\"order\">Add</button></div></div></div></div>");
			} else {
				break;
			}
		}
	} catch (Exception e) {
		System.out.println(e);
		e.printStackTrace();
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				//e.printStackTrace();
				out.println(e);
			}
		}
		if (pst != null) {
			try {
				pst.close();
			} catch (SQLException e) {
				//e.printStackTrace();
				out.println(e);
			}
		}
		if (menuRS != null) {
			try {
				menuRS.close();
			} catch (SQLException e) {
				//e.printStackTrace();
				out.println(e);
			}
		}
		if(ingredientRS != null){
			try {
				ingredientRS.close();
			} catch (SQLException e) {
				//e.printStackTrace();
				out.println(e);
			}
		}
	}
%>