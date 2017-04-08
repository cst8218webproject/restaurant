<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.web.common.MenuitemBean"%> //
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.cart.ejb.CartBean"%>
<%@ page import="project.web.common.UserBean"%>
<%@ page import="project.web.dao.UserFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	ResultSet rs = null;
	String userName = (String)session.getAttribute("username");
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false",
            "root", "root");
    Statement statement = connection.createStatement();

    try{
    	String QueryString = "select * from orders JOIN order_menuitem ON orders.id=order_menuitem.order_id JOIN menuitems ON order_menuitem.menuitem_id=menuitems.id  where firstname = '"+userName+"' ORDER BY orders.id ASC ";
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
<title>Order History</title>
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
						<li><a href="#">Orders</a></li>
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
			<h1>Order History</h1>
			<hr>
			<!-- left column -->
			<div class="col-md-3">
				<div class="text-center">
					<p>
						<a href="userprofile.jsp" class="btn btn-primary btn-block "> Edit profile</a>
					</p>
					<p>
						<a href="#" class="btn btn-primary btn-block ">Order History</a>
					</p>
				</div>
			</div>
			<div class="col-md-9 personal-info">
				<div class="alert alert-info alert-dismissable">
						<a class="panel-close close" data-dismiss="alert">×</a> <i
							class="fa fa-coffee"></i> <strong>.</strong>.You can view your
						order history....
				</div>
	
			<div class="datagrid" style="Common/css/NewFile.css"><table>
				<thead><tr><th>Order Number</th><th>Date/Time</th><th>Item</th><th>Item Price</th><th>Quantity</th><th>Total Price of Order</th></tr></thead>
				<tfoot><tr><td colspan="6"><div id="paging"></div></tr></tfoot>
				<tbody><%while (rs.next()){%>
					<tr><td><%=rs.getInt(1)%></TD><td><%=rs.getString(8)%></TD><td><%=rs.getString(16)%></TD> <td>$<%=rs.getBigDecimal(17)%></TD> <td><%=rs.getInt(14)%></TD><td>$<%=rs.getBigDecimal(7)%></TD> </tr>
				<%}%></tbody>
			</table></div>
	
	<%
    	
	rs.close();
	statement.close();
	connection.close();
	}} catch (Exception ex) {
	%>
	</font>
	</div>
	<font size="+3" color="red"></b>
	<%
	out.println("Unable to connect to database.");
	}
	%>
	
	</font>
	</body>
	

	</html>
