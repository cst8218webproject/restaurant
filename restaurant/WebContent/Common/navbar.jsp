<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="com.cart.ejb.CartBean"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : 'en_CA'}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:bundle basename="Language/LanguageBundle">
<%
	String username = (String)session.getAttribute("username");
	CartBean cart = (CartBean)session.getAttribute("Cart");
	if(username != null){
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
				<a class="navbar-brand" href="index.jsp">Hi <%=username%>,
					<fmt:message key="nav.Welcome" />
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp"><fmt:message key="nav.Home" /></a></li>
					<li><a href="welcome.jsp"><fmt:message key="nav.Menu" /></a></li>
					<li>
						<span class="lang">
				        <form style="padding-top: 15px;">
				            <select name="language" onchange="submit()">
				                <option value="en_CA" ${language == 'en_CA' ? 'selected' : ''}>English</option>
				                <option value="zh_CN" ${language == 'zh_CN' ? 'selected' : ''}>中文</option>
				            </select>
				        </form>
	    				</span>
    				</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><fmt:message key="nav.Profile" /><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="userprofile.jsp"><fmt:message key="nav.EditProfile" /></a></li>
							<li><a href="orderHistory.jsp"><fmt:message key="nav.Orders" /></a></li>
							<li><hr></li>
							<li><a href="logout.jsp"><fmt:message key="nav.Logout" /></a></li>
						</ul>
					</li>
					<li role="presentation"><a href="Cart.jsp"><fmt:message key="nav.Cart" /> <span class="badge"><%=cart.Count() %></span></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
<%} else {%>
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
				<a class="navbar-brand" href="index.jsp">ACZ Restaurant</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="signin.jsp"><fmt:message key="nav.Signin" /></a></li>
					<li><a href="reg.jsp"><fmt:message key="nav.Register" /></a></li>
					<li>
						<span class="lang">
				        <form style="padding-top: 15px;">
				            <select name="language" onchange="submit()">
				                <option value="en_CA" ${language == 'en_CA' ? 'selected' : ''}>English</option>
				                <option value="zh_CN" ${language == 'zh_CN' ? 'selected' : ''}>中文</option>
				            </select>
				        </form>
	    				</span>
    				</li>
    				<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><fmt:message key="nav.Signin" /> <span
							class="glyphicon glyphicon-log-in"></span></a>
						<div class="dropdown-menu">
							<form id="formLogin" class="form container-fluid" method="post" action="login">
								<div class="form-group">
									<label for="usr"><fmt:message key="user.Username" />:</label> <input type="text"
										name="uname" class="form-control" id="usr" placeholder="Username" required>
								</div>
								<div class="form-group">
									<label for="pwd"><fmt:message key="user.Password" />:</label> <input type="password"
										name="pass" class="form-control" id="pwd" placeholder="Password" required>
								</div>
								<button type="submit" id="btnLogin" class="btn btn-block"><fmt:message key="nav.Signin" /></button>
								<%
									if (null != request.getAttribute("errorMessage")) {%>
								<p style="color: red"><%=request.getAttribute("errorMessage") %></p>
								<%}
								%>
							</form>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
<%} %>
</fmt:bundle>