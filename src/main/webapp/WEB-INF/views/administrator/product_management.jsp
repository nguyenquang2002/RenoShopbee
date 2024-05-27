<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product Management</title>
        
        <!-- Favicon-->
        <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
		
		<!-- COMMON -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		
        <!-- Core theme CSS (includes Bootstrap)-->
        <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
        
        <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
    </head>
    <body>
    	<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
    	
        <div class="d-flex" id="wrapper">
		<jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                
                
                <!-- Page content-->
                <div class="container-fluid">
                    
					<h1 class="mt-4">Add/Upadte Products</h1>
                    <p>

						<sf:form method="post" action="${base}/admin/product/management" modelAttribute="product" enctype="multipart/form-data">
							
							<div class="form-group mb-2" >
								<label for="productId">Product Id</label>
								<sf:input path="id" id="productId" class="form-control" readonly="true"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="productName">Product Name</label>
								<sf:input path="name" id="productName" class="form-control"></sf:input>
							</div>
							
							<!-- path chỉ hiểu và chỉ nên mapping với các kiểu(int, bool, double, string) -->
							<!-- đang mapping cho foreign key: category_id(int) -->
							<div class="form-group mb-2">
								<label for="category">Category (required)</label>
								<sf:select path="categories.id" class="form-control" id="category">
									<sf:options items="${categories }" itemValue="id" itemLabel="name" />									
								</sf:select>
							</div>
							
							<div class="form-group mb-2">
								<label for="price">Price (required)</label>
								<sf:input type="number" autocomplete="off" path="price" class="form-control" id="price" placeholder="Price" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="moneyUnit">Money Unit (required)</label>
								<sf:select path="moneyUnit" class="form-control" id="moneyUnit">
									<sf:option value="USD">USD</sf:option>
									<sf:option value="VND">VND</sf:option>
								</sf:select>
							</div>
							
							<div class="form-group mb-2">
								<label for="priceSale">Price Sale (required)</label>
								<sf:input type="number" autocomplete="off" path="priceSale" class="form-control" id="priceSale" placeholder="Price sale" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="size">Size (required)</label>
								<sf:select path="size" class="form-control" id="size">
									<sf:option value="X">X</sf:option>
									<sf:option value="XS">XS</sf:option>
									<sf:option value="S">S</sf:option>
								</sf:select>
							</div>
							
							<div class="form-group mb-2">
								<label for="color">Color (required)</label>
								<sf:select path="color" class="form-control" id="color">
									<sf:option value="Black">Black</sf:option>
									<sf:option value="White">White</sf:option>
									<sf:option value="Blue">Blue</sf:option>
									<sf:option value="Gray">Gray</sf:option>
									<sf:option value="Green">Green</sf:option>
								</sf:select>
							</div>
							
							<div class="form-group mb-2">
								<label for="description">Description (required)</label>
								<sf:textarea autocomplete="off" path="desc" class="form-control" placeholder="Description" id="description" rows="10" required="required"></sf:textarea>
							</div>
							
							<div class="form-group mb-2">
								<label for="description">Detail (required)</label>
								<sf:textarea autocomplete="off" path="detail" class="form-control summernote" placeholder="Detail" id="detail" rows="20" required="required"></sf:textarea>
							</div>
							
							<div class="form-group mb-2">
								<label for="amount">Amount (required)</label>
								<sf:input type="number" autocomplete="off" path="amount" class="form-control" id="amonut" required="required"></sf:input>
							</div>
							
							<div class="form-group form-check mb-2">
								<sf:checkbox path="isHot" class="form-check-input" id="isHot" />
								<label class="form-check-label" for="isHot">Is Hot Product?</label>
							</div>
	
							<!-- avatar -->
							<div class="form-group mb-2">
								<label for="fileProductAvatar">Avatar</label> 
								<input id="fileProductAvatar" name="productAvatar" type="file" class="form-control">
							</div>
							
							<div class="form-group">
								<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${product.avatar}">
							</div>
	
							<!-- pictures -->
							<div class="form-group mb-2">
								<label for="fileProductPictures">Picture(Multiple)</label> 
								<input id="fileProductPictures" name="productPictures" type="file" class="form-control" multiple="multiple">
							</div>
							
							<div class="form-group">
								<c:forEach items="${product.productImages }" var="productImage">
									<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${productImage.path}">
								</c:forEach>
							</div>
							
							<a href="${base }/admin/product" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
							<button type="submit" class="btn btn-primary">Save Product</button>
						</sf:form>

					</p>                    
                    
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		
		<!-- internal javascript -->
		<script type="text/javascript">
			$(document).ready(function() {
				$('#detail').summernote();
			});
		</script>
		
    </body>
</html>
