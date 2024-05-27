<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    
    <title>Information Product</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/css/style.css'>
    <script src='${base}/js/script.js'></script>
    <script src="${base}/jquery/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
    <main class="inforproduct-main">
        <div class="menu_link">
            <ul>
                <li>
                    <a href="home.html">Home</a>
                </li>
                <li>
                    <a href="">/ shop</a>
                </li>
                <li>
                    <a href="" class="active">/ product</a>
                </li>
            </ul>
        </div>
        <div class="product">
            <div class="left">
                <div class="img_top">
                    <img src="${base}/upload/${product.avatar}" />
                </div>
                <div class="img_bot">
                    <i class="fa-solid fa-angles-left"></i>
                    
                    <c:forEach items="${product.productImages }" var="productImg">
                    	<img src="${base}/upload/${productImg.path}" />
                    </c:forEach>
                    <i class="fa-solid fa-angles-right"></i>
                </div>
            </div>
            <div class="right">
                <div class="infor">
                    <h1>${product.name }</h1>
                    <span>$<span>${product.price }</span></span>
                    <p>
                        ${product.desc }
                    </p>
                </div>
                <div class="option">
                    <div class="select">
                        <p>Size: ${product.size }</p>
                        <p>Color: ${product.color }</p>
                    </div>
                    <c:set var="quanlity" value="${1 }" scope="page"></c:set>
                    <div class="quantity">
                        <button class="btn-subtract" onclick="subtractQuanlity()" type="button">-</button>
                        <input type="number" name="quanlity" id="quanlity" class="quanlity" value="${quanlity }" />
                        <button class="btn-add" type="button" onclick="addQuanlity()">+</button>
                    </div>
                    
                    <div class="more_option">
                        <ul>
                            <li>
								
                                <a href="" onclick="AddToCart('${base}', ${product.id }, ${quanlity })">
                                    <i class="fa-solid fa-cart-shopping">add to cart</i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-solid fa-heart"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="fa-solid fa-arrows-rotate"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="desc">
            <ul>
                <li class="active">
                    Description
                    
                </li>
                <li>Reviews</li>
            </ul>
            <p>${product.detail }</p>
        </div>
        <div class="related_product">
            <ul>
                <li>Realated Products</li>
                <li>
                    <i class="fa-solid fa-arrow-left"></i>
                    <i class="fa-solid fa-arrow-right"></i>
                </li>
            </ul>
            <div class="goods">
	            <c:forEach items="${products_hot }" var="product">
	            	<div class="item">
	                    <a href="${base }/infor-product/${product.name}-${product.id}">
	                        <img src="${base}/upload/${product.avatar}" />
	                        <h3>${product.name }</h3>
	                    </a>
	                    <span>$<span>${product.price }</span></span>
	                </div>
	            </c:forEach>
            </div>
        </div>
    </main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>


	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
     
	<script type="text/javascript">
		function addQuanlity(){
			var input = document.getElementById("quanlity");
			var q = input.value;
			if(q<10){
				q = parseInt(q)+1;
				input.value=q;
			}
			
		}
		function subtractQuanlity(){
			var input = document.getElementById("quanlity");
			var q = input.value;
			if(q>1){
				q = parseInt(q)-1;
				input.value=q;
			}
		}
	</script>
</body>
</html>