<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>

<c:set var="loc" value="en_CA" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}"></c:set>
	<!-- Store into session -->

</c:if>
<fmt:setLocale value="${loc}" />
<fmt:bundle basename="Language/LanguageBundle">

<html>
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
<link href="cover.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="masthead clearfix">
					<div class="inner">
						<h3 class="masthead-brand">ACZ restaurant</h3>
						<nav>
							<ul class="nav masthead-nav">
								<li class="active"><a href="#"><fmt:message
											key="nav.Menu" /></a></li>
								<c:if test="${loc == 'zh_CN' }">
									<c:url value="signin.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN">zh_CN</c:param>
									</c:url>
									<li><a href="${chineseURL}"><fmt:message key="nav.Signin" /></a></li>

									<c:url value="reg.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN">zh_CN</c:param>
									</c:url>
									<li><a href="${chineseURL}"><fmt:message
												key="nav.Register" /></a></li>

									<c:url value="index.jsp" var="engURL">
										<c:param name="locale" value="en_CA">en_CA</c:param>
									</c:url>
									<li><a href="${engURL}"><fmt:message
												key="nav.Language" /></a></li>
								</c:if>

								<c:if test="${loc == 'en_CA' }">
									<c:url value="signin.jsp" var="engURL">
										<c:param name="locale" value="en_CA">en_CA</c:param>
									</c:url>
									<li><a href="${engURL}"><fmt:message
												key="nav.Signin" /></a></li>

									<c:url value="reg.jsp" var="engURL">
										<c:param name="locale" value="en_CA">en_CA</c:param>
									</c:url>
									<li><a href="${engURL}"><fmt:message
												key="nav.Register" /></a></li>

									<c:url value="index.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN">zh_CN</c:param>
									</c:url>
									<li><a href="${chineseURL}"><fmt:message
												key="nav.Language" /></a></li>
								</c:if>

								<li><a href="#"><fmt:message key="nav.Contact" /></a></li>
							</ul>
						</nav>
					</div>
				</div>

				<div class="inner cover">
					<br /> <IMG SRC="wwwroot/chef1.jpg" ALT="" WIDTH=700
						HEIGHT=300>
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
</html>
</fmt:bundle>