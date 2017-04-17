<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%--
@author Zhenwei, Chen
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

<title><fmt:message key="reg.Title" /></title>

<!-- Bootstrap core CSS -->
<link href="bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../../assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">


<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	          $(document).ready(function(){
	              $("input[name='uname']").change(function(){
	                  var uname = $(this).val();
	                  if(uname.length >= 3){
	                      $(".status").html("<img src='images/loading.gif'><font color=gray> Checking availability...</font>");
	                      $.ajax({
	                          type: "POST",
	                          url: "check",
	                          data: "uname="+ uname,
	                          success: function(out){
	                                  $(".status").html(out);
	                          }
	                      }); 
	                  }
	                  else{
	                      $(".status").html("<font color=red>Username should be <b>3</b> character long.</font>" + uname);
	                  }
	              });
	          });
	</script>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="container">

		<form method="post" action="registration.jsp" class="form-signin">
			<h2 class="form-signin-heading"><fmt:message key="reg.Header" /></h2>
			<label for="inputName" class="sr-only"><fmt:message key="user.FirstName" /></label> <input
				type="text" name="fname" value="" class="form-control"
				placeholder="<fmt:message key="user.FirstName" />" required autofocus> <label
				for="inputEmail" class="sr-only"><fmt:message key="user.LastName" /></label> <input
				type="text" name="lname" value="" class="form-control"
				placeholder="<fmt:message key="user.LastName" />" required> <label for="inputPassword"
				class="sr-only"><fmt:message key="user.Email" /></label> <input type="email" name="email"
				value="" class="form-control" placeholder="<fmt:message key="user.Email" />" required>
			<label for="inputaddress" class="sr-only"><fmt:message key="user.Username" /></label> <input
				type="text" name="uname" value="" class="form-control"
				placeholder="<fmt:message key="user.Username" />" required><span class="status"></span>
			<label for="inputtel" class="sr-only"><fmt:message key="user.Password" /></label> <input
				type="password" name="pass" value="" class="form-control"
				placeholder="<fmt:message key="user.Password" />" required>

			<button class="btn btn-lg btn-primary btn-block" type="submit"
				value="Submit"><fmt:message key="reg.Title" /></button>
		</form>
	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
</fmt:bundle>