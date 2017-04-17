<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%--
@author Adrien, Chen
 --%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : 'en_CA'}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:bundle basename="Language/LanguageBundle">

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title><fmt:message key="signin.SignIn" /></title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="container">

		<form method="post" action="login" class="form-signin">
			<h2 class="form-signin-heading"><fmt:message key="user.SignInYourAccount" /></h2>
			<label for="inputUserName" class="sr-only"><fmt:message key="user.username" /></label>
			<input type="text" name="uname" value="" class="form-control" placeholder="Username" required autofocus>
			<label for="inputPassword" class="sr-only"><fmt:message key="user.password" /></label>
			<input type="password" name="pass" value="" class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label><input type="checkbox" value="remember-me"><fmt:message key="signin.RememberMe" /></label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit" value="Login"><fmt:message key="signin.SignIn" /></button>
			<%
				if (null != request.getAttribute("errorMessage")) {%>
			<p style="color: red"><%=request.getAttribute("errorMessage") %></p>
			<%}
			%>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

</fmt:bundle>