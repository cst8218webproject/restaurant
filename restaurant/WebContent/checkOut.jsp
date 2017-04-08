<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cart.ejb.CartBean"%>
<%@ page import="project.web.common.UserBean"%>
<%@ page import="project.web.dao.UserFactory"%>
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
<title>Checkout</title>
</head>
<body>
	<%
		String username;
		if (null == session) {
			response.sendRedirect("index.jsp");
		} else if (null == session.getAttribute("username")) {
			response.sendRedirect("index.jsp");
		} else {
			CartBean cart = (CartBean) session.getAttribute("Cart");
			if (null == cart) {
				cart = new CartBean();
			}
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
						<li><a href="userprofile.jsp">Edit profile</a></li>
						<li><a href="orderHistory.jsp">Orders</a></li>
						<li><hr></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul></li>
				<li role="presentation"><a href="Cart.jsp">Cart <span
						class="badge"><%=cart.Count()%></span></a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<div class="container">
		<div class="row">
			<h1>Checkout</h1>
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
				
				<h3>Personal info</h3>
				<form class="form-horizontal" role="form" method="POST"
					action="addOrder.jsp"> 
					<div class="form-group">
						<label class="col-lg-3 control-label">Delivery Address</label>
						<div class="col-lg-8">
							<input name="address" class="form-control" type="text" value="" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Phone Number</label>
						<div class="col-lg-8">
							<input name="phone" class="form-control" type="text" value="" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Credit Card</label>
						<div class="col-lg-8">
							<input name="creditCard" class="form-control" type="text" value="" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input class="btn btn-primary" type="submit" value="Place Order">
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
		} else {
	%>
	<p>Error loading user info, please try login again</p>
	<%
		}
		}
	%></ body>
</html>