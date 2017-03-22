/**
 * 
 */
$(document).ready(function() {
	$("button#remove").click(function() {
		var id = $(this).val();

		$.ajax({
			type : "POST",
			url : "removeFromCart",
			data : {id:id},
			success : function(out) {
				alert(out);
				window.location.href = "Cart.jsp";
			}
		});
	});
});