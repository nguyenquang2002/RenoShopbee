<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    
    <title>Register</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="${base}/css/style.css" rel="stylesheet" />
    <script src='main.js'></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/nav.jsp"></jsp:include>
    <main class="signup-main">
        <div class="menu_link">
            <ul>
                <li>
                    <a href="home.html">Home</a>
                </li>
                <li>
                    <a href="">/ Register</a>
                </li>
            </ul>
        </div>
        <div class="account">
            <sf:form method="post" action="${base }/register" modelAttribute="user" id="form_group">
                <h3>Register</h3>
                <div id="user_name">
                    <p>Name:</p>
                    <sf:input path="name" type="text" name="name" class="form_control" id="signup_name" required="required"></sf:input>
                </div>
                <div id="account">
                    <p>Account:</p>
                    <sf:input path="username" type="text" name="username" class="form_control" id="signup_account" autocomplete="none" required="required"></sf:input>
                </div>
                <div id="password">
                    <p>Password:</p>
                    <sf:input path="password" type="password" name="password" class="form_control" id="signup_password" required="required"></sf:input>
                </div>
                <div id="email">
                    <p>Email:</p>
                    <sf:input path="email" type="email" name="email" class="form_control" id="signup_email" required="required"></sf:input>
                </div>
                <div id="phone">
                    <p>Phone Number:</p>
                    <sf:input path="phone" type="text" name="phone_num" class="form_control" id="signup_phone" required="required"></sf:input>
                </div>
                <div class="bottom">
                    <div>
                        <input type="checkbox" name="terms_services" id="signup_terms_services" />
                        <label for="signup_terms_services">Agree to our <a href=""><i>Terms of Services</i></a></label>
                        <br/>
                        <input type="checkbox" name="privacy_policy" id="signup_privacy_policy" />
                        <label for="signup_privacy_policy">Agree to our <a href=""><i>Privacy Policy</i></a></label>
                    </div>
                    <button type="submit" name="signup" id="signup_button">Register</button>
                </div>
            </sf:form>
            <div id="more_option">
                <a href="${base }/login">Already have account? Login</a>
            </div>
        </div>
    </main>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/return_top.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>