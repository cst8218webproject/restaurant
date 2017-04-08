<%@ page import="project.web.common.MenuitemBean"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cart.ejb.CartBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Cart</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="Common/css/modern-business.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src='//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
<script src='Common/js/cart.js'></script>
</head>
<body>
	<%
		String username;
		CartBean cart;
		if (null == session) {
			response.sendRedirect("index.jsp");
		} else if (null == session.getAttribute("username")) {
			response.sendRedirect("index.jsp");
		} else {
			cart = (CartBean) session.getAttribute("Cart");
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
		<%
			if (null != cart) {
		%>
		<!-- <form method="post" action="addOrder.jsp" > -->
			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 50%">Product</th>
						<th style="width: 10%">Price</th>
						<th style="width: 8%">Quantity</th>
						<th style="width: 22%" class="text-center">Subtotal</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>
				<tbody>
					<%
						if (cart.Count() == 0) {
					%>
					<td>No items in the cart.</td>
					<%
						} else {
									for (MenuitemBean i : cart.getContents()) {
					%>
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img src="<%=i.getImgsrc()%>" alt="..." class="img-responsive" />
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin"><%=i.getName()%></h4>
									<p><%=i.getDescription()%></p>
								</div>
							</div>
						</td>
						<td data-th="Price">$<%=i.getPrice()%></td>
						<td data-th="Quantity"><input type="number"
							class="form-control text-center" value="<%=i.getQuantity()%>"></td>
						<td data-th="Subtotal" class="text-center">$<%=i.getSubTotal()%></td>
						<td class="actions" data-th="">
	
							<button class="btn btn-danger btn-sm" id="remove"
								value="<%=i.getId()%>">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
					<%
						} //end for
								} //end else
					%>
				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong>Total</strong></td>
					</tr>
					
					<tr>
						<td><a href="welcome.jsp" class="btn btn-warning"><i
								class="fa fa-angle-left"></i> Continue Shopping</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Total $<%=cart.totalPrice()%></strong></td>
					
						<!-- <td><button class="btn btn-success btn-block" type="submit" value="Submit">Checkout
								<i class="fa fa-angle-right"></i></button> -->
						<td><a href="checkOut.jsp" class="btn btn-success btn-block">Checkout
							<i class="fa fa-angle-right"></i>		
						</a></td>
					</tr>
				</tfoot>
			</table>
		<!-- </form> -->
		<%
			} //end if
		%>
		

	
	</div>
	<%
		}
	%>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>




