$(function() {
	$(".rv-wishlist").click(function() {
		var user_id = $(this).attr("data-user");
		var product_id = $(this).attr("data-product");
		$.ajax({
			url : "/remove_product",
			data : {
				"user_id" : user_id,
				"product_id" : product_id
			},
			dataType : "json",
			type : "POST",
			success : function(data) {
				console.log("success");
				$.notify("Remove product from wishlist success. ", "success");
				var html = "";
				html += "<button type=button' data-toggle= 'modal' data-target =#AddProductWishList class='btn btn-primary'>";
				html += "Add To Wishlist";
				html += "</button>";
				$(".rv-wishlist-complete").html(html);
			},
			error : function() {
				console.log("error");
			}
		});
		return false;
	});
});
