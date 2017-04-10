<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cart.ejb.CartBean"%>
<%@ page import="project.web.common.UserBean"%>
<%@ page import="project.web.dao.UserFactory"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : 'en_CA'}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:bundle basename="Language/LanguageBundle">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<script src='Common/css/profile.css'></script>

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src='//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
<body>
<br>
<br>
</body>
<title><fmt:message key="checkout.Title" /></title>
</head>
<body>
	<%@include file ="Common/navbar.jsp" %>
	<%
		String username;
		CartBean cart = (CartBean) session.getAttribute("Cart");
		if (null == cart) {
			cart = new CartBean();
		}
	%>
	<div class="container">
		<div class="row">
			<h1><fmt:message key="checkout.Header" /></h1>
			<hr>
			<!-- edit form column -->
			<div class="col-md-9 personal-info">
		<%
			UserBean user = null;
			int id = 0;
			try {
				id = (int) session.getAttribute("id");
				user = UserFactory.getInstance().findById(id);
			} catch (Exception e) {
		%>
			<p><%=e.getMessage()%></p>
		<%
			}
			if (user != null) {
		%>
				<h3><fmt:message key="checkout.DeliveryInfo" /></h3>
				<form class="form-horizontal" role="form" method="POST"
					action="addOrder.jsp"> 
					<div class="form-group">
						<label class="col-lg-3 control-label"><fmt:message key="checkout.DeliveryAddress" /></label>
						<div class="col-lg-8">
							<input name="address" class="form-control" type="text" value="" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label"><fmt:message key="checkout.Phone" /></label>
						<div class="col-lg-8">
							<input name="phone" class="form-control" type="text" value="" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label"><fmt:message key="checkout.CreditCard" /></label>
						<div class="col-lg-8">
							<input name="creditCard" class="form-control" type="text" value="" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input class="btn btn-primary" type="submit" value="<fmt:message key="checkout.PlaceOrder" />">
							<span></span> <input class="btn btn-default" type="reset"
								value="Cancel">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<%
		}
	%>
</body>
</html>
</fmt:bundle>