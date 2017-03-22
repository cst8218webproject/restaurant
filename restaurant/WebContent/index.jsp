<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>

<html>
<c:set var="loc" value="en_CA" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}"></c:set>
	<!-- TODO Store into session -->

</c:if>
<fmt:setLocale value="${loc}" />
<fmt:bundle basename="Language/LanguageBundle">

	<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Welcome to ACZ Restaurant</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="Common/css/cover.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	</head>

	<body>
		<!-- Fixed navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle collapsed" aria-expanded="false"
						aria-controls="navbar" type="button" data-toggle="collapse"
						data-target="#navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">ACZ Restaurant</a>
				</div>
				<div class="navbar-collapse collapse" id="navbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#"><fmt:message
									key="nav.Menu" /></a></li>
						<c:if test="${loc == 'zh_CN' }">
							<c:url value="signin.jsp" var="chineseURL">
								<c:param name="locale" value="zh_CN">zh_CN</c:param>
							</c:url>
							<li><a href="${chineseURL}"><fmt:message
										key="nav.Signin" /></a></li>

							<c:url value="reg.jsp" var="chineseURL">
								<c:param name="locale" value="zh_CN">zh_CN</c:param>
							</c:url>
							<li><a href="${chineseURL}"><fmt:message
										key="nav.Register" /></a></li>

							<c:url value="index.jsp" var="engURL">
								<c:param name="locale" value="en_CA">en_CA</c:param>
							</c:url>
							<li><a href="${engURL}"><fmt:message key="nav.Language" /></a></li>
						</c:if>

						<c:if test="${loc == 'en_CA' }">
							<c:url value="signin.jsp" var="engURL">
								<c:param name="locale" value="en_CA">en_CA</c:param>
							</c:url>
							<li><a href="${engURL}"><fmt:message key="nav.Signin" /></a></li>

							<c:url value="reg.jsp" var="engURL">
								<c:param name="locale" value="en_CA">en_CA</c:param>
							</c:url>
							<li><a href="${engURL}"><fmt:message key="nav.Register" /></a></li>

							<c:url value="index.jsp" var="chineseURL">
								<c:param name="locale" value="zh_CN">zh_CN</c:param>
							</c:url>
							<li><a href="${chineseURL}"><fmt:message
										key="nav.Language" /></a></li>
						</c:if>
						<li><a href="#"><fmt:message key="nav.Contact" /></a></li>
					</ul>

					<div>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">Login <span
									class="glyphicon glyphicon-log-in"></span></a>
								<div class="dropdown-menu">
									<form id="formLogin" class="form container-fluid">
										<div class="form-group">
											<label for="usr">Name:</label> <input type="text"
												class="form-control" id="usr">
										</div>
										<div class="form-group">
											<label for="pwd">Password:</label> <input type="password"
												class="form-control" id="pwd">
										</div>
										<button type="button" id="btnLogin" class="btn btn-block">Login</button>
									</form>
									<div class="container-fluid">
										<br> <a class="small" href="#">Forgot password?</a>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<div class="site-wrapper">
			<div class="site-wrapper-inner">
				<div class="cover-container">
					<div class="inner cover">
						<br /> <IMG SRC="wwwroot/chef1.jpg" ALT="" WIDTH=700 HEIGHT=300>
						<p class="lead">
							<fmt:message key="index.Introduction" />
						</p>
						<p class="lead">
							<a href="#" class="btn btn-lg btn-default"><fmt:message
									key="btn.LearnMore" /></a>
						</p>
					</div>

					<div class="mastfoot">
						<div class="inner">
							<p>LOCATION 1385 Woodroffe Ave, Nepean, ON K2G 1V8 HOURS
								Monday-Sunday 11 AM-3 PM 4:30 PM-9:30 PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>

	</body>
</fmt:bundle>
</html>