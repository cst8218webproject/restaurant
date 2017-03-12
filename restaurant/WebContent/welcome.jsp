<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (null == session) {
		response.sendRedirect("index.jsp");
	} else if (null == session.getAttribute("username")) {
%>
You are not logged in
<br />
<a href="signin.jsp">Please Login</a>
<%
	} else {
%>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome to ACZ Restaurant</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="common/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

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
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#menu">Menu</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li><a href="success.jsp">Partner</a>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Profile <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Edit profile</a></li>
							<li><a href="#">Orders</a></li>
							<li><hr></li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Start Your Order <small>Subheading</small>
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
				<p>Context here</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Team Members -->
		<div class="row" id="menu">
			<div class="col-lg-12">
				<h2 class="page-header">Our Memu</h2>
			</div>
			<!-- TODO Modify to load 6 menu items from database -->
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="wwwroot/beef.png" data-lightbox-gallery="zenda-gallery">
						<img class="img-responsive" src="wwwroot/beef.png" alt="">
					</a>
					<div class="caption">
						<h3>
							Herb Seasoned Beefsteak <br> <small>Beef / Garlic /
								Green</small> <br>
						</h3>


						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="images/gallery-img1.jpg"
						data-lightbox-gallery="zenda-gallery"> <img
						class="img-responsive" src="images/gallery-img1.jpg" alt="">
					</a>
					<div class="caption">
						<h3>
							Lemon-Rosemary Prawn<br> <small>Seafood / Shrimp /
								Lemon</small> <br>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="images/gallery-img2.jpg"
						data-lightbox-gallery="zenda-gallery"> <img
						class="img-responsive" src="images/gallery-img2.jpg" alt="">
					</a>
					<div class="caption">
						<h3>
							Lemon-Rosemary Vegetables<br> <small>Tomato /
								Rosemary / Lemon</small> <br>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="images/gallery-img3.jpg"
						data-lightbox-gallery="zenda-gallery"> <img
						class="img-responsive" src="images/gallery-img3.jpg" alt="">
					</a>
					<div class="caption">
						<h3>
							Lemon-Rosemary Bakery<br> <small>Bread / Rosemary /
								Orange</small> <br>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="images/gallery-img4.jpg"
						data-lightbox-gallery="zenda-gallery"> <img
						class="img-responsive" src="images/gallery-img4.jpg" alt="">
					</a>
					<div class="caption">
						<h3>
							Lemon-Rosemary Salad<br> <small>Chicken / Rosemary /
								Green</small> <br>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="images/gallery-img5.jpg"
						data-lightbox-gallery="zenda-gallery"> <img
						class="img-responsive" src="images/gallery-img5.jpg" alt="">
					</a>
					<div class="caption">
						<h3>
							Lemon-Rosemary Pizza<br> <small>Pasta / Rosemary /
								Green</small> <br>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
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
<%
    }
%>