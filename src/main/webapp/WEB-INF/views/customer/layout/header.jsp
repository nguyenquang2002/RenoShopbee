<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="head">
    <div class="content_header">
        <div class="header_left">
            <div class="logo">
                <a href="${base }/home">
                    <img src="${base}/img/logo_03.png" />
                </a>
            </div>
        </div>
        <div class="header_right">
            <div class="login_logout">
                <ul>
                    <li>
                        <a href="${base }/cart" class="cart">
                            <img src="${base}/img/cart_03.png" />
                            <span id="text_cart">Cart</span>
                            <span class="count" id="iconShowTotalItemsInCart">${totalItems }</span>
                        </a>
                    </li>
                    <c:choose>
                    	<c:when test="${isLogined }">
                    		<li class="account">
                    		 	<a href="">
                    		 		${userLogined.username } <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
								  	<path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
									</svg>
								</a>
								<ul class="option">
									<li>
										<a href="${base }/account/information/${userLogined.username}-${userLogined.id}">Information</a>
									</li>
									<li>
										<a href="${base }/account/order/${userLogined.username}-${userLogined.id}">Orders</a>
									</li>
									<li>
										<a href="${base }/logout">Log out</a>
									</li>
								</ul>
                        	</li>
                    	</c:when>
                    	<c:otherwise>
                    		<li>
                        		<a href="${base }/login">Login</a>
                    		</li>
		                    <li>
		                        <a href="${base }/register">Register</a>
		                    </li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
        </div>
    </div>
</header>