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
        <title>User Management</title>
        
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
                    
					<h1 class="mt-4">Add/Upadte User</h1>
                    <p>

						<sf:form method="post" action="${base}/admin/user/management" modelAttribute="user">
							
							<div class="form-group mb-2" >
								<label for="id">User Id</label>
								<sf:input path="id" id="userId" class="form-control" readonly="true"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="name">Name</label>
								<sf:input path="name" id="name" autocomplete="off" class="form-control"></sf:input>
							</div>
							<div class="form-group mb-2">
								<label for="username">User Name</label>
								<sf:input path="username" id="userame" autocomplete="off" class="form-control"></sf:input>
							</div>
							<div class="form-group mb-2">
								<label for="password">Password</label>
								<sf:input path="password" id="password" autocomplete="off" class="form-control"></sf:input>
							</div>
							<div class="form-group mb-2">
								<label for="email">Email</label>
								<sf:input path="email" id="email" autocomplete="off" class="form-control"></sf:input>
							</div>
							<div class="form-group mb-2">
								<label for="phone">Phone Number</label>
								<sf:input path="phone" id="phone" autocomplete="off" class="form-control"></sf:input>
							</div>
							<div class="form-group mb-2">
								<label for="address">Address</label>
								<sf:input path="shippingAddress" id="address" autocomplete="off" class="form-control"></sf:input>
							</div>
							<h2>
								Roles: 
								<c:forEach items="${user.roles }" var="role">${role.name } </c:forEach>
							</h2>
							
							<a href="${base }/admin/user" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
							<button type="submit" class="btn btn-primary">Save User</button>
						</sf:form>

					</p>                    
                    
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		
		
		
    </body>
</html>
