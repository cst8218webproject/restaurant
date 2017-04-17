/**
 * This function get username and password and then doPost to
 * login.
 */
$(document).ready(function() {
	$("button#btnLogin").click(function() {
		var uname = $(this).parent().find("input#usr").val();
		var pass = $(this).parent().find("input#pwd").val();
		$.ajax({
			type : "POST",
			url : "login",
			data : {uname:uname,pass:pass},
			success : function(out) {
				$("#loginError").html(out);
			}
		});
	});
});