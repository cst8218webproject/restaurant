<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cart.ejb.CartBean"%>
<%@ page import="project.web.common.MenuitemBean"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : 'en_CA'}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:bundle basename="Language/LanguageBundle">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title><fmt:message key="cart.Title" /></title>
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
	<%@include file ="Common/navbar.jsp" %>
	<%
		CartBean cart;
		cart = (CartBean) session.getAttribute("Cart");
		if (null == cart) {
			cart = new CartBean();
		}

	%>
	
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 40%"><fmt:message key="cart.Product" /></th>
					<th style="width: 12%"><fmt:message key="cart.Price" /></th>
					<th style="width: 14%"><fmt:message key="cart.Quantity" /></th>
					<th style="width: 22%" class="text-center"><fmt:message key="cart.Subtotal" /></th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>
				<%
					if (cart.Count() == 0) {
				%>
				<td><fmt:message key="cart.EmptyCart" /></td>
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
					<td class="text-center"><strong><fmt:message key="cart.Total" /></strong></td>
				</tr>
				<tr>
					<td><a href="welcome.jsp" class="btn btn-warning"><i
							class="fa fa-angle-left"></i> <fmt:message key="cart.ContinueShopping" /></a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong><fmt:message key="cart.Total" /> $<%=cart.totalPrice()%></strong></td>
					<td><a href="checkOut.jsp" class="btn btn-success btn-block"><fmt:message key="cart.Checkout" />
							<i class="fa fa-angle-right"></i>
					</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>
</fmt:bundle>