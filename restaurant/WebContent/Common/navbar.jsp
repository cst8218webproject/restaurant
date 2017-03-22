<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%@page import="com.cart.ejb.CartBean"%>

<c:set var="loc" value="en_CA" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}"></c:set>
</c:if>
<fmt:setLocale value="${loc}" />
<fmt:bundle basename="Language/LanguageBundle">
	<%
		String username;
			if (null == session) {
				response.sendRedirect("index.jsp");
			} else if (null == session.getAttribute("username")) {
				response.sendRedirect("index.jsp");
			} else {
				CartBean cart = (CartBean) session.getAttribute("Cart");
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Hello <%=session.getAttribute("username")%>,
					welcome to ACZ Restaurant
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="welcome.jsp">Home</a></li>
					<li><a href="#menu">Menu</a></li>
					<li><a href="#">Contact</a></li>
					<li><a href="success.jsp">Partner</a>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Profile <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Edit profile</a></li>
							<li><a href="#">Orders</a></li>
							<li><hr></li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul></li>
					<li role="presentation"><a href="Cart.jsp">Cart <span
							class="badge"><%=cart.Count() %></span></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<%} %>
</fmt:bundle>