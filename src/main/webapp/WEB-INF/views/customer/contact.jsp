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
<%-- 	<form action="${base }/contact" method="post" >
			<h2>NOTE:</h2>
			<p>Your Name:</p>
			<input type="text" name="fullname" style="width: 80%" />
			<p>Your Email:</p>
			<input type="email" name="email" style="width: 80%" />
			<p>Subject:</p>
			<input type="text" name="subject" style="width: 80%" />
			<p>Message:</p>
			<textarea style="width: 80%" rows="20" cols="30" name="message"></textarea>
			<button type="submit" class="sendMess">Send Message</button>
		</form> --%>
		
		
		<!-- 
			
			enctype: khi submit form báo lên sẽ có file đính kèm
		-->
 		<sf:form modelAttribute="contact" action="${base }/contact" method="post" enctype="multipart/form-data">
			<h2>NOTE:</h2>
			<p>Your Name:</p>
			<sf:input path="fullName" type="text" name="fullname" style="width: 80%" />
			<p>Your Email:</p>
			<sf:input path="email" type="email" name="email" style="width: 80%" />
			<p>Subject:</p>
			<sf:input path="subject" type="text" name="subject" style="width: 80%" />
			<p>Message:</p>
			<sf:textarea path="message" style="width: 80%" rows="20" cols="30" name="message"></sf:textarea>
			<!-- do spring form không có thẻ file nên phải sử dụng thẻ html input type="file" -->
			<input type="file" class="form-control" id="uploadFile" name="attachment"/>
			
			<button type="submit" class="sendMess">Send Message</button>
		</sf:form>
		
		<!-- Cách 3: sử dụng ajax
		-->
<!-- 		<form>
			<h2>NOTE:</h2>
			<p>Your Name:</p>
			<input type="text" name="fullName" style="width: 80%" id="fullName" />
			<p>Your Email:</p>
			<input type="email" name="email" style="width: 80%" id="email" />
			<p>Subject:</p>
			<input type="text" name="subject" style="width: 80%" id="subject" />
			<p>Message:</p>
			<textarea style="width: 80%" rows="20" cols="30" name="message" id="message"></textarea>
			<button type="button" onclick="callAjax()" class="sendMess">Send Message</button>
			
			<script type="text/javascript">
			function callAjax() {
    			// tạo javascript object để binding với data bên phía controller  
    			var requestBody = {
    				fullName: jQuery("#fullName").val(), // lay theo id
    				email: jQuery("#email").val(), // lay theo id
    				subject: jQuery("#subject").val(),
    				message: jQuery("#message").val(),
    			};

    			// $ === jQuery
    			// json == javascript object
    			jQuery.ajax({
    				url: "${base}/ajax/contact", 	   //->request mapping định nghĩa bên controller
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
		</form> -->
		
	</main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>
	
	    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>