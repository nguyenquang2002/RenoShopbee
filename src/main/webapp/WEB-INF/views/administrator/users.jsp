<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Admin Users</title>
    
   	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    

	<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
	
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
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

    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
<body>
	<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>


	<div class="container-fluid">
	  <div class="row">
	    <jsp:include page="/WEB-INF/views/administrator/layout/nav.jsp"></jsp:include>
	
	    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	        <h1 class="h2">Users</h1>
	        <div class="btn-toolbar mb-2 mb-md-0">
	          <a href="/admin/user/management" class="btn btn-secondary active" role="button" aria-pressed="true">Add Employee</a>
	        </div>
	      </div>

	      <h2>User List</h2>
	      <sf:form method="get" action="${base }/admin/user">
	      		<!-- tìm kiếm sản phẩm trên danh sách -->
				<div class="d-flex flex-row justify-content-between mt-4">
						
						<input id="page" name="page" class="form-control" value="${searchModel.page }">
						
						<!-- tìm kiếm theo tên sản phẩm -->
						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" style="margin-right: 5px;" value="${searchModel.keyword }">
								
						<!-- tìm kiếm theo danh mục sản phẩm -->
						<select class="form-control" name="roleId" id="roleId" style="margin-right: 5px;">
							<option value="0">All</option>
							<option value="18">CO_ADMIN</option>
							<option value="20">ADMIN</option>
							<option value="19">GUEST</option>
						</select>
								
						<button type="submit" id="btnSearch" name="btnSearch" value="Search" class="btn btn-primary">Search</button>
					</div>
			<div class="table-responsive">
	        <table class="table table-striped table-sm">
	          <thead>
	            <tr>
	              <th scope="col">ID</th>
	              <th scope="col">User Name</th>
	              <th scope="col">Name</th>
	              <th scope="col">Phone Number</th>
	              <th scope="col">Address</th>
	              <th scope="col">Status</th>
	              <th scope="col">Roles</th>
	              <th scope="col" style="text-align: center;">Management</th>
	            </tr>
	          </thead>
	          <tbody>
	          	
	          	<c:set var="count" value="0" scope="page" />
	              <c:forEach items="${users.data }" var="user">
	             	<c:set var="co_admin" value="0" scope="page"></c:set>
	          		<c:set var="admin" value="0" scope="page"></c:set>
	              	<tr>
	              		<td>${user.id }</td>
	              		<td>${user.username }</td>
	              		<td>${user.name }</td>
	              		<td>${user.phone }</td>
	              		<td>${user.shippingAddress }</td>
	              		<td>
	              			<span id="_user_status_${user.id} }">
								<c:choose>
									<c:when test="${user.status }">
										<input type="checkbox" checked="checked" readonly>
									</c:when>
									<c:otherwise>
										<input type="checkbox" readonly>
									</c:otherwise>
								</c:choose>
							</span>
						</td>
	              		<td>
							<c:forEach items="${user.roles }" var="role">
								${role.name }
								<c:if test="${role.id == 18 }">
									<c:set var="co_admin" value="${co_admin + 1}" scope="page"/>
								</c:if>
								<c:if test="${role.id == 20 }">
									<c:set var="admin" value="${admin + 1}" scope="page"/>
								</c:if>
							</c:forEach>
	              		</td>
	              		<td>
	              			<div class="d-flex" style="justify-content: space-around;">
	              				<a href="${base }/admin/user/management/${user.id}">
	              					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
									  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
									</svg>
	              				</a>
	              				<%-- <c:if test="${co_admin==0 && admin==0 }">
	              					<a role="button"  onclick="ShowUpModal(${count})">
		              					<svg style="color: #0d6efd" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-square" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.5 9.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
										</svg>
		              				</a>
	              				</c:if>
	              				<c:if test="${co_admin>0 && admin==0 }">
	              					<a role="button"  onclick="ShowDownModal(${count})">
		              					<svg style="color: #0d6efd" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-square" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.5 2.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
										</svg>
		              				</a>
	              				</c:if>
	              				<c:if test="${admin>0 }">
	              					<a role="button">
		              					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-square" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.5 9.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
										</svg>
		              				</a>
	              				</c:if> --%>
	              				<c:choose>
	              					<c:when test="${admin==0 }">
	              						<a role="button" class="myBtn${count }" onclick="ShowModal(${count})"  >
			              					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
											  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
											</svg>
			              				</a>
	              					</c:when>
	              					<c:otherwise>
	              						<a role="button" class="myBtn${count }" style="color: black;"  >
			              					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
											  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
											</svg>
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
								      <p>Do you want to ban the user with id ${user.id } ?</p>
								      
								    </div>
								    <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" onclick="CloseModal(${count})" id="cancel">Cancel</button>
								      <button type="button" class="btn btn-primary" onclick="BanUser(${user.id})">Accept!</button>
								    </div>
								  </div>
								</div>
								
								<!-- The Modal -->
								<div id="myUpModal${count }" class="modal">
								
								  <!-- Modal content -->
								  <div class="modal-content">
								    <div class="modal-header">
								      <span onclick="CloseUpModal(${count})" class="close">&times;</span>
								      
								    </div>
								    <div class="modal-body">
								      <p>Do you want to add CO_ADMIN for the user with id ${user.id } ?</p>
								      
								    </div>
								    <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" onclick="CloseUpModal(${count})" id="cancel">Cancel</button>
								      <button type="button" class="btn btn-primary" onclick="AddUserCO(${user.id})">Accept!</button>
								    </div>
								  </div>
								</div>
								
								<!-- The Modal -->
								<div id="myDownModal${count }" class="modal">
								
								  <!-- Modal content -->
								  <div class="modal-content">
								    <div class="modal-header">
								      <span onclick="CloseDownModal(${count})" class="close">&times;</span>
								      
								    </div>
								    <div class="modal-body">
								      <p>Do you want to remove CO_ADMIN for the user with id ${user.id } ?</p>
								      
								    </div>
								    <div class="modal-footer">
								      <button type="button" class="btn btn-secondary" onclick="CloseDownModal(${count})" id="cancel">Cancel</button>
								      <button type="button" class="btn btn-primary" onclick="RemoveUserCO(${user.id})">Accept!</button>
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
	        <!-- phân trang -->
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
					<div id="paging"></div>
				</div>
			</div>	
	      </sf:form>
	      
	    </main>
	  </div>
	</div>
	
			
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		<!-- Paging -->
		<script src="${base}/js/jquery.simplePagination.js"></script>
		<script type="text/javascript">
			function ShowModal(i) {
				var modal = document.getElementById("myModal"+i);
				modal.style.display = "block";
			}
			function CloseModal(i) {
				var modal = document.getElementById("myModal"+i);
				modal.style.display = "none";
			}
			
			function ShowUpModal(i) {
				var modal = document.getElementById("myUpModal"+i);
				modal.style.display = "block";
			}
			function CloseUpModal(i) {
				var modal = document.getElementById("myUpModal"+i);
				modal.style.display = "none";
			}
			
			function ShowDownModal(i) {
				var modal = document.getElementById("myDownModal"+i);
				modal.style.display = "block";
			}
			function CloseDownModal(i) {
				var modal = document.getElementById("myDownModal"+i);
				modal.style.display = "none";
			}
			
			
			function AddUserCO(userId) {
				// tạo javascript object.  
				var data = {
					id: userId,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/user/addCO",
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
			function RemoveUserCO(userId) {
				// tạo javascript object.  
				var data = {
					id: userId,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/user/removeCO",
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
			
			function BanUser(userId) {
				// tạo javascript object.  
				var data = {
					id: userId,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/user/delete",
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
		
			$( document ).ready(function() {
				
				// đặt giá trị của category ứng với điều kiện search trước đó
				$("#roleId").val(${searchModel.roleId});
				
				$("#paging").pagination({
					currentPage: ${users.currentPage}, //trang hiện tại
			        items: ${users.totalItems},	//tổng số sản phẩm
			        itemsOnPage: ${users.sizeOfPage}, //số sản phẩm trên 1 trang
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
