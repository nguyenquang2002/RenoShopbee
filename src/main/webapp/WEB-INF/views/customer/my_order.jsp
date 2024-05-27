<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    
    <title>My Account</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="${base}/css/style.css" rel="stylesheet" />
	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  padding-top: 100px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		/* Modal Content */
		.modal-content {
		  position: relative;
		  background-color: #fefefe;
		  margin: auto;
		  padding: 0;
		  border: 1px solid #888;
		  width: 50%;
		  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		  -webkit-animation-name: animatetop;
		  -webkit-animation-duration: 0.4s;
		  animation-name: animatetop;
		  animation-duration: 0.4s
		}
		
		/* Add Animation */
		@-webkit-keyframes animatetop {
		  from {top:-300px; opacity:0} 
		  to {top:0; opacity:1}
		}
		
		@keyframes animatetop {
		  from {top:-300px; opacity:0}
		  to {top:0; opacity:1}
		}
		
		/* The Close Button */
		.close {
		  color: #bfbfbf;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		  margin-left: 95%;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.modal-header {
		  padding: 2px 16px;
		  background-color: white;
		  color: white;
		}
		
		.modal-body {padding: 2px 16px;}
		
		.modal-footer {
		  padding: 2px 16px;
		  background-color: white;
		  
		}
    </style>
    <script src='main.js'></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
    <main class="order-main">
        <div class="menu_link">
            <ul>
                <li>
                    <a href="home.html">Home</a>
                </li>
                <li>
                    <a href="">/ Account</a>
                </li>
            </ul>
        </div>
        <div>
        	<h2 style="margin-top: 30px; margin-left: 40px; ">My Orders:</h2>
        	<table class="table-order">
	          <thead>
	            <tr>
	              
	              <th scope="col">Code</th>
	              <th scope="col">Customer name</th>
	              <th scope="col">Customer phone</th>
	              <th scope="col">Customer address</th>
	              <th scope="col">Status</th>
	              <th scope="col">Total</th>
	              
	              <th scope="col" style="text-align: center;">Management</th>
	            </tr>
	          </thead>
	          <tbody>
	          	<c:set var="count" value="0" scope="page" />
	              <c:forEach items="${orders }" var="order">
	              	<tr>
	              		
	              		
	              		<td>${order.code }</td>
	              		<td>${order.customerName }</td>
	              		<td>${order.customerPhone }</td>
	              		<td>${order.customerAddress }</td>
	              		<td>
	              			<c:choose>
	              				<c:when test="${order.orderStatus == 0 }">
	              					<span class="btn btn-danger">Cancelled</span>
	              				</c:when>
	              				<c:when test="${order.orderStatus == 1 }">
	              					<span class="btn btn-warning">Processing</span>
	              				</c:when>
	              				<c:when test="${order.orderStatus == 2 }">
	              					<span class="btn btn-primary">Shipping</span>
	              				</c:when>
	              				<c:when test="${order.orderStatus == 3 }">
	              					<span class="btn btn-success">Shipped</span>
	              				</c:when>
	              			</c:choose>
	              			
						</td>
	              		<td>$${order.total }</td>
	              		
	              		<td>
	              			<div class="d-flex" style="justify-content: space-around;" >
	              				<c:choose>
	              					<c:when test="${order.orderStatus == 2 }">
		              					<a role="button" style="font-size: 20px;" class="myBtn" onclick="ShowCompleteModal(${count})">
			              					<i class="fa-solid fa-circle-check"></i>
			              				</a>
		              				</c:when>
		              				<c:otherwise>
		              					<a role="button" style="font-size: 20px;">
			              					<i class="fa-solid fa-circle-check"></i>
			              				</a>
		              				</c:otherwise>
	              				</c:choose>
	              				<c:choose>
	              					<c:when test="${order.orderStatus <3 && order.orderStatus >0 }">
		              					<a style="font-size: 20px;" role="button" class="myBtn" onclick="ShowModal(${count})">
			              					<i class="fa-sharp fa-solid fa-circle-xmark"></i>
			              				</a>
		              				</c:when>
		              				<c:otherwise>
		              					<a style="font-size: 20px;" role="button">
			              					<i class="fa-sharp fa-solid fa-circle-xmark"></i>
			              				</a>
		              				</c:otherwise>
	              				</c:choose>
	              				
	              				
	              				<!-- The Modal -->
								<div id="myModal${count }" class="modal">
								
								  <!-- Modal content -->
								  <div class="modal-content">
								    <div class="modal-header">
								      <span onclick="CloseModal(${count})" class="close">&times;</span>
								      
								    </div>
								    <div class="modal-body">
								      <p style="text-align: left;">Do you want to cancel with code ${order.code } ?</p>
								      
								    </div>
								    <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" onclick="CloseModal(${count})" id="cancel">No</button>
								      <button type="button" class="btn btn-danger" onclick="CancelOrder(${order.id})">Yes!</button>
								    </div>
								  </div>
								
								</div>
								
								<!-- The Modal -->
								<div id="myCompleteModal${count }" class="modal">
								
								  <!-- Modal content -->
								  <div class="modal-content">
								    <div class="modal-header">
								      <span onclick="CloseCompleteModal(${count})" class="close">&times;</span>
								      
								    </div>
								    <div class="modal-body">
								      <p style="text-align: left;">Have you received the order with code ${order.code}?</p>
								      
								    </div>
								    <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" onclick="CloseCompleteModal(${count})" id="cancel">Cancel</button>
								      <button type="button" class="btn btn-primary" onclick="CompleteOrder(${order.id})">Accept!</button>
								    </div>
								  </div>
								
								</div>
	              			</div>
	              		</td>
	              	</tr>
	              	<c:set var="count" value="${count + 1}" scope="page"/>
	              </c:forEach>
	          </tbody>
	        </table>
        </div>
    </main>
    <script type="text/javascript">
		function ShowModal(i) {
			var modal = document.getElementById("myModal"+i);
			modal.style.display = "block";
		}
		
		function CloseModal(i) {
			var modal = document.getElementById("myModal"+i);
			modal.style.display = "none";
		}
		
		function ShowCompleteModal(i) {
			var modal = document.getElementById("myCompleteModal"+i);
			modal.style.display = "block";
		}
		function CloseCompleteModal(i) {
			var modal = document.getElementById("myCompleteModal"+i);
			modal.style.display = "none";
		}
		
		function CancelOrder(orderID) {
			// tạo javascript object.  
			var data = {
				id: orderID,
			};
			
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url:  '${base}' + "/admin/order/cancel",
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
		function CompleteOrder(orderID) {
				// tạo javascript object.  
			var data = {
				id: orderID,
			};
			
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url:  '${base}' + "/admin/order/complete",
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
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	
	
</body>
</html>