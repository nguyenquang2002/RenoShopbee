<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    
     <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    
    <title>Cart</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/css/style.css'>
    <script src='${base }/js/script.js'></script>
    <script src="${base }/js/jquery-3.6.0.min.js"></script>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
    <main class="cart-main">
        <div class="menu_link">
            <ul>
                <li>
                    <a href="home.html">Home</a>
                </li>
                <li>
                    <a href="">/ shop</a>
                </li>
                <li>
                    <a href="" class="active">/ cart</a>
                </li>
            </ul>
        </div>
        <div class="cart_content">
        	<form action="${base }/cart" method="post">
        		<div class="title_cart">
	                <div>
	                    <p>Products</p>
	                </div>
	                <div>
	                    <p>Color & Size</p>
	                </div>
	                <div>
	                    <p>Quantity</p>
	                </div>
	                <div>
	                    <p>Price</p>
	                </div>
	                <div>
	                    <p>Total</p>
	                </div>
	            </div>
	            <c:set var="count" value="0" scope="page" />
	            <c:forEach var="cartItem" items="${cart.cartItems }">
	            	<div class="product">
		                <div class="name">
		                    <div class="img_product">
		                        <a href="${base }/infor-product/${cartItem.productName}-${cartItem.productId}">
		                            <img src="${base}/upload/${cartItem.avatar}" />
		                        </a>
		                    </div>
		                    <div class="title_product">
		                        <a href="${base }/infor-product/${cartItem.productName}-${cartItem.productId}">${cartItem.productName }</a>
		                    </div>
		                </div>
		                <div class="color_size">
		                    <p>Size: XL<br/>Color: Black</p>
		                </div>
		                <div class="quantity">
		                    <button class="btn" onclick="UpdateQuanlityCart('${base }', ${cartItem.productId}, -1)" value="-" type="button">-</button>
		                    <strong><span data-price="${cartItem.priceUnit }" id="quanlity_${cartItem.productId}">${cartItem.quanlity }</span></strong>
		                    <button class="btn" onclick="UpdateQuanlityCart('${base }', ${cartItem.productId}, +1)" value="+" type="button">+</button>
		                </div>
		                <div class="price">
		                    <p>$<span>${cartItem.priceUnit }</span></p>
		                </div>
		                <div class="total">
		                    <p>$<span id="totalPriceItem_${cartItem.productId}"></span></p>
		                    <button type="button" onclick="ShowModal(${count})" class="btn-delete"><i class="fa-solid fa-circle-xmark"></i></button>
		                    
		                </div>
		            </div>
		            <!-- The Modal -->
								<div id="myModal${count }" class="modal">
								
								  <!-- Modal content -->
								  <div class="modal-content">
								    <div class="modal-header">
								      <span onclick="CloseModal(${count})" class="close">&times;</span>
								      
								    </div>
								    <div class="modal-body">
								      <p>Do you want to delete ${cartItem.productName } ?</p>
								      
								    </div>
								    <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" onclick="CloseModal(${count})" id="cancel">Cancel</button>
								      <button type="button" class="btn btn-primary" onclick="DeleteProduct(${cartItem.productId})">Accept!</button>
								    </div>
								  </div>
								
								</div>
		            <c:set var="count" value="${count + 1}" scope="page"/>
	            </c:forEach>
	            
	           
	            <!-- <div class="shopping">
	                <button type="button">update cart</button>
	                <button type="button">continue shopping</button>
	            </div> -->
	            <div class="coupon_code">
	                <div class="coupon">
	                    <h3>use coupon code</h3>
	                    <p>Enter your code here</p>
	                    <div class="input_code">
	                        <input type="text" placeholder="    Enter your code here" />
	                        <button type="button">apply</button>
	                    </div>
	                </div>
	                <div class="coupon">
	                    <h3>use gift voucher</h3>
	                    <p>Enter your gift voucher code here</p>
	                    <div class="input_code">
	                        <input type="text" placeholder="    Enter your gift voucher code here" />
	                        <button type="button">apply</button>
	                    </div>
	                </div>
	            </div>
	            <div class="shipping">
	                <div class="shipping_addr">
	                    <h3>shipping availability</h3>
	                    <div class="shipping_content">
	                        <div>
	                            <p>Name</p>
	                            <input type="text" placeholder="Your name" id="customerFullName" name="customerFullName" value="${userLogined.name }" required />
	                        </div>
	                        <div>
	                            <p>Phone</p>
	                            <input type="tel" placeholder="Your phone" id="customerPhone" name="customerPhone" value="${userLogined.phone }" required />
	                        </div>
	                        <div>
	                            <p>Address</p>
	                            <input type="text" placeholder="Your address" id="customerAddress" name="customerAddress" value="${userLogined.shippingAddress }" required />
	                        </div>
	                    </div>
	                    <button class="button" type="button">Update Totals</button>
	                </div>
	                <div class="calculation">
	                    <h3>Shopping cart calcuation</h3>
	                    <div class="shipping_content">
	                        <div>
	                            <div class="text">
	                                <p>Subtotal</p>
	                                <p class="totalPrice"></p>
	                            </div>
	                            <div class="text">
	                                <p>Coupon</p>
	                                <p>-$0</p>
	                            </div>
	                            <div class="text">
	                                <p>Shipping</p>
	                                <p>Free Shipping</p>
	                            </div>
	                        </div>
	                        <div class="text">
	                            <p>Total</p>
	                            <p class="totalPrice"></p>
	                        </div>
	                    </div>
						<button class="button" type="submit">Proceed to Checkout</button>
	                    
	                </div>
	            </div>
            </form>
        </div>
    </main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		function ShowModal(i) {
			var modal = document.getElementById("myModal"+i);
			modal.style.display = "block";
		}
		function CloseModal(i) {
			var modal = document.getElementById("myModal"+i);
			modal.style.display = "none";
		}
		
		function DeleteProduct(productId) {
			// tạo javascript object.  
			var data = {
					productId: productId,
			};
			
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url:  '${base}' + "cart/deleteProduct",
				type: "post",						
				contentType: "application/json",
				data: JSON.stringify(data),

				dataType: "json", 
				success: function(jsonResult) {
					location.reload(); //refresh lại trang web
				},
				error: function(jqXhr, textStatus, errorMessage) {
					alert("error");
				}
			});
		}
	</script>
</body>
</html>