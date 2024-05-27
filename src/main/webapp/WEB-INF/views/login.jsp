<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    
    <title>Log In</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="${base}/css/style.css" rel="stylesheet" />
    <script src='main.js'></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
    <main class="signin-main">
        <div class="menu_link">
            <ul>
                <li>
                    <a href="home.html">Home</a>
                </li>
                <li>
                    <a href="">/ Login</a>
                </li>
            </ul>
        </div>
        <div class="account">
            <form method="post" action="${base }/login_processing_url" id="form_group">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	
                <h3>login</h3>
                <c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert" style="text-align: center; color: red;">
							Login attempt was not successful, try again!!!
						</div>
				</c:if>
                <div id="account">
                    <p>Username:</p>
                    <input type="text" name="username" class="form_control" id="signin_account" placeholder="Username" required />
                </div>
                <div id="password">
                    <p>Password:</p>
                    <input type="password" name="password" class="form_control" id="signin_password" placeholder="Password" required />
                </div>
                <div class="bottom">
                    <div>
                        <input type="checkbox" name="remember-me" id="login_remember" />
                        <label for="login_remember">Remember me?</label>
                    </div>
                    <button type="submit" name="login" id="login_button">Login</button>
                </div>
                <div id="more_option">
                    <a href="">Forgot password?</a>
                </div>
            </form>
            <div id="more_option">
                <a href="${base }/register">Don't have an account? Register</a>
            </div>
        </div>
    </main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>
	
	 <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	
</body>
</html>