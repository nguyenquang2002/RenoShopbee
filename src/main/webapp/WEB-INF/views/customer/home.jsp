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
    
    <title>Home Page</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link href="${base}/css/style.css" rel="stylesheet" />
    <script src='main.js'></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
    <main class="home-main">
        <div class="slider">
            <div id="slider01">
                <img src="${base}/img/slider01_02.png" width="100%" />
                <form action="get" id="slider_click">
                    <button type="submit" id="slider_button">
                        <p>Buy now</p>
                    </button>
                </form>
            </div>
        </div>
        <div class="products">
            <div class="item" id="left">
                <h2>best sellers</h2>
                <span><i>The best productions from us</i></span>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do elusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <c:forEach var="product" items="${products_hot }">
            	
  
            				<!-- start item -->
				            <div class="item">
				                <div class="infor">
				                    <a href="${base }/infor-product/${product.name}-${product.id}">
				                        <img src="${base}/upload/${product.avatar}" />
				                    </a>
				                    <div class="under_img">
				                        <ul>
				                            <li>
				                                <a role="button" onclick="AddToCart('${base}',${product.id }, 1)">
				                                    <i class="fa-solid fa-cart-shopping"></i>
				                                </a>
				                            </li>
				                            <li>
				                                <a href="#">
				                                    <i class="fa-solid fa-heart"></i>
				                                </a>
				                            </li>
				                            <li>
				                                <a href="#">
				                                    <i class="fa-solid fa-arrows-rotate"></i>
				                                </a>
				                            </li>
				                        </ul>
				                    </div>
				                </div>
				                    <div class="desc">
				                    <a href="${base }/infor-product/${product.name}-${product.id}">${product.name }</a>
				                    <p id="price">$<span>${product.price}</span></p>
				                    <p>${product.desc }</p>
				                </div>
				            </div>
				            
				            <!-- end item -->
            	
	            
            </c:forEach>
            
        </div>
        <div class="more_option">
            <ul>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-gem"></i>
                        <span>Special offers</span>
                        <p>shop big save big</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-paper-plane"></i>
                        <span>Free delivery</span>
                        <p>On Orders Above $99</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-arrows-rotate"></i>
                        <span>30 Days Return</span>
                        <p>Policy We Offers</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-rocket"></i>
                        <span>Fastest Shipping</span>
                        <p>2 Days Express</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="featured_products">
            <div class="top">
                <h2>featured products</h2>
                <p><i>Newest trends from top brands</i></p>
            </div>
            <div class="bottom">
<c:forEach var="product" items="${products }">
            	<c:set var="i" value="1"></c:set>
            	

            				<!-- start item -->
				            <div class="item">
				                <div class="infor">
				                    <a href="${base }/infor-product/${product.name}-${product.id}">
				                        <img src="${base}/upload/${product.avatar}" />
				                    </a>
				                    <div class="under_img">
				                        <ul>
				                            <li>
				                                <a role="button" onclick="AddToCart('${base}',${product.id }, 1)">
				                                    <i class="fa-solid fa-cart-shopping"></i>
				                                </a>
				                            </li>
				                            <li>
				                                <a href="#">
				                                    <i class="fa-solid fa-heart"></i>
				                                </a>
				                            </li>
				                            <li>
				                                <a href="#">
				                                    <i class="fa-solid fa-arrows-rotate"></i>
				                                </a>
				                            </li>
				                        </ul>
				                    </div>
				                </div>
				                    <div class="desc">
				                    <a href="${base }/infor-product/${product.name}-${product.id}">${product.name }</a>
				                    <p id="price">$<span>${product.price}</span></p>
				                    <p>${product.desc }</p>
				                </div>
				            </div>
				            
				            <!-- end item -->

            	
	            
            </c:forEach>
            </div>
        </div>
    </main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>
    
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>
</html>