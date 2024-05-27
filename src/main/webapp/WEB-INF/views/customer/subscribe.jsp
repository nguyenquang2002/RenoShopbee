<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	
	<title>Insert title here</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="${base}/css/style.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src='main.js'></script>
	<script src="${base }/js/jquery-3.6.0.min.js"></script>
	<style>
		main{
			margin-left: 10%;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
	<main>
		<form>
			<h2>Subscribe:</h2>
			<p>Your Name:</p>
			<input type="text" name="fullName" style="width: 80%" id="fullName" />
			<p>Your Email:</p>
			<input type="email" name="email" style="width: 80%" id="email" />
			<button type="button" onclick="callAjax()" class="subscribe">Subscribe</button>
			
			<script type="text/javascript">
				function callAjax() {
	    			// tạo javascript object để binding với data bên phía controller  
	    			var requestBody = {
	    				fullName: jQuery("#fullName").val(), // lay theo id
	    				email: jQuery("#email").val(), // lay theo id
	    			};
	
	    			// $ === jQuery
	    			// json == javascript object
	    			jQuery.ajax({
	    				url: "${base}/subscribe", 	   //->request mapping định nghĩa bên controller
	    				type: "post",					   //-> method type của Request Mapping	
	    				contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
	    				data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json
	
	    				dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
	    				success: function(jsonResult) {    // gọi ajax thành công
	    					alert(jsonResult.statusCode + " - " + jsonResult.statusMessage);
	    				},
	    				error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
	    					alert("error");
	    				}
	    			});
	    		}
			</script>
		</form>
		
	</main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>
	
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>