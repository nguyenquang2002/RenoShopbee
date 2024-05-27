// Cập nhật số lượng sản phẩm trong giỏ hàng khi click vào button '+' hoặc '-'
//quanlity  = -1 là click vào button -
//quanlity  = +1 là click vào button +
function UpdateQuanlityCart(baseUrl, productId, quanlity) {
	
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$( "#quanlity_" + productId ).html(jsonResult.currentProductQuality);
			$( ".totalPrice" ).html(jsonResult.totalPrice);
			$( "#totalPriceItem_" + productId).html(jsonResult.total);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}



function formatPrice(total){
    return total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}



// Thêm sản phẩm vào trong giỏ hàng với productId và số lượng mua sản phẩm đó
function AddToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // Id sản phẩm
		quanlity: quanlity, // Số lượng cho vào giỏ hàng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			/*alert(jsonResult.totalItems)*/
			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);

			/*$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalItemsInCart").offset().top
			}, 2000);*/
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
}

