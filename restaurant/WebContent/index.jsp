<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>

<html>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : 'en_CA'}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:bundle basename="Language/LanguageBundle">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title><fmt:message key="index.Title" /></title>

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
	<%@include file ="Common/navbar.jsp" %>
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