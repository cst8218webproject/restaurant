<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cart.ejb.CartBean"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : 'en_CA'}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:bundle basename="Language/LanguageBundle">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title><fmt:message key="welcome.Title" /></title>

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
	<%@include file ="Common/navbar.jsp" %>

	<br />
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<fmt:message key="welcome.StartOrder" /> <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><fmt:message key="nav.Home" /></a></li>
					<li class="active"><fmt:message key="nav.About" /></li>
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
				<h2><fmt:message key="welcome.About" /></h2>
				<p><fmt:message key="welcome.Context" /></p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Popular Menus -->
		<div class="row" id="menu">
			<div class="col-lg-12">
				<h2 class="page-header"><fmt:message key="welcome.Menu" /></h2>
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

</body>
</html>
</fmt:bundle>