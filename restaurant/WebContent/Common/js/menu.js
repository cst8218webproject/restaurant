/**
 * Based on the button clicked, add/remove item from cart
 * @author Chen
 */
$(document).ready(function() {
	$("button#delete").click(function() {

		var id = $(this).parent().find("input").attr("id");

		$.ajax({
			type : "POST",
			url : "deleteMenuItem",
			data : {id:id},
			success : function() {
				window.location.href = "welcome.jsp";
			}
		});
	});
	$("button#order").click(function() {
		var quantity = $(this).parent().find("input").val();
		var id = $(this).parent().find("input").attr("id");
		var name = $(this).parent().parent().find("h3").text().trim();

		$.ajax({
			type : "POST",
			url : "addToCart",
			data : {id:id, quantity:quantity},
			success : function() {
				alert(quantity + " items of " + name + " Added to cart");
				window.location.href = "welcome.jsp";
			}
		});
	});
});
/**
 * @author Zhenwei Chen
 */
$(function() {
	$(".numbers-row")
	.append(
	'<div class="inc button">+</div><div class="dec button">-</div>');
	$(".button").on("click", function() {
		var $button = $(this);
		var oldValue = $button.parent().find("input").val();
		if ($button.text() == "+") {
			var newVal = parseFloat(oldValue) + 1;
		} else {
			// Don't allow decrementing below zero
			if (oldValue > 0) {
				var newVal = parseFloat(oldValue) - 1;
			} else {
				newVal = 0;
			}
		}
		$button.parent().find("input").val(newVal);
	});
});
$(document).ready(function() {

});