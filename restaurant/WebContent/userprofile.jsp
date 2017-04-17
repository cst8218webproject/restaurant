<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cart.ejb.CartBean"%>
<%@ page import="project.web.common.UserBean"%>
<%@ page import="project.web.dao.UserFactory"%>
<%--
@author Chen, Zhenwei
 --%>
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
<title><fmt:message key="profile.Title" /></title>
</head>
<body>
	<%@include file ="Common/navbar.jsp" %>
	<%
		CartBean cart = (CartBean) session.getAttribute("Cart");
		if (null == cart) {
			cart = new CartBean();
		}
	%>
	<br>
	<hr>
	<div class="container">
		<div class="row">
			<!-- left column -->
			<div class="col-md-3">
				<div class="text-center">
					<p>
						<a href="userprofile.jsp" class="btn btn-primary btn-block "> <fmt:message key="profile.EditProfile" /></a>
					</p>
					<p>
						<a href="orderHistory.jsp" class="btn btn-primary btn-block "><fmt:message key="profile.OrderHistory" /></a>
					</p>
				</div>
			</div>

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
				<div class="alert alert-info alert-dismissable">
					<a class="panel-close close" data-dismiss="alert">×</a> <i
						class="fa fa-coffee"></i> <strong>.</strong><fmt:message key="profile.EditInstruction" />
				</div>
				<h3><fmt:message key="profile.UserInfo" /></h3>
				<form class="form-horizontal" role="form" method="POST"
					action="updateUserInfo">
					<div class="form-group">
						<label class="col-lg-3 control-label"><fmt:message key="user.FirstName" />:</label>
						<div class="col-lg-8">
							<input class="form-control" name="fname" type="text"
								value="<%=user.getFirstname()%>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label"><fmt:message key="user.LastName" />:</label>
						<div class="col-lg-8">
							<input class="form-control" name="lname" type="text"
								value="<%=user.getLastname()%>">
						</div>
					</div>
					<!-- 
					<div class="form-group">
						<label class="col-lg-3 control-label">Home Address</label>
						<div class="col-lg-8">
							<input class="form-control" type="text" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Company Address</label>
						<div class="col-lg-8">
							<input class="form-control" type="text" value="">
						</div>
					</div>
					 -->
					<div class="form-group">
						<label class="col-lg-3 control-label"><fmt:message key="user.Email" />:</label>
						<div class="col-lg-8">
							<input class="form-control" name="email" type="text"
								value="<%=user.getEmail()%>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"><fmt:message key="user.Password" />:</label>
						<div class="col-md-8">
							<input class="form-control" name="pwd" type="password" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input class="btn btn-primary" type="submit" value="<fmt:message key="profile.SaveChanges" />">
							<span></span> <input class="btn btn-default" type="reset"
								value="Cancel">
						</div>
					</div>
				</form>
				<%} %>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>
</fmt:bundle>