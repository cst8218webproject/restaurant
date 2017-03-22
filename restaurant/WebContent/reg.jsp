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

<title>Sign in Template for Bootstrap</title>

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
			<h2 class="form-signin-heading">Register Your Account</h2>
			<label for="inputName" class="sr-only">First Name</label> <input
				type="text" name="fname" value="" class="form-control"
				placeholder="First Name" required autofocus> <label
				for="inputEmail" class="sr-only">Last Name</label> <input
				type="text" name="lname" value="" class="form-control"
				placeholder="Last Name" required> <label for="inputPassword"
				class="sr-only">Email</label> <input type="email" name="email"
				value="" class="form-control" placeholder="Email" required>
			<label for="inputaddress" class="sr-only">User Name</label> <input
				type="text" name="uname" value="" class="form-control"
				placeholder="User Name" required><span class="status"></span>
			<label for="inputtel" class="sr-only">Password</label> <input
				type="password" name="pass" value="" class="form-control"
				placeholder="Password" required>

			<button class="btn btn-lg btn-primary btn-block" type="submit"
				value="Submit">Register</button>
		</form>
	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>