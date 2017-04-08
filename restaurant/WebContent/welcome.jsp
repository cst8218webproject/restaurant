<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cart.ejb.CartBean"%>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome to ACZ Restaurant</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="Common/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src='//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>

<script src='Common/js/menu.js'></script>
</head>

<body>
	<%
		String username;
		if (null == session) {
			response.sendRedirect("index.jsp");
		} else if (null == session.getAttribute("username")) {
			response.sendRedirect("index.jsp");
		} else {
			CartBean cart = (CartBean)session.getAttribute("Cart");
			if(null == cart){
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
				<a class="navbar-brand" href="#">Welcome <%=session.getAttribute("username")%>
					to ACZ
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#menu">Menu</a></li>
					<li><a href="contact.html">Contact</a></li>
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
							class="badge"><%=cart.Count() %></span></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<br />
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Start Your Order Here
				</h1>
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">About</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Intro Content -->
		<div class="row">
			<div class="col-md-6">
				<img class="img-responsive" src="wwwroot/chef.jpg" alt="">
			</div>
			<div class="col-md-6">
				<h2>About Us</h2>
				<p>Family owned and operated in Ottawa, Ontario since 2017, at ACZ Restaurant we are 
				proudly providing customers with quality home-style cooking every day.
				<br><br>
				What makes ACZ a great place for your next meal or event is 
				that we offer a diverse menu composed of Greek, Mediterranean and Traditional Cuisine. 
				Since we are family owned and operated, we provide the tastes of the world with the care 
				and preparation you would expect from your own family.</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Popular Menus -->
		<div class="row" id="menu">
			<div class="col-lg-12">
				<h2 class="page-header">Our Menu</h2>
			</div>
			<!-- TODO Modify to load 6 menu items from database -->
			<jsp:include page="Common/menu.jsp" />
			
		</div>
			<!-- /.row -->
			<section id="menu" class="parallax-section">
				<div class="container">
					<div class="row">
						<div class="col-md-offset-2 col-md-8 col-sm-12 text-center">
							<h1 class="heading">Special Menu</h1>
							<hr>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Lemon-Rosemary Vegetable ................ <span>$20.50</span>
							</h4>
							<h5>Chicken / Rosemary / Lemon</h5>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Lemon-Rosemary Meat ........................... <span>$30.50</span>
							</h4>
							<h5>Meat / Rosemary / Lemon</h5>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Lemon-Rosemary Pork ........................ <span>$40.75</span>
							</h4>
							<h5>Pork / Tooplate / Lemon</h5>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Orange-Rosemary Salad .......................... <span>$55.00</span>
							</h4>
							<h5>Salad / Rosemary / Orange</h5>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Lemon-Rosemary Squid ...................... <span>$65.00</span>
							</h4>
							<h5>Squid / Rosemary / Lemon</h5>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Orange-Rosemary Shrimp ........................ <span>$70.50</span>
							</h4>
							<h5>Shrimp / Rosemary / Orange</h5>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Lemon-Rosemary Prawn ................... <span>$110.75</span>
							</h4>
							<h5>Chicken / Rosemary / Lemon</h5>
						</div>
						<div class="col-md-6 col-sm-6">
							<h4>
								Lemon-Rosemary Seafood ..................... <span>$220.50</span>
							</h4>
							<h5>Seafood / Rosemary / Lemon</h5>
						</div>
					</div>
				</div>
			</section>
			<!-- Our Customers -->
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">More on the way</h2>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<img class="img-responsive customer-img"
						src="http://placehold.it/500x300" alt="">
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<img class="img-responsive customer-img"
						src="http://placehold.it/500x300" alt="">
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<img class="img-responsive customer-img"
						src="http://placehold.it/500x300" alt="">
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<img class="img-responsive customer-img"
						src="http://placehold.it/500x300" alt="">
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<img class="img-responsive customer-img"
						src="http://placehold.it/500x300" alt="">
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<img class="img-responsive customer-img"
						src="http://placehold.it/500x300" alt="">
				</div>
			</div>
			<!-- /.row -->

			<hr>

			<!-- Footer -->
			<footer>
				<div class="row">
					<div class="col-lg-12">
						<p>Copyright &copy; ACZ Restaurant</p>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.container -->

		<!-- jQuery -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>

		<%
		}
	%>
	</div>
</body>
</html>