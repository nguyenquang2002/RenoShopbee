<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    
    <title>List Product</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/css/style.css'>
    <link type="text/css" rel="stylesheet" href='${base }/css/simplePagination.css'/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
    <main class="listproduct-main">
        <div class="menu_link">
            <ul>
                <li>
                    <a href="home.html">Home</a>
                </li>
                <li>
                    <a href="">/ shop</a>
                </li>
                <li>
                    <a href="">/ list</a>
                </li>
            </ul>
        </div>
        <sf:form action="${base }/list" method="get">
        	<input id="page" name="page" class="form-control" value="${searchModel.page }" style="display: none;">
        	<input id="keyword1" name="keyword" class="form-control" value="${searchModel.keyword }" style="display: none;">
        	<input id="price1" name="price" class="form-control" value="${searchModel.price }" style="display: none;">
        	<input id="size1" name="size" class="form-control" value="${searchModel.size }" style="display: none;">
        	<input id="color1" name="color" class="form-control" value="${searchModel.color }" style="display: none;">
        	<input id="categoryId1" name="categoryId" class="form-control" value="${searchModel.categoryId }" style="display: none;">
        	<div class="list">
        		<input id="categoryId1" name="categoryId" class="form-control" value="" style="display: none;">
	            <div class="left">
	                <div class="cate">
	                    <ul>
	                        <p>Categories</p>
	                        <c:choose>
	                        	<c:when test="${searchModel.categoryId==1 }">
	                        		<li>
			                            <label style="color: #3cb878;" for="btnSearch" onclick="document.getElementById('categoryId1').value='1'" >Accessories  (${access_count })</label>
			                        </li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
			                            <label for="btnSearch" onclick="document.getElementById('categoryId1').value='1'" >Accessories  (${access_count })</label>
			                        </li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.categoryId==2 }">
	                        		<li>
			                            <label style="color: #3cb878;" for="btnSearch" onclick="document.getElementById('categoryId1').value='2'" >Jewellery  (${jewel_count })</label>
			                        </li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
			                            <label for="btnSearch" onclick="document.getElementById('categoryId1').value='2'" >Jewellery  (${jewel_count })</label>
			                        </li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.categoryId==6 }">
	                        		<li>
			                            <label style="color: #3cb878;" for="btnSearch" onclick="document.getElementById('categoryId1').value='6'" >Watch  (${watch_count })</label>
			                        </li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
			                            <label for="btnSearch" onclick="document.getElementById('categoryId1').value='6'" >Watch  (${watch_count })</label>
			                        </li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.categoryId==7 }">
	                        		<li>
			                            <label style="color: #3cb878;" for="btnSearch" onclick="document.getElementById('categoryId1').value='7'" >Clothing  (${clothing_count })</label>
			                        </li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
			                            <label for="btnSearch" onclick="document.getElementById('categoryId1').value='7'" >Clothing  (${clothing_count })</label>
			                        </li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.categoryId==8 }">
	                        		<li>
			                            <label style="color: #3cb878;" for="btnSearch" onclick="document.getElementById('categoryId1').value='8'" >Bags  (${bag_count })</label>
			                        </li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
			                            <label for="btnSearch" onclick="document.getElementById('categoryId1').value='8'" >Bags  (${bag_count })</label>
			                        </li>
	                        	</c:otherwise>
	                        </c:choose>
	                        
	                    </ul>
	                    <div class="remove">
	                    	<label for="btnSearch" onclick="document.getElementById('categoryId1').value=''" >Remove Category Filter</label>
	                    </div>
	                </div>
	                <div class="price_filter">
	                    <ul>
	                        <li>price filter</li>
	                        <li>
		                        <c:choose>
		                        	<c:when test="${searchModel.price == '50 and 250' }">
		                        		<input type="checkbox" name="price" id="price_1" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="price" id="price_1" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
	                        	
	                            
	                            <label for="btnSearch" onclick="document.getElementById('price1').value='50 and 250'">$50 - $250</label>
	                        </li>
	                        <li>
	                             <c:choose>
		                        	<c:when test="${searchModel.price == '250 and 500' }">
		                        		<input type="checkbox" name="price" id="price_2" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="price" id="price_2" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
	                        	
	                            
	                            <label for="btnSearch" onclick="document.getElementById('price1').value='250 and 500'">$250 - $500</label>
	                        </li>
	                        <li>
	                            <c:choose>
		                        	<c:when test="${searchModel.price == '500 and 750' }">
		                        		<input type="checkbox" name="price" id="price_3" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="price" id="price_3" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
		                        
	                            <label for="btnSearch" onclick="document.getElementById('price1').value='500 and 750'">$500 - $750</label>
	                        </li>
	                        <li>
	                            <c:choose>
		                        	<c:when test="${searchModel.price == '750 and 1000' }">
		                        		<input type="checkbox" name="price" id="price_4" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="price" id="price_4" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
		                        
	                            <label for="btnSearch" onclick="document.getElementById('price1').value='750 and 1000'">$750 - $1000</label>
	                        </li>
	                        <li>
	                            
	                                <button type="submit" class="search" value="Search" id="btnSearch" style="display: none;">
	                                    <i class="fa-solid fa-magnifying-glass"></i>
	                                </button>
	                            
	                        </li>
	                    </ul>
	                    <div class="remove">
	                    	<label for="btnSearch" onclick="document.getElementById('price1').value=''" >Remove Price Filter</label>
	                    </div>
	                </div>
	                <div class="size">
	                    <p>size</p>
	                    <ul>
	                        <c:choose>
	                        	<c:when test="${searchModel.size=='XS' }">
	                        		<li style="color: white; background-color: #3cb878;">
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='XS'">XS</label>
	                        		</li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='XS'">XS</label>
	                        		</li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.size=='S' }">
	                        		<li style="color: white; background-color: #3cb878;">
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='S'">S</label>
	                        		</li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='S'">S</label>
	                        		</li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.size=='M' }">
	                        		<li style="color: white; background-color: #3cb878;">
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='M'">M</label>
	                        		</li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='M'">M</label>
	                        		</li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.size=='L' }">
	                        		<li style="color: white; background-color: #3cb878;">
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='L'">L</label>
	                        		</li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='L'">L</label>
	                        		</li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.size=='SL' }">
	                        		<li style="color: white; background-color: #3cb878;">
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='SL'">SL</label>
	                        		</li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='SL'">SL</label>
	                        		</li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${searchModel.size=='XL' }">
	                        		<li style="color: white; background-color: #3cb878;">
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='XL'">XL</label>
	                        		</li>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<li>
	                        			<label for="btnSearch" onclick="document.getElementById('size1').value='XL'">XL</label>
	                        		</li>
	                        	</c:otherwise>
	                        </c:choose>
	                    </ul>
	                    <div class="remove">
	                    	<label style="text-transform: capitalize;" for="btnSearch" onclick="document.getElementById('size1').value=''" >Remove Size Filter</label>
	                    </div>
	                </div>
	                <div class="color_filter">
	                    <ul>
	                        <li>COLOR</li>
	                        <li>
		                        <c:choose>
		                        	<c:when test="${searchModel.color == 'Black' }">
		                        		<input type="checkbox" name="color" id="color_1" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="color" id="color_1" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
	                        	
	                            
	                            <label for="btnSearch" onclick="document.getElementById('color1').value='Black'">Black</label>
	                        </li>
	                        <li>
	                             <c:choose>
		                        	<c:when test="${searchModel.color == 'White' }">
		                        		<input type="checkbox" name="color" id="color_2" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="color" id="color_2" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
	                        	
	                            
	                            <label for="btnSearch" onclick="document.getElementById('color1').value='White'">White</label>
	                        </li>
	                        <li>
	                            <c:choose>
		                        	<c:when test="${searchModel.color == 'Blue' }">
		                        		<input type="checkbox" name="color" id="color_3" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="color" id="color_3" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
		                        
	                            <label for="btnSearch" onclick="document.getElementById('color1').value='Blue'">Blue</label>
	                        </li>
	                        <li>
	                            <c:choose>
		                        	<c:when test="${searchModel.color == 'Gray' }">
		                        		<input type="checkbox" name="color" id="color_4" checked disabled="disabled" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<input type="checkbox" name="color" id="color_4" disabled="disabled" />
		                        	</c:otherwise>
		                        </c:choose>
		                        
	                            <label for="btnSearch" onclick="document.getElementById('color1').value='Gray'">Gray</label>
	                        </li>
	                    </ul>
	                    <div class="remove">
	                    	<label for="btnSearch" onclick="document.getElementById('color1').value=''" >Remove Color Filter</label>
	                    </div>
	                </div>
	            </div>
	            <div class="right">
	            	<c:forEach items="${products.data }" var="product">
		            		
		            		<!-- start item -->
			                <div class="product">
			                    <div class="product_left">
			                        <a href="${base }/infor-product/${product.name}-${product.id}">
			                            <img alt="" src="${base }/upload/${product.avatar}">
			                        </a>
			                    </div>
			                    <div class="product_right">
			                        <a href="${base }/infor-product/${product.name}-${product.id}">${product.name }</a>
			                        <div class="product_infor">
			                            <span class="price">
			                                $${product.price }
			                            </span>
			                            <p class="infor">
			                            	${product.desc }
			                            </p>
			                        </div>
			                        <div class="option">
			                            <ul>
			                                <li>
			                                    <a href="#" onclick="AddToCart('${base}', ${product.id }, 1)">
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
			                <!-- end item -->
		            	
	            	</c:forEach>
	                
	                
	                
		                    <div class="row">
								<div class="col-12 d-flex justify-content-center">
									<div id="paging"></div>
								</div>
							</div>	
	                   
	                    
	            </div>

        	
        	</div>
        </sf:form>
    </main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	
		<script type="text/javascript">
		
			$( document ).ready(function() {
							
				$("#paging").pagination({
					currentPage: ${products.currentPage}, //trang hiện tại
			        items: ${products.totalItems},	//tổng số sản phẩm
			        itemsOnPage: ${products.sizeOfPage}, //số sản phẩm trên 1 trang
			        cssStyle: 'light-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
			
		</script>
	
</body>
</html>