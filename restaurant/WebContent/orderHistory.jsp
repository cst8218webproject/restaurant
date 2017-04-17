<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.web.common.MenuitemBean"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="com.cart.ejb.CartBean"%>
<%@ page import="project.web.common.UserBean"%>
<%@ page import="project.web.dao.UserFactory"%>
<%@ page import="project.db.DatabaseConnection"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : 'en_CA'}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:bundle basename="Language/LanguageBundle">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
@author Adrien
 --%>
<%
	ResultSet rs = null;
	String userName = (String) session.getAttribute("username");
	int id = (int) session.getAttribute("id");
	Connection conn = new DatabaseConnection().getConnection();
	Statement statement = conn.createStatement();
	try {
		String QueryString = "select * from orders JOIN order_menuitem ON orders.id=order_menuitem.order_id JOIN menuitems ON order_menuitem.menuitem_id=menuitems.id  where user_id = '"
				+ id + "' ORDER BY orders.id DESC ";
		rs = statement.executeQuery(QueryString);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="Common/css/NewFile.css" rel="stylesheet">
<!-- Custom CSS -->
<script src='Common/css/profile.css'></script>

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src='//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
<body>
	<br>
	<br>
</body>
<title><fmt:message key="orderHistory.Title" /></title>
</head>
<body>
	<%@include file="Common/navbar.jsp"%>
	<%
		CartBean cart = (CartBean) session.getAttribute("Cart");
			if (null == cart) {
				cart = new CartBean();
			}
	%>

	<div class="container">
		<div class="row">
			<h1><fmt:message key="orderHistory.Header" /></h1>
			<hr>
			<!-- left column -->
			<div class="col-md-3">
				<div class="text-center">
					<p>
						<a href="userprofile.jsp" class="btn btn-primary btn-block ">
							<fmt:message key="profile.EditProfile" /></a>
					</p>
					<p>
						<a href="orderHistory.jsp" class="btn btn-primary btn-block "><fmt:message key="profile.OrderHistory" /></a>
					</p>
				</div>
			</div>
			<div class="col-md-9 personal-info">
				<div class="alert alert-info alert-dismissable">
					<a class="panel-close close" data-dismiss="alert">×</a> <i
						class="fa fa-coffee"></i> <strong>.</strong><fmt:message key="orderHistory.Instruction" />
				</div>

				<div class="datagrid" style="">
					<table>
						<thead>
							<tr>
								<th><fmt:message key="order.Number" /></th>
								<th><fmt:message key="order.Datetime" /></th>
								<th><fmt:message key="order.Item" /></th>
								<th><fmt:message key="order.ItemPrice" /></th>
								<th><fmt:message key="order.Quantity" /></th>
								<th><fmt:message key="order.TotalPrice" /></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="6"><div id="paging"></div>
							</tr>
						</tfoot>
						<tbody>
							<%
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getInt(1)%></TD>
								<td><%=rs.getString(8)%></TD>
								<td><%=rs.getString(16)%></TD>
								<td>$<%=rs.getBigDecimal(17)%></TD>
								<td><%=rs.getInt(14)%></TD>
								<td>$<%=rs.getBigDecimal(7)%></TD>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>

				<%
						rs.close();
						statement.close();
						conn.close();
					} catch (Exception ex) {
				%>
			</div>
			<font size="+3" color="red"> <%
			out.println("Unable to connect to database.");
			out.print(ex.getMessage());
	}
	%>
			</font>
		</div>
	</div>
</body>
</html>
</fmt:bundle>